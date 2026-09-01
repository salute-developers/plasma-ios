import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `SDDSWheel` - компонент для выбора значений с помощью вращающихся колес.

 Компонент поддерживает:
 - Несколько колес для выбора различных значений
 - Настраиваемое количество видимых элементов
 - Различные варианты выравнивания элементов
 - Дополнительный текст и описания для каждого колеса
 - Иконки управления (вверх/вниз)
 - Разделители между колесами
 - Эффекты масштабирования и прозрачности при прокрутке

 # Пример использования:
 ```swift
 SDDSWheel(
     wheels: [
         WheelData(items: ["01", "02", "03", ...], description: "День"),
         WheelData(items: ["Январь", "Февраль", "Март", ...], description: "Месяц"),
         WheelData(items: ["2020", "2021", "2022", ...], description: "Год")
     ],
     selection: $selectedValues,
     wheelCount: 3,
     visibleItemsCount: 5
 )
 .wheelAppearance(appearance)
 ```
 */
public struct SDDSWheel: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    @Environment(\.wheelAppearance) private var appearance
    @Environment(\.layoutDirection) private var layoutDirection

    private let wheels: [WheelData]
    @Binding private var selection: [Int]
    private let wheelCount: Int
    private let visibleItemsCount: Int

    public init(
        wheels: [WheelData],
        selection: Binding<[Int]>,
        wheelCount: Int,
        visibleItemsCount: Int
    ) {
        self.wheels = wheels
        self._selection = selection
        self.wheelCount = wheelCount
        self.visibleItemsCount = visibleItemsCount
    }

    public var body: some View {
        HStack(spacing: 0) {
            ForEach(Array(wheels.indices), id: \.self) { index in
                wheelWithControls(at: index)

                if index < wheels.count - 1 {
                    let metrics = metrics(for: index)
                    wheelSeparator(height: metrics.columnHeight, wheel: wheels[index], metrics: metrics)
                }
            }
        }
        .background(selectionIndicator())
    }

    /// Индикатор выбранного элемента — одна подложка на всё колесо, включая разделители.
    /// Портирует `Wheel.drawBehind` из Compose: полоса рисуется на всём `WheelLayout`,
    /// а не по колонкам.
    @ViewBuilder
    private func selectionIndicator() -> some View {
        let size = appearance.size
        if size.selectionIndicatorEnabled, !wheels.isEmpty {
            let isRTL = layoutDirection == .rightToLeft
            let leading = isRTL ? size.selectionIndicatorPaddingEnd : size.selectionIndicatorPaddingStart
            let trailing = isRTL ? size.selectionIndicatorPaddingStart : size.selectionIndicatorPaddingEnd
            let content = wheels.indices.reduce(CGFloat(0)) { acc, index in
                let m = metrics(for: index)
                return max(acc, m.itemBoxHeight)
            }
            let height = max(0, content + size.selectionIndicatorPaddingTop + size.selectionIndicatorPaddingBottom)

            GeometryReader { proxy in
                RoundedRectangle(cornerRadius: size.selectionIndicatorShape)
                    .fill(currentColor(for: appearance.selectionIndicatorColor))
                    .frame(width: max(0, proxy.size.width + leading + trailing), height: height)
                    .offset(x: -leading, y: (proxy.size.height - height) / 2)
            }
        }
    }

    @ViewBuilder
    private func wheelWithControls(at index: Int) -> some View {
        let metrics = metrics(for: index)
        let width = metrics.columnWidth
        let frameAlignment = textAlignment(for: index)

        VStack(spacing: appearance.size.itemMinSpacing) {
            controlIconUp(for: index, width: width, alignment: frameAlignment)

            WheelColumnView(
                wheel: wheels[index],
                selection: selectionBinding(for: index),
                visibleItemsCount: visibleItemsCount,
                wheelIndex: index,
                totalWheels: wheels.count
            )

            controlIconDown(for: index, width: width, alignment: frameAlignment)
        }
        .frame(maxWidth: shouldStretch(at: index) ? .infinity : width, alignment: frameAlignment)
    }

    /// Портирует `shouldStretchWheel` из Compose: при `mixed` тянутся только крайние колонки,
    /// в остальных выравниваниях — все.
    private func shouldStretch(at index: Int) -> Bool {
        appearance.size.itemAlignment != .mixed || index == 0 || index == wheels.count - 1
    }

    @ViewBuilder
    private func controlIconUp(for index: Int, width: CGFloat, alignment: Alignment) -> some View {
        if let controlIconUp = appearance.controlIconUp {
            let iconSize = appearance.size.controlIconUpSize
            Button(
                action: { scrollUp(wheelIndex: index) },
                label: {
                    if iconSize > 0 {
                        controlIconUp
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: iconSize, height: iconSize)
                            .foregroundColor(currentColor(for: appearance.controlIconUpColor))
                    } else {
                        controlIconUp
                            .renderingMode(.template)
                            .foregroundColor(currentColor(for: appearance.controlIconUpColor))
                    }
                }
            )
            .buttonStyle(PlainButtonStyle())
            .frame(width: width, alignment: alignment)
        }
    }

    @ViewBuilder
    private func controlIconDown(for index: Int, width: CGFloat, alignment: Alignment) -> some View {
        if let controlIconDown = appearance.controlIconDown {
            let iconSize = appearance.size.controlIconDownSize
            Button(
                action: { scrollDown(wheelIndex: index) },
                label: {
                    if iconSize > 0 {
                        controlIconDown
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: iconSize, height: iconSize)
                            .foregroundColor(currentColor(for: appearance.controlIconDownColor))
                    } else {
                        controlIconDown
                            .renderingMode(.template)
                            .foregroundColor(currentColor(for: appearance.controlIconDownColor))
                    }
                }
            )
            .buttonStyle(PlainButtonStyle())
            .frame(width: width, alignment: alignment)
        }
    }

    @ViewBuilder
    private func wheelSeparator(height: CGFloat, wheel: WheelData, metrics: WheelMetrics) -> some View {
        ZStack {
            Color.clear
                .frame(width: appearance.size.separatorSpacing, height: height)

            switch appearance.dividerStyle {
            case .empty:
                EmptyView()

            case .dots:
                VStack(spacing: 0) {
                    Color.clear.frame(height: metrics.centerY - metrics.itemBoxHeight / 2)
                    Text(":")
                        .foregroundColor(currentColor(for: appearance.itemTextColor))
                        .typography(metrics.itemTextTypography)
                        .frame(height: metrics.itemHeight)
                    Spacer(minLength: 0)
                }

            case .divider:
                if let dividerAppearance = appearance.dividerAppearance {
                    SDDSDivider(appearance: dividerAppearance)
                        .frame(width: height)
                        .rotationEffect(.degrees(90))
                }
            }
        }
        .frame(width: appearance.size.separatorSpacing, height: height)
    }

    private func scrollUp(wheelIndex index: Int) {
        guard index < selection.count, index < wheels.count else { return }
        let current = clamp(selection[index], count: wheels[index].items.count)
        if current > 0 { selection[index] = current - 1 }
    }

    private func scrollDown(wheelIndex index: Int) {
        guard index < selection.count, index < wheels.count else { return }
        let count = wheels[index].items.count
        let current = clamp(selection[index], count: count)
        if current < count - 1 { selection[index] = current + 1 }
    }

    private func metrics(for index: Int) -> WheelMetrics {
        WheelMetrics(appearance: appearance, visibleItemsCount: visibleItemsCount, wheel: wheels[index])
    }

    private func selectionBinding(for index: Int) -> Binding<Int> {
        Binding(
            get: { index < selection.count ? selection[index] : 0 },
            set: { newValue in if index < selection.count { selection[index] = newValue } }
        )
    }

    private func clamp(_ index: Int, count: Int) -> Int {
        guard count > 0 else { return 0 }
        return min(max(index, 0), count - 1)
    }

    private func textAlignment(for index: Int) -> Alignment {
        switch wheelHorizontalAlignment(appearance.size.itemAlignment, wheelIndex: index, totalWheels: wheels.count) {
        case .leading: return .leading
        case .trailing: return .trailing
        default: return .center
        }
    }

    private func currentColor(for colorToken: ColorToken) -> Color {
        colorToken.color(for: colorScheme, subtheme: subtheme)
    }

    private func currentColor(for buttonColor: ButtonColor) -> Color {
        buttonColor.color(for: [], colorScheme: colorScheme, subtheme: subtheme)
    }
}

public struct WheelData: Identifiable {
    public let id = UUID()
    public let items: [WheelItem]
    public let description: String?

    public init(items: [WheelItem], description: String? = nil) {
        self.items = items
        self.description = description
    }

    public init(items: [String], description: String? = nil) {
        self.items = items.map { WheelItem(text: $0) }
        self.description = description
    }
}

public struct WheelItem {
    public let text: String
    public let textAfter: String?

    public init(text: String, textAfter: String? = nil) {
        self.text = text
        self.textAfter = textAfter
    }
}

public extension View {
    func wheelAppearance(_ appearance: WheelAppearance) -> some View {
        environment(\.wheelAppearance, appearance)
    }
}
