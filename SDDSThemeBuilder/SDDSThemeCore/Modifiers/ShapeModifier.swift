import SwiftUI

/// Модификатор для применения токена скруглений
public struct ShapeModifier: ViewModifier {
    let token: ShapeToken
    
    public func body(content: Content) -> some View {
        content
            .cornerRadius(token.cornerRadius)
    }
}
