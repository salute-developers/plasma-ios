import Foundation

/**
 `NavigationBarContentPlacement` определяет расположение контента в навигационной панели.
 */
public enum NavigationBarContentPlacement {
    /// Контент под навигационной панелью
    case bottom
    
    /// Контент в одной строке с текстом (только с .inline placement и .center align)
    case inline
}

