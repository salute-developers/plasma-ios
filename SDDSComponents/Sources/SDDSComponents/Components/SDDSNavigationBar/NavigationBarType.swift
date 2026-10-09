import Foundation

/**
 `NavigationBarType` определяет тип навигационной панели.
 */
public enum NavigationBarType {
    /// Главная страница
    case mainPage(appearance: NavigationBarAppearance)
    
    /// Внутренняя страница с кнопкой "назад"
    case internalPage(appearance: NavigationBarAppearance)
}

