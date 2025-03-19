import Foundation
import SwiftUI

struct SheetWithDetentsViewModifier<Header: View, Body: View, Footer: View>: ViewModifier {
    @Binding var isPresented: Bool
    @State private var scrollProgress: CGFloat = 0
    let detents: [BottomSheetDetent]
    let onDismiss: (() -> Void)?
    let content: () -> SDDSBottomSheet<Header, Body, Footer>
    
    func body(content: Content) -> some View {
        content.background(
            SheetPresentationForSwiftUI(
                $isPresented,
                scrollProgress: $scrollProgress,
                onDismiss: onDismiss,
                detents: detents
            ) {
                self.content()
                    .environment(\.scrollProgress, scrollProgress)
            }
        )
    }
}
