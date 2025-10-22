import Foundation

/**
 `WheelDividerStyle` определяет стиль разделителя между колесами.
 */
public enum WheelDividerStyle {
    /// Разделитель не отображается (только spacer)
    case empty
    
    /// Вместо разделителя отображается двоеточие ":" по центру области
    case dots
    
    /// Разделитель отображается как обычный divider
    case divider
}
