import Foundation
import SwiftUI

/// Модификатор для применения токена типографики
/// Применяет параметры font, fontWeight, fontStyle для View.
/// Параметр kerning применяется только на iOS 16 и выше.
public struct TypographyModifier: ViewModifier {
    let token: TypographyToken
    
    public func body(content: Content) -> some View {
        content
            .modifier(OS16TypographyModifier(token: token))
            .modifier(LineHeightModifier(token: token, lineHeight: token.lineHeight))
    }
}

/// Для iOS 14, iOS 15 нет поддержки функций .fontWeight, .kerning, italic()
struct OS16TypographyModifier: ViewModifier {
    let token: TypographyToken
    
    init(token: TypographyToken) {
        self.token = token
    }
    
    public func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .font(token.font)
                .fontWeight(token.weight.sui)
                .kerning(token.kerning)
                .applyIf(token.style == .italic) { $0.italic() }
        } else {
            content
                .font(
                    Font(
                        UIFont(descriptor: fontDescriptor, size: token.size)
                    )
                )
        }
    }
    
    private var fontDescriptor: UIFontDescriptor {
        var result = UIFontDescriptor(name: token.fontName, size: token.size)
            .addingAttributes(
                [
                    UIFontDescriptor.AttributeName.traits: [
                        UIFontDescriptor.TraitKey.weight: token.weight.rawValue
                    ]
                ]
            )
        if token.style == .italic {
            result = result.addingAttributes(
                [
                    UIFontDescriptor.AttributeName.traits: [
                        UIFontDescriptor.TraitKey.symbolic: UIFontDescriptor.SymbolicTraits.traitItalic.rawValue
                    ]
                ]
            )
        }
        return result
    }
}
