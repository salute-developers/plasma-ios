import SwiftUI

/// Модификатор для применения токена теней
public struct ShadowModifier: ViewModifier {
    let token: ShadowToken.Description
    
    public func body(content: Content) -> some View {
        content
            .shadow(
                color: token.color,
                radius: token.radius,
                x: token.offset.width,
                y: token.offset.height
        )
    }
}
