import Foundation

/**
 `ButtonShapeStyle` определяет стиль формы кнопки.

 - Cases:
    - default: Классический стиль кнопки с углами, заданными через `cornerRadius`.
    - pilled: Стиль кнопки с полностью закругленными углами, принимающими вид капсулы.
 */
public enum ButtonShapeStyle {
    /**
     Классический стиль кнопки с углами, заданными через `cornerRadius`.
     */
    case `default`
    
    /**
     Стиль кнопки с полностью закругленными углами, принимающими вид капсулы.
     */
    case pilled
}
