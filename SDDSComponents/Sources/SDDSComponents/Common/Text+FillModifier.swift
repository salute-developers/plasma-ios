import Foundation
import SwiftUI

struct FillStyleForegroundModifier: ViewModifier {
    let style: FillStyle
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme

    func body(content: Content) -> some View {
        switch style {
        case .color(let colorToken):
            content
                .foregroundStyle(colorToken.color(for: colorScheme, subtheme: subtheme))
        case .gradient(let gradientToken):
            content
                .gradient(gradientToken, colorScheme: colorScheme, subtheme: subtheme)
                .mask(content)
        }
    }
}

extension View {
    /// Applies DS color or gradient as foreground (works for `Text`, `Image`, etc.).
    func fillForeground(style: FillStyle) -> some View {
        modifier(FillStyleForegroundModifier(style: style))
    }

    func fillText(style: FillStyle) -> some View {
        fillForeground(style: style)
    }
}
