import SwiftUI

/// Модификатор для применения токена градиента.
public struct GradientModifier: ViewModifier {
    let token: GradientToken
    let colorScheme: ColorScheme
    
    public init(token: GradientToken, colorScheme: ColorScheme) {
        self.token = token
        self.colorScheme = colorScheme
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            GradientView(colorScheme: colorScheme, token: token)
        }
    }
}
