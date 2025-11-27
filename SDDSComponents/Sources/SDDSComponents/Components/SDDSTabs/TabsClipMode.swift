import SwiftUI

/// Режим отображения вкладок при нехватке места
public enum TabsClipMode {
    /// Обычный режим без дополнительных элементов
    case none
    /// Добавляется кнопка "Show All" для открытия dropdown menu
    case showMore(showMoreItem: TabItem, dropdownItems: [TabItem], maxHeight: CGFloat)
    /// Отображаются кнопки навигации для переключения на предыдущий/следующий элемент
    case scroll
}

