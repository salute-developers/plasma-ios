import Foundation
import SwiftUI

public extension ColorToken {
    /// Применяет альфу к токену путем умножения альфы к исходной альфе токена
    func withAlpha(multipliedBy alpha: Double) -> ColorToken {
        return ColorToken(
            darkColor: self.darkColor.opacity(alpha),
            lightColor: self.lightColor.opacity(alpha)
        )
    }
}
