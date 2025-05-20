import Foundation

/**
 `BadgeStyle` определяет стиль отображения компонента.

 - Cases:
    - `basic`: Базовый стиль бейджа без иконки.
    - `icon`: Стиль бейджа с поддержкой отображения иконки.
*/
public enum BadgeStyle: String, CaseIterable {
    case basic
    case icon
}
