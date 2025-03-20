import SwiftUI

public extension View {
    func bottomSheet<Header: View, Content: View, Footer: View>(
        isPresented: Binding<Bool>,
        configuration: BottomSheetPresentationConfiguration = BottomSheetPresentationConfiguration(),
        @ViewBuilder content: @escaping () -> SDDSBottomSheet<Header, Content, Footer>
    ) -> some View {
        let contentView = content()
        return self.background(
            BottomSheetViewController(
                isPresented: isPresented,
                bottomSheetScrollProgress: contentView.$bottomSheetScrollProgress,
                content: contentView,
                configuration: configuration
            )
        )
    }
}
