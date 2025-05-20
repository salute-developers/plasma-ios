import Foundation

/**
  `TextAreaLayout` - Определяет возможные макеты для текстового поля.
 - default: Стандартный макет с фоном и границами.
 - clear: Прозрачный макет без фона и границ.
 */
public enum TextAreaLayout: String, CaseIterable {
    case `default`
    case clear
}
