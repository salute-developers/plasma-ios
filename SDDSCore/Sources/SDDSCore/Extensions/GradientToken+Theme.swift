import Foundation
import SwiftUI

public extension GradientToken {
    /// Возвращает линейный градиент для светлой или тёмной темы в зависимости от параметра `theme`
    func linearGradients(for theme: ThemeStyle) -> [SwiftUI.LinearGradient] {
        kind(for: theme).compactMap { $0.linearGradient?.gradient }
    }
    
    /// Возвращает линейный градиент для текущей темы (светлой или тёмной). Тема определяется автоматически.
    var linearGradients: [SwiftUI.LinearGradient] {
        linearGradients(for: UIScreen.themeStyle)
    }
    
    /// Возвращает радиальный градиент для светлой или тёмной темы в зависимости от параметра `theme`
    func radialGradients(for theme: ThemeStyle) -> [SwiftUI.RadialGradient] {
        kind(for: theme).compactMap { $0.radialGradient?.gradient }
    }
    
    /// Возвращает радиальный градиент для текущей темы (светлой или тёмной). Тема определяется автоматически.
    var radialGradients: [SwiftUI.RadialGradient] {
        radialGradients(for: UIScreen.themeStyle)
    }
    
    /// Возвращает ангулярнй градиент для светлой или тёмной темы в зависимости от параметра `theme`
    func angularGradients(for theme: ThemeStyle) -> [SwiftUI.AngularGradient] {
        kind(for: theme).compactMap { $0.angularGradient?.gradient }
    }
    
    /// Возвращает ангулярнй градиент для текущей темы (светлой или тёмной). Тема определяется автоматически.
    var angularGradients: [SwiftUI.AngularGradient] {
        angularGradients(for: UIScreen.themeStyle)
    }
    
    /// Возвращает фон для светлой или тёмной темы в зависимости от параметра `theme`
    func backgrounds(for theme: ThemeStyle) -> [Color] {
        kind(for: theme).compactMap { $0.plainColor?.background }
    }
    
    /// Возвращает фон для текущей темы (светлой или тёмной). Тема определяется автоматически.
    var backgrounds: [SwiftUI.Color] {
        backgrounds(for: UIScreen.themeStyle)
    }
    
    /// Возвращает список `[GradientKind]` для светлой или тёмной темы в зависимости от параметра `theme`
    func kind(for theme: ThemeStyle) -> [GradientKind] {
        switch theme {
        case .light:
            lightGradients
        case .dark:
            darkGradients
        }
    }
}
