import Foundation

/**
 `NavigationBarTextAlign` определяет выравнивание текста в навигационной панели.
 */
public enum NavigationBarTextAlign {
    /// Текст по центру (работает с .bottom и .inline placement)
    case center
    
    /// Текст слева (только с .inline placement)
    case left
    
    /// Текст справа (только с .inline placement)
    case right
}

