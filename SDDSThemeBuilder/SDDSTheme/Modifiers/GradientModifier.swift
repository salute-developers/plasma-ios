import SwiftUI

/// Модификатор для применения токена градиента.
public struct GradientModifier: ViewModifier {
    let token: GradientToken
    let theme: ThemeStyle
    
    public init(token: GradientToken, theme: ThemeStyle) {
        self.token = token
        self.theme = theme
    }
    
    public func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content.background {
                GradientView(theme: theme, token: token)
            }
        } else {
            ZStack {
                GradientView(theme: theme, token: token)
                content
            }
        }
    }
}
