import SwiftUI

struct FormItemIndicatorOverlay: ViewModifier {
    let appearance: FormItemAppearance
    let enabled: Bool
    let horizontalMode: FormIndicatorAlignmentMode

    func body(content: Content) -> some View {
        content.overlay(alignment: appearance.indicatorAlignment.alignment) {
            SDDSIndicator(appearance: appearance.indicatorAppearance)
                .offset(x: horizontalOffset, y: verticalOffset)
                .opacity(enabled ? 1 : appearance.disableAlpha)
        }
    }

    private var horizontalDirection: CGFloat {
        if horizontalMode == .inner, appearance.titlePlacement == .none {
            switch appearance.indicatorAlignment {
            case .topStart, .centerStart, .bottomStart:
                return -1
            case .topEnd, .centerEnd, .bottomEnd:
                return 1
            case .topCenter, .center, .bottomCenter:
                return 0
            }
        }

        switch appearance.indicatorAlignment {
        case .topStart, .centerStart, .bottomStart:
            return horizontalMode == .inner ? 1 : -1
        case .topEnd, .centerEnd, .bottomEnd:
            return horizontalMode == .inner ? -1 : 1
        case .topCenter, .center, .bottomCenter:
            return 0
        }
    }

    private var isContentRequiredStartInner: Bool {
        appearance.titlePlacement == .none &&
        appearance.indicatorAlignment == .topStart &&
        horizontalMode == .inner
    }

    private var verticalDirection: CGFloat {
        switch appearance.indicatorAlignment {
        case .topStart, .topCenter, .topEnd:
            return 1
        case .bottomStart, .bottomCenter, .bottomEnd:
            return -1
        case .centerStart, .center, .centerEnd:
            return 0
        }
    }

    private var horizontalOffset: CGFloat {
        if isContentRequiredStartInner {
            return -(appearance.indicatorAppearance.size.width + 4 + appearance.size.indicatorOffset.x)
        }
        guard horizontalDirection != 0 else { return 0 }
        let defaultGap: CGFloat = horizontalMode == .inner ? 4 : appearance.indicatorAppearance.size.width
        return horizontalDirection * (defaultGap + appearance.size.indicatorOffset.x)
    }

    private var verticalOffset: CGFloat {
        if isContentRequiredStartInner {
            return appearance.indicatorAppearance.size.height / 2 + appearance.size.indicatorOffset.y
        }
        return verticalDirection * appearance.size.indicatorOffset.y
    }
}
