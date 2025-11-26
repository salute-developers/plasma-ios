import SwiftUI

public extension View {
    func bottomSheet<Header: View, Content: View, Footer: View>(
        isPresented: Binding<Bool>,
        detent: Binding<BottomSheetDetent?> = .constant(nil),
        configuration: BottomSheetPresentationConfiguration = BottomSheetPresentationConfiguration(),
        subtheme: SubthemeData = SubthemeData(),
        @ViewBuilder content: @escaping () -> SDDSBottomSheet<Header, Content, Footer>
    ) -> some View {
        return self.background(
            BottomSheetViewController(
                isPresented: isPresented,
                detent: detent,
                content: content(),
                configuration: configuration
            )
            .environment(\.subtheme, subtheme)
        )
    }
}
