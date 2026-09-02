import Foundation
import SwiftUI

public extension GradientToken {
    /// Возвращает линейный градиент для светлой или тёмной темы в зависимости от параметра `theme`
    func linearGradients(for colorScheme: ColorScheme) -> [SwiftUI.LinearGradient] {
        kind(for: colorScheme).compactMap { $0.linearGradient?.gradient }
    }
    
    /// Возвращает радиальный градиент для светлой или тёмной темы в зависимости от параметра `theme`
    func radialGradients(for colorScheme: ColorScheme) -> [SwiftUI.RadialGradient] {
        kind(for: colorScheme).compactMap { $0.radialGradient?.gradient }
    }
    
    /// Возвращает ангулярнй градиент для светлой или тёмной темы в зависимости от параметра `theme`
    func angularGradients(for colorScheme: ColorScheme) -> [SwiftUI.AngularGradient] {
        kind(for: colorScheme).compactMap { $0.angularGradient?.gradient }
    }
    
    /// Возвращает фон для светлой или тёмной темы в зависимости от параметра `theme`
    func backgrounds(for colorScheme: ColorScheme) -> [Color] {
        kind(for: colorScheme).compactMap { $0.plainColor?.background }
    }
    
    /// Возвращает список `[GradientKind]` для светлой или тёмной темы в зависимости от параметра `theme`
    func kind(for colorScheme: ColorScheme) -> [GradientKind] {
        switch colorScheme {
        case .light:
            lightGradients
        case .dark:
            darkGradients
        @unknown default:
            lightGradients
        }
    }
}
