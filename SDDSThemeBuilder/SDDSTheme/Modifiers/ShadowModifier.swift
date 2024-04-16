import SwiftUI

struct ShadowModifier: ViewModifier {
    let token: ShadowToken.Description
    
    func body(content: Content) -> some View {
        content
            .shadow(
                color: token.color,
                radius: token.radius,
                x: token.offset.width,
                y: token.offset.height
        )
    }
}
