import SwiftUI
import SDDSThemeCore

public enum PopoverTailPosition: String, CaseIterable {
    case top
    case bottom
    case left
    case right
}

public enum PopoverPlacement: String, CaseIterable {
    case start
    case end
    case top
    case bottom
}

public enum PopoverAlignment: String, CaseIterable {
    case start
    case center
    case end
}

public enum PopoverPlacementMode: String, CaseIterable {
    case strict
    case loose
}

// MARK: - Environment Keys
struct SDDSPopover<Content: View>: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    private let appearance: PopoverAppearance
    private let alignment: PopoverAlignment
    private let placement: PopoverPlacement
    private let tailEnabled: Bool
    private let triggerCentered: Bool
    private let placementMode: PopoverPlacementMode
    private let duration: TimeInterval?
    private let onClose: (() -> Void)?
    private let content: Content
    private let popoverSizeCalculator: PopoverSizeCalculator
    @Binding private var isPresented: Bool
    
    @State private var timer: Timer?
    @State private var popoverSize: CGSize = .zero
    @State private var isIntersectingWindow: Bool = true
    @State private var placementState: PopoverPlacement
    @State private var autoCloseTimer: Timer?
    
    init(
        isPresented: Binding<Bool>,
        appearance: PopoverAppearance,
        placement: PopoverPlacement = .top,
        alignment: PopoverAlignment = .start,
        tailEnabled: Bool = true,
        triggerCentered: Bool = false,
        placementMode: PopoverPlacementMode = .loose,
        duration: TimeInterval? = nil,
        popoverSizeCalculator: PopoverSizeCalculator,
        onClose: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._isPresented = isPresented
        self.appearance = appearance
        self.placement = placement
        self.alignment = alignment
        self.tailEnabled = tailEnabled
        self.triggerCentered = triggerCentered
        self.placementMode = placementMode
        self.duration = duration
        self.onClose = onClose
        self.content = content()
        self.popoverSizeCalculator = popoverSizeCalculator
        _placementState = State(initialValue: placement)
    }
    
    public var body: some View {
        ZStack {
            ZStack {
                PopoverTailShape(
                    placement: placementState,
                    alignment: alignment,
                    size: popoverSize,
                    tailWidth: appearance.size.tailWidth,
                    tailHeight: appearance.size.tailHeight,
                    tailPadding: tailPadding
                )
                .fill(appearance.backgroundColor.color(for: colorScheme))
                
                content
                    .frame(width: appearance.size.width, alignment: .trailing)
                    .background(appearance.backgroundColor.color(for: colorScheme))
                    .shape(pathDrawer: appearance.size.pathDrawer)
            }
            .shadow(appearance.shadow)
            
            PopoverTailShape(
                placement: placementState,
                alignment: alignment,
                size: popoverSize,
                tailWidth: appearance.size.tailWidth,
                tailHeight: appearance.size.tailHeight,
                tailPadding: tailPadding
            )
            .fill(appearance.backgroundColor.color(for: colorScheme))

        }
        .hiddenIf(!isPresented)
        .background(
            GeometryReader { geo in
                Color.clear
                    .onAppear { popoverSize = geo.size }
                    .onChange(of: geo.size) { newSize in popoverSize = newSize }
            }
        )
        .background(
            GeometryReader { geo in
                Color.clear
                    .onAppear { updateIntersection(geo: geo) }
                    .onChange(of: placementState) { _ in updateIntersection(geo: geo) }
                    .onChange(of: alignment) { _ in updateIntersection(geo: geo) }
                    .onChange(of: popoverSize) { _ in updateIntersection(geo: geo) }
                    .onChange(of: isIntersectingWindow) { newValue in
                        if newValue && placementMode == .loose {
                            let newPlacement = bestPlacement(
                                initial: placementState,
                                popoverSize: popoverSize,
                                geo: geo
                            )
                            placementState = newPlacement
                        }
                    }
            }
        )
        .onPreferenceChange(PopoverSizeKey.self) { size in
            self.popoverSize = size
        }
        .offset(offset(
            placement: placementState,
            alignment: alignment,
            popoverSize: popoverSize,
            triggerSize: popoverSizeCalculator.frame.size
        ))
        .onChange(of: placement) { newValue in
            placementState = newValue
        }
        .onChange(of: isPresented) { newValue in
            if newValue {
                if let duration = duration {
                    autoCloseTimer = Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { _ in
                        guard isPresented else { return }
                        isPresented = false
                        onClose?()
                    }
                }
            } else {
                autoCloseTimer?.invalidate()
                autoCloseTimer = nil
            }
        }
    }
    
    private var tailPadding: CGFloat {
        triggerCentered ? (popoverSizeCalculator.frame.size.width - appearance.size.tailWidth) / 2 : appearance.size.tailPadding
    }

    private func offset(
        placement: PopoverPlacement,
        alignment: PopoverAlignment,
        popoverSize: CGSize,
        triggerSize: CGSize
    ) -> CGSize {
        switch placement {
        case .top:
            switch alignment {
            case .start:
                return CGSize(width: 0, height: -popoverSize.height - appearance.size.tailHeight)
            case .center:
                return CGSize(width: -(popoverSize.width - triggerSize.width) / 2, height: -popoverSize.height - appearance.size.tailHeight)
            case .end:
                return CGSize(width: -(popoverSize.width - triggerSize.width), height: -popoverSize.height - appearance.size.tailHeight)
            }
        case .bottom:
            switch alignment {
            case .start:
                return CGSize(width: 0, height: triggerSize.height + appearance.size.tailHeight)
            case .center:
                return CGSize(width: -(popoverSize.width - triggerSize.width) / 2, height: triggerSize.height + appearance.size.tailHeight)
            case .end:
                return CGSize(width: -(popoverSize.width - triggerSize.width), height: triggerSize.height + appearance.size.tailHeight)
            }
        case .start:
            switch alignment {
            case .start:
                return CGSize(width: -popoverSize.width - appearance.size.tailHeight, height: 0)
            case .center:
                return CGSize(width: -popoverSize.width - appearance.size.tailHeight, height: -(popoverSize.height - triggerSize.height) / 2)
            case .end:
                return CGSize(width: -popoverSize.width - appearance.size.tailHeight, height: -(popoverSize.height - triggerSize.height))
            }
        case .end:
            switch alignment {
            case .start:
                return CGSize(width: triggerSize.width + appearance.size.tailHeight, height: 0)
            case .center:
                return CGSize(width: triggerSize.width + appearance.size.tailHeight, height: -(popoverSize.height - triggerSize.height) / 2)
            case .end:
                return CGSize(width: triggerSize.width + appearance.size.tailHeight, height: -(popoverSize.height - triggerSize.height))
            }
        }
    }

    private func updateIntersection(geo: GeometryProxy) {
        let popoverFrame = geo.frame(in: .global)
        let screenBounds = UIScreen.main.bounds
        isIntersectingWindow = !screenBounds.contains(popoverFrame)
    }

    private func bestPlacement(initial: PopoverPlacement, popoverSize: CGSize, geo: GeometryProxy) -> PopoverPlacement {
        let placements: [PopoverPlacement] = [.top, .end, .bottom, .start]
        let clockwise: [PopoverPlacement] = {
            switch initial {
            case .top: return [.top, .end, .bottom, .start]
            case .end: return [.end, .bottom, .start, .top]
            case .bottom: return [.bottom, .start, .top, .end]
            case .start: return [.start, .top, .end, .bottom]
            }
        }()
        let opposite: [PopoverPlacement: PopoverPlacement] = [
            .top: .bottom, .bottom: .top, .start: .end, .end: .start
        ]
        // 1. Пробуем противоположный
        if let opp = opposite[initial], fits(placement: opp, popoverSize: popoverSize, geo: geo) {
            return opp
        }
        // 2. Пробуем остальные по часовой стрелке
        for placement in clockwise where placement != initial && placement != opposite[initial] {
            if fits(placement: placement, popoverSize: popoverSize, geo: geo) {
                return placement
            }
        }
        // 3. Если ничего не подошло — возвращаем исходный
        return initial
    }

    private func fits(placement: PopoverPlacement, popoverSize: CGSize, geo: GeometryProxy) -> Bool {
        let screenBounds = UIScreen.main.bounds
        let currentFrame = geo.frame(in: .global)
        let offset = offset(
            placement: placement,
            alignment: alignment,
            popoverSize: popoverSize,
            triggerSize: popoverSizeCalculator.frame.size
        )
        let potentialFrame = currentFrame.offsetBy(dx: offset.width, dy: offset.height)
        return screenBounds.contains(potentialFrame)
    }

}
