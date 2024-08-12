import Foundation
import SwiftUI

struct TextFillModifier: ViewModifier {
    let style: FillStyle
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        switch style {
        case .color(let colorToken):
            content
                .foregroundColor(colorToken.color(for: colorScheme))
        case .gradient(let gradientToken):
            content
                .gradient(gradientToken, colorScheme: colorScheme)
                .mask(content)
        }
    }
}

extension View {
    func fillText(style: FillStyle) -> some View {
        self.modifier(TextFillModifier(style: style))
    }
}
