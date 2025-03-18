import SwiftUI

public extension View {
    public func bottomSheet<Header: View, Content: View, Footer: View>(
        isPresented: Binding<Bool>,
        onDismiss: (() -> Void)? = nil,
        detents: [UISheetPresentationController.Detent] = [.medium()],
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
