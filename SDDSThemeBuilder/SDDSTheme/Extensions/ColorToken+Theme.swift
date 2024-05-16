import Foundation
import SwiftUI

public enum ThemeStyle {
    case light
    case dark
}

public extension ColorToken {
    /// Возвращает цвет для светлой или тёмной темы в зависимости от параметра `theme`
    func color(for theme: ThemeStyle) -> Color {
        switch theme {
        case .dark:
            darkColor
        case .light:
            lightColor
        }
    }
    
    /// Возвращает цвет для текущей темы (светлой или тёмной). Тема определяется автоматически.
    var color: Color {
        color(for: UIScreen.themeStyle)
    }
}
