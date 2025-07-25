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
    private let contentHeight: CGFloat?
    private let ignoreTrigger: Bool
    @Binding private var isPresented: Bool
    
    @State private var popoverSize: CGSize = .zero
    @State private var contentSize: CGSize = .zero
    @State private var isIntersectingWindow: Bool = true
    @State private var placementState: PopoverPlacement
    
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
        contentHeight: CGFloat? = nil,
        ignoreTrigger: Bool = false,
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
        self.contentHeight = contentHeight
        self.ignoreTrigger = ignoreTrigger
        _placementState = State(initialValue: placement)
    }
    
    public var body: some View {
        ZStack(alignment: .center) {
            content
                .frame(width: appearance.size.width, alignment: .trailing)
                .background(
                    GeometryReader { geo in
                        Color.clear
                            .onAppear { contentSize = geo.size }
                            .onChange(of: geo.size) { newSize in contentSize = newSize }
                    }
                )
                .onPreferenceChange(PopoverSizeKey.self) { size in
                    self.contentSize = size
                }
                .background(appearance.backgroundColor.color(for: colorScheme))
                .shape(pathDrawer: appearance.size.pathDrawer)
                .shadow(appearance.shadow)
            
            if tailEnabled {
                PopoverTailShape(
                    placement: placementState,
                    alignment: alignment,
                    size: currentPopoverSize,
                    tailWidth: appearance.size.tailWidth,
                    tailHeight: appearance.size.tailHeight,
                    tailPadding: tailPadding
                )
                .fill(appearance.backgroundColor.color(for: colorScheme))
            }
        }
        .frame(width: contentSize.width, height: contentSize.height)
        .hiddenIf(!isPresented)
        .background(
            GeometryReader { geo in
                Color.clear
                    .onAppear {
                        popoverSize = geo.size
                    }
                    .onChange(of: geo.size) { newSize in
                        popoverSize = newSize
                    }
            }
        )
        .background(
            GeometryReader { geo in
                Color.clear
                    .onAppear { updateIntersection() }
                    .onChange(of: placementState) { _ in updateIntersection() }
                    .onChange(of: alignment) { _ in updateIntersection() }
                    .onChange(of: popoverSize) { _ in updateIntersection() }
            }
        )
        .onPreferenceChange(PopoverSizeKey.self) { size in
            self.popoverSize = size
        }
        .offset(offset(
            placement: placementState,
            alignment: alignment,
            popoverSize: currentPopoverSize,
            triggerSize: popoverSizeCalculator.frame.size
        ))
        .onChange(of: placement) { newValue in
            placementState = newValue
        }
        .autoClose(duration: duration) {
            guard isPresented else { return }
            isPresented = false
            onClose?()
        }
    }
    
    private var tailPadding: CGFloat {
        appearance.size.tailPadding
    }

    private func offset(
        placement: PopoverPlacement,
        alignment: PopoverAlignment,
        popoverSize: CGSize,
        triggerSize: CGSize
    ) -> CGSize {
        let isLandscape: Bool = UIScreen.main.bounds.width > UIScreen.main.bounds.height
        let verticalExtraOffset: CGFloat = 0
        let triggerWidthFactor: CGFloat = ignoreTrigger ? 1.0 : 2.0
        
        switch placement {
        case .top:
            switch alignment {
            case .start:
                let offset = triggerCentered ? (triggerSize.width / 2 - tailPadding - appearance.size.tailWidth / 2) : 0
                return CGSize(
                    width: popoverSize.width / 2 - triggerSize.width / triggerWidthFactor + offset,
                    height: -popoverSize.height / 2 - tailOffset - triggerSize.height / 2 - appearance.size.offset - verticalExtraOffset
                )
            case .center:
                return CGSize(
                    width: 0,
                    height: -popoverSize.height / 2 - tailOffset - triggerSize.height / 2 - appearance.size.offset - verticalExtraOffset)
            case .end:
                let offset = triggerCentered ? (triggerSize.width / 2 - tailPadding - appearance.size.tailWidth / 2) : 0
                return CGSize(
                    width: -popoverSize.width / 2 + triggerSize.width / triggerWidthFactor - offset,
                    height: -popoverSize.height / 2 - tailOffset - triggerSize.height / 2 - appearance.size.offset - verticalExtraOffset
                )
            }
        case .bottom:
            switch alignment {
            case .start:
                let offset = triggerCentered ? (triggerSize.width / 2 - tailPadding - appearance.size.tailWidth / 2) : 0
                return CGSize(
                    width: popoverSize.width / 2 - triggerSize.width / triggerWidthFactor + offset,
                    height: popoverSize.height / 2 + tailOffset + triggerSize.height / 2 + appearance.size.offset + verticalExtraOffset
                )
            case .center:
                return CGSize(
                    width: 0,
                    height: popoverSize.height / 2 + tailOffset + triggerSize.height / 2 + appearance.size.offset + verticalExtraOffset
                )
            case .end:
                let offset = triggerCentered ? (triggerSize.width / 2 - tailPadding - appearance.size.tailWidth / 2) : 0
                return CGSize(
                    width: -popoverSize.width / 2 + triggerSize.width / triggerWidthFactor - offset,
                    height: popoverSize.height / 2 + tailOffset + triggerSize.height / 2 + appearance.size.offset + verticalExtraOffset
                )
            }
        case .start:
            switch alignment {
            case .start:
                let offset = triggerCentered ? (triggerSize.height / 2 - tailPadding - appearance.size.tailWidth / 2) : 0
                return CGSize(
                    width: -popoverSize.width / 2 - tailOffset - triggerSize.width / 2 - appearance.size.offset,
                    height: popoverSize.height / 2 - triggerSize.height / triggerWidthFactor + offset + verticalExtraOffset
                )
            case .center:
                return CGSize(
                    width: -popoverSize.width / 2 - tailOffset - triggerSize.width / 2 - appearance.size.offset,
                    height: 0 + verticalExtraOffset
                )
            case .end:
                let offset = triggerCentered ? (triggerSize.height / 2 - tailPadding - appearance.size.tailWidth / 2) : 0
                return CGSize(
                    width: -popoverSize.width / 2 - tailOffset - triggerSize.width / 2 - appearance.size.offset,
                    height: -popoverSize.height / 2 + triggerSize.height / triggerWidthFactor - offset + verticalExtraOffset
                )
            }
        case .end:
            switch alignment {
            case .start:
                let offset = triggerCentered ? (triggerSize.height / 2 - tailPadding - appearance.size.tailWidth / 2) : 0
                return CGSize(
                    width: popoverSize.width / 2 + tailOffset + triggerSize.width / 2 + appearance.size.offset,
                    height: popoverSize.height / 2 - triggerSize.height / triggerWidthFactor + offset + verticalExtraOffset
                )
            case .center:
                return CGSize(
                    width: popoverSize.width / 2 + tailOffset + triggerSize.width / 2 + appearance.size.offset,
                    height: 0 + verticalExtraOffset
                )
            case .end:
                let offset = triggerCentered ? (triggerSize.height / 2 - tailPadding - appearance.size.tailWidth / 2) : 0
                return CGSize(
                    width: popoverSize.width / 2 + tailOffset + triggerSize.width / 2 + appearance.size.offset,
                    height: -popoverSize.height / 2 + triggerSize.height / triggerWidthFactor - offset + verticalExtraOffset
                )
            }
        }
    }
    
    private var tailOffset: CGFloat {
        tailEnabled ? appearance.size.tailHeight : 0
    }

    private func updateIntersection() {
        print(currentPopoverSize)
        let isFullyInside = fits(
            placement: placementState,
            popoverSize: currentPopoverSize
        )
        if !isFullyInside && placementMode == .loose {
            let newPlacement = bestPlacement(
                initial: placementState,
                popoverSize: currentPopoverSize
            )
            placementState = newPlacement
        }
    }

    private func bestPlacement(initial: PopoverPlacement, popoverSize: CGSize) -> PopoverPlacement {
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
        if let opp = opposite[initial], fits(placement: opp, popoverSize: popoverSize) {
            return opp
        }
        // 2. Пробуем остальные по часовой стрелке
        for placement in clockwise where placement != initial && placement != opposite[initial] {
            if fits(placement: placement, popoverSize: popoverSize) {
                return placement
            }
        }
        // 3. Если ничего не подошло — возвращаем исходный
        return initial
    }

    private func fits(placement: PopoverPlacement, popoverSize: CGSize) -> Bool {
        guard let window = UIApplication.shared.keyWindow else {
            return false
        }
        
        let screenBounds = window.bounds
        let triggerFrame = popoverSizeCalculator.frame
        let offset = offset(
            placement: placement,
            alignment: alignment,
            popoverSize: popoverSize,
            triggerSize: popoverSizeCalculator.frame.size
        )
        let popoverOrigin = CGPoint(
            x: triggerFrame.origin.x + offset.width - triggerFrame.width / 2,
            y: triggerFrame.origin.y + offset.height - triggerFrame.height / 2 - popoverSize.height / 2
        )
        let popoverFrame = CGRect(origin: popoverOrigin, size: popoverSize)

        let result = screenBounds.contains(popoverFrame)
        
        return result
    }
    
    private var currentPopoverSize: CGSize {
        if let contentHeight = contentHeight {
            return CGSize(width: popoverSize.width, height: popoverSize.height)
        }
        return popoverSize
    }

}
