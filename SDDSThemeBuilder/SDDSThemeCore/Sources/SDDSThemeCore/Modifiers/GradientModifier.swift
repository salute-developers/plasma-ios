import SwiftUI

/// Модификатор для применения токена градиента.
public struct GradientModifier: ViewModifier {
    let token: GradientToken
    let colorScheme: ColorScheme
    let offset: CGFloat
    
    public init(token: GradientToken, offset: CGFloat = 0, colorScheme: ColorScheme) {
        self.token = token
        self.offset = offset
        self.colorScheme = colorScheme
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            GradientView(colorScheme: colorScheme, token: token, offset: offset)
        }
    }
}
