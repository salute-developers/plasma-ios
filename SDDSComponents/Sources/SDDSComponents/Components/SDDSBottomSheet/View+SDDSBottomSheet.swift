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
                content: contentView,
                configuration: configuration,
                onBottomSheetScrollChange: { change in
                    contentView.environment(\.bottomSheetScrollProgress, change)
                }
            )
        )
    }
}
