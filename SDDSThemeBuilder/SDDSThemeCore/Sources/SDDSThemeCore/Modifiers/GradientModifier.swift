import SwiftUI

/// Модификатор для применения токена градиента.
public struct GradientModifier: ViewModifier {
    let token: GradientToken
    let colorScheme: ColorScheme
    let offset: CGFloat
    let subtheme: SubthemeData
    
    public init(token: GradientToken, offset: CGFloat = 0, colorScheme: ColorScheme, subtheme: SubthemeData = SubthemeData()) {
        self.token = token
        self.offset = offset
        self.colorScheme = colorScheme
        self.subtheme = subtheme
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            GradientView(colorScheme: colorScheme, token: token, offset: offset, subtheme: subtheme)
        }
    }
}
