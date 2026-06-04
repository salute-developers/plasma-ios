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

    /// Применяет `FillStyle` (цвет или градиент) в качестве фона вью.
    @ViewBuilder
    func fillBackground(_ style: FillStyle, colorScheme: ColorScheme, subtheme: SubthemeData = SubthemeData()) -> some View {
        switch style {
        case .color(let colorToken):
            background(colorToken.color(for: colorScheme, subtheme: subtheme))
        case .gradient(let gradientToken):
            background(
                Rectangle()
                    .fill(Color.clear)
                    .gradient(gradientToken, colorScheme: colorScheme, subtheme: subtheme)
            )
        }
    }
}

/// Заливает произвольную форму цветом или градиентом из `FillStyle`.
struct FillStyleShape<S: Shape>: View {
    let shape: S
    let style: FillStyle
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme

    init(_ shape: S, style: FillStyle) {
        self.shape = shape
        self.style = style
    }

    @ViewBuilder
    var body: some View {
        switch style {
        case .color(let colorToken):
            shape.fill(colorToken.color(for: colorScheme, subtheme: subtheme))
        case .gradient(let gradientToken):
            shape
                .fill(Color.clear)
                .gradient(gradientToken, colorScheme: colorScheme, subtheme: subtheme)
                .clipShape(shape)
        }
    }
}
