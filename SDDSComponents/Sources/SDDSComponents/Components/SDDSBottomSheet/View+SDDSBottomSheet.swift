import SwiftUI

public enum BottomSheetDetent {
    case medium
    case large
    case fitContent
}

extension BottomSheetDetent {
    var uiSheetDetent: UISheetPresentationController.Detent {
        switch self {
        case .medium:
            return .medium()
        case .large:
            return .large()
        case .fitContent:
            fatalError()
        }
    }
}

public extension View {
    public func bottomSheet<Header: View, Content: View, Footer: View>(
        isPresented: Binding<Bool>,
        onDismiss: (() -> Void)? = nil,
        detents: [BottomSheetDetent] = [.fitContent, .large],
        @ViewBuilder content: @escaping () -> SDDSBottomSheet<Header, Content, Footer>
    ) -> some View {
        self.modifier(
            SheetWithDetentsViewModifier(
                isPresented: isPresented,
                detents: detents,
                onDismiss: onDismiss,
                content: content
            )
        )
    }
}


