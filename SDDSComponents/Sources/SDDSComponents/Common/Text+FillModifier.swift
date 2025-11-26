import Foundation
import SwiftUI

struct TextFillModifier: ViewModifier {
    let style: FillStyle
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    func body(content: Content) -> some View {
        switch style {
        case .color(let colorToken):
            content
                .foregroundColor(colorToken.color(for: colorScheme, subtheme: subtheme))
        case .gradient(let gradientToken):
            content
                .gradient(gradientToken, colorScheme: colorScheme, subtheme: subtheme)
                .mask(content)
        }
    }
}

extension View {
    func fillText(style: FillStyle) -> some View {
        self.modifier(TextFillModifier(style: style))
    }
}
