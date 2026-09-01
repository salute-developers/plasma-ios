import Foundation
import SwiftUI

/// Модификатор для применения кастомного LineHeight
public struct LineHeightModifier: ViewModifier {
    let token: TypographyToken
    let lineHeight: CGFloat

    public func body(content: Content) -> some View {
        content
            .lineSpacing(lineHeight - token.uiFont.lineHeight)
            .padding(.vertical, (lineHeight - token.uiFont.lineHeight) / 2)
    }
}
