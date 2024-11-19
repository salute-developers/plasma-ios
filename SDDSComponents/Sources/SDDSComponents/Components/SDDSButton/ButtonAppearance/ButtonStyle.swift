import Foundation
import SwiftUI
import Combine
@_exported import SDDSThemeCore

/**
 `ButtonStyle` определяет стили кнопки, такие как базовая, квадратная или круглая.

 - Cases:
    - basic: Базовый стиль кнопки.
    - square: Кнопка квадратной формы.
    - circle: Кнопка круглой формы.
 */
public enum ButtonStyle: String, CaseIterable {
    /// Базовый стиль кнопки.
    case basic
    
    /// Стиль кнопки в виде иконки
    case icon
}
