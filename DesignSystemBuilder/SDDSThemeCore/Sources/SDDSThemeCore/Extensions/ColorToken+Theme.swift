import Foundation
import SwiftUI

public extension ColorToken {
    /// Возвращает цвет для светлой или тёмной темы в зависимости от параметра `theme`
    func color(for theme: ColorScheme = .light) -> Color {
        switch theme {
        case .dark:
            darkColor
        case .light:
            lightColor
        @unknown default:
            lightColor
        }
    }
}
