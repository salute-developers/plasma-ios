import Foundation
import SwiftUI

public enum ColorTheme {
    case light
    case dark
}

public extension ColorToken {
    /// Возвращает цвет для светлой или тёмной темы в зависимости от параметра `theme`
    func color(for theme: ColorTheme) -> Color {
        switch theme {
        case .dark:
            darkColor
        case .light:
            lightColor
        }
    }
}
