import Foundation
import QuartzCore
import SwiftUI
@_exported import SDDSThemeCore

struct WheelColumnView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    @Environment(\.wheelAppearance) private var appearance

    let wheel: WheelData
    @Binding var selection: Int
    let visibleItemsCount: Int
    let wheelIndex: Int
    let totalWheels: Int

    @StateObject private var animator = WheelScrollAnimator()
    @State private var isDragging = false
    @State private var dragStartOffset: CGFloat = 0
    @State private var didInit = false
    @State private var selfDriven = false

    private var metrics: WheelMetrics {
        WheelMetrics(appearance: appearance, visibleItemsCount: visibleItemsCount, wheel: wheel)
    }
    private var pitch: CGFloat { metrics.pitch }
    private var itemCount: Int { wheel.items.count }
    private var maxOffset: CGFloat { CGFloat(max(0, itemCount - 1)) * pitch }

    var body: some View {
        let offset = animator.offset
        let m = metrics

        ZStack(alignment: .top) {
            Color.clear
                .frame(width: m.columnWidth, height: m.columnHeight)
                .contentShape(Rectangle())

            ForEach(0..<itemCount, id: \.self) { index in
                itemView(at: index, offset: offset, metrics: m)
            }

            descriptionStaticLayer(offset: offset, metrics: m)
        }
        .frame(width: m.columnWidth, height: m.columnHeight)
        .clipped()
        .contentShape(Rectangle())
        .gesture(dragGesture)
        .onAppear { setupAnimator() }
        .onChange(of: selection) { newValue in
            if selfDriven { selfDriven = false; return }
            guard !isDragging else { return }
            let target = CGFloat(clampIndex(newValue)) * pitch
            guard abs(target - animator.offset) > 0.5 else { return }
            animator.animate(to: target, from: animator.offset, omega: 12)
        }
    }

    private func setupAnimator() {
        animator.onSettle = { target in
            let idx = clampIndex(Int((target / pitch).rounded()))
            if selection != idx {
                selfDriven = true
                selection = idx
            }
        }
        if !didInit {
            animator.setImmediate(CGFloat(clampIndex(selection)) * pitch)
            didInit = true
        }
    }

    @ViewBuilder
    private func itemView(at index: Int, offset: CGFloat, metrics m: WheelMetrics) -> some View {
        let item = wheel.items[index]
        let displacement = CGFloat(index) * pitch - offset
        let distance = abs(displacement)
        let scale = scaleByDistance(distance, centerY: m.centerY)
        let alpha = alphaByDistance(distance, centerY: m.centerY)
        let isCentral = index == centeredIndex(for: offset)
        let frameAlignment = textAlignment()
        let scaleAnchor = scaleAnchorPoint()
        // Компенсация описания: у элементов ВЫШЕ центра заголовок съезжает вниз на высоту
        // описания, схлопывая зарезервированное под него пустое место. Портирует
        // `itemTitleTranslationY` из Compose (`descriptionCompensationFactor` без abs,
        // поэтому ниже центра сдвиг нулевой).
        let descriptionCompensation = m.descriptionExtraHeight
            * min(max(-displacement / m.itemBoxHeight, 0), 1)
        let topY = m.centerY - m.itemBoxHeight / 2 + displacement + descriptionCompensation

        HStack(spacing: appearance.size.itemTextAfterPadding) {
            Text(item.text)
                .fixedSize(horizontal: true, vertical: false)
                .foregroundColor(currentColor(for: appearance.itemTextColor))
                .typography(m.itemTextTypography)

            if let textAfter = item.textAfter, !textAfter.isEmpty {
                Text(textAfter)
                    .fixedSize(horizontal: true, vertical: false)
                    .foregroundColor(currentColor(for: appearance.itemTextAfterColor))
                    .typography(m.itemTextAfterTypography)
            }
        }
        .scaleEffect(scale, anchor: scaleAnchor)
        .opacity(isCentral ? 1.0 : alpha)
        .frame(width: m.columnWidth, height: m.itemHeight, alignment: frameAlignment)
        .offset(y: topY)
    }

    @ViewBuilder
    private func descriptionStaticLayer(offset: CGFloat, metrics m: WheelMetrics) -> some View {
        if let description = wheel.description, !description.isEmpty {
            VStack(spacing: 0) {
                Color.clear.frame(height: m.centerY - m.itemBoxHeight / 2)
                VStack(spacing: 0) {
                    Color.clear.frame(height: m.itemHeight)
                    Text(description)
                        .foregroundColor(currentColor(for: appearance.descriptionColor))
                        .typography(m.descriptionTypography)
                        .frame(width: m.columnWidth, alignment: textAlignment())
                        .padding(.top, appearance.size.descriptionPadding)
                }
                Spacer(minLength: 0)
            }
            .frame(width: m.columnWidth, height: m.columnHeight)
            .allowsHitTesting(false)
        }
    }

    private var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { value in
                if !isDragging {
                    isDragging = true
                    animator.stop()
                    dragStartOffset = animator.offset
                }
                let raw = dragStartOffset - value.translation.height
                animator.setImmediate(rubberBanded(raw))
            }
            .onEnded { value in
                isDragging = false
                let predictedOffset = dragStartOffset - value.predictedEndTranslation.height
                let clamped = min(max(predictedOffset, 0), maxOffset)
                let targetIndex = clampIndex(Int((clamped / pitch).rounded()))
                let target = CGFloat(targetIndex) * pitch
                animator.animate(to: target, from: animator.offset, omega: 12)
                if selection != targetIndex {
                    selfDriven = true
                    selection = targetIndex
                }
            }
    }

    private func rubberBanded(_ raw: CGFloat) -> CGFloat {
        if raw < 0 {
            return raw * 0.35
        } else if raw > maxOffset {
            return maxOffset + (raw - maxOffset) * 0.35
        }
        return raw
    }

    private func scaleByDistance(_ distance: CGFloat, centerY: CGFloat) -> CGFloat {
        guard centerY > 0 else { return 1.0 }
        let factor = min(abs(distance) / centerY, 1.5)
        return 1.0 - 0.3 * factor
    }

    private func alphaByDistance(_ distance: CGFloat, centerY: CGFloat) -> CGFloat {
        guard centerY > 0 else { return 1.0 }
        let factor = min(abs(distance) / centerY, 1.5)
        return 1.0 - 0.8 * min(factor, 1.0)
    }

    private func centeredIndex(for offset: CGFloat) -> Int {
        clampIndex(Int((offset / pitch).rounded()))
    }

    private func clampIndex(_ index: Int) -> Int {
        guard itemCount > 0 else { return 0 }
        return min(max(index, 0), itemCount - 1)
    }

    private func scaleAnchorPoint() -> UnitPoint {
        switch alignmentValue() {
        case .leading: return .leading
        case .trailing: return .trailing
        default: return .center
        }
    }

    private func alignmentValue() -> HorizontalAlignment {
        wheelHorizontalAlignment(appearance.size.itemAlignment, wheelIndex: wheelIndex, totalWheels: totalWheels)
    }

    private func textAlignment() -> Alignment {
        switch alignmentValue() {
        case .leading: return .leading
        case .trailing: return .trailing
        default: return .center
        }
    }

    private func currentColor(for colorToken: ColorToken) -> Color {
        colorToken.color(for: colorScheme, subtheme: subtheme)
    }
}

struct WheelMetrics {
    let appearance: WheelAppearance
    let visibleItemsCount: Int
    let wheel: WheelData

    var itemTextTypography: TypographyToken {
        guard let typography = appearance.itemTextTypography.typography(with: appearance.size) else {
            fatalError("Undefined Wheel Typography for size \(appearance.size.debugDescription).")
        }
        return typography
    }

    var itemTextAfterTypography: TypographyToken {
        guard let typography = appearance.itemTextAfterTypography.typography(with: appearance.size) else {
            fatalError("Undefined Wheel Typography for size \(appearance.size.debugDescription).")
        }
        return typography
    }

    var descriptionTypography: TypographyToken {
        guard let typography = appearance.descriptionTypography.typography(with: appearance.size) else {
            fatalError("Undefined Wheel Typography for size \(appearance.size.debugDescription).")
        }
        return typography
    }

    var itemHeight: CGFloat { itemTextTypography.lineHeight }
    var spacing: CGFloat { appearance.size.itemMinSpacing }
    /// Бокс элемента: описание резервирует место у каждого элемента, как в `Item` из Compose
    /// (`.padding(vertical: itemSpacing / 2)` + описание внутри той же `Column`).
    var itemBoxHeight: CGFloat { itemHeight + descriptionExtraHeight }
    var pitch: CGFloat { itemBoxHeight + spacing }
    var baseHeight: CGFloat { CGFloat(visibleItemsCount) * itemBoxHeight }
    var spacingHeight: CGFloat { CGFloat(max(0, visibleItemsCount - 1)) * spacing }
    var centerY: CGFloat { (baseHeight + spacingHeight) / 2 }

    var descriptionExtraHeight: CGFloat {
        guard let description = wheel.description, !description.isEmpty else { return 0 }
        return appearance.size.descriptionPadding + descriptionTypography.lineHeight
    }
    var columnHeight: CGFloat { baseHeight + spacingHeight }

    var columnWidth: CGFloat {
        let maxWidth = wheel.items.reduce(0.0) { acc, item in
            var total = textWidth(item.text, typography: itemTextTypography)
            if let textAfter = item.textAfter, !textAfter.isEmpty {
                total += appearance.size.itemTextAfterPadding
                    + textWidth(textAfter, typography: itemTextAfterTypography)
            }
            return max(acc, total)
        }
        if let description = wheel.description, !description.isEmpty {
            return max(maxWidth, textWidth(description, typography: descriptionTypography))
        }
        return maxWidth
    }

    func textWidth(_ text: String, typography: TypographyToken) -> CGFloat {
        text.size(withAttributes: [.font: typography.uiFont]).width
    }
}

func wheelHorizontalAlignment(
    _ itemAlignment: WheelItemAlignment,
    wheelIndex: Int,
    totalWheels: Int
) -> HorizontalAlignment {
    switch itemAlignment {
    case .start:
        return .leading
    case .end:
        return .trailing
    case .center:
        return .center
    case .mixed:
        if totalWheels == 1 {
            return .center
        } else if wheelIndex == 0 {
            return .trailing
        } else if wheelIndex == totalWheels - 1 {
            return .leading
        } else {
            return .center
        }
    }
}

final class WheelScrollAnimator: ObservableObject {
    @Published var offset: CGFloat = 0

    private var link: CADisplayLink?
    private var x0: CGFloat = 0
    private var v0: CGFloat = 0
    private var target: CGFloat = 0
    private var omega: CGFloat = 12
    private var startTime: CFTimeInterval = 0

    var onSettle: ((CGFloat) -> Void)?

    func setImmediate(_ value: CGFloat) {
        stop()
        offset = value
    }

    func animate(to target: CGFloat, from: CGFloat, omega: CGFloat = 12) {
        stop()
        self.x0 = from
        self.target = target
        self.omega = omega
        self.v0 = omega * (target - from)
        self.offset = from
        self.startTime = CACurrentMediaTime()
        let link = CADisplayLink(target: self, selector: #selector(step(_:)))
        link.add(to: .main, forMode: .common)
        self.link = link
    }

    @objc private func step(_ link: CADisplayLink) {
        let t = link.timestamp - startTime
        let a = Double(x0 - target)
        let b = Double(v0) + Double(omega) * a
        let e = exp(-Double(omega) * t)
        let x = Double(target) + (a + b * t) * e
        let v = (b - Double(omega) * (a + b * t)) * e
        offset = CGFloat(x)
        if abs(x - Double(target)) < 0.5 && abs(v) < 5 {
            offset = target
            stop()
            onSettle?(target)
        }
    }

    func stop() {
        link?.invalidate()
        link = nil
    }

    deinit {
        link?.invalidate()
    }
}
