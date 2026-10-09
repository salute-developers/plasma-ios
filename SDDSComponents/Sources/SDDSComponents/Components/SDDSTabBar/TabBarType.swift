import Foundation

/**
 `TabBarType` определяет тип таб-бара.
 */
public enum TabBarType {
    /// Таб-бар во всю ширину экрана, прижатый к нижней границе
    case bar(appearance: TabBarAppearance)

    /// Плавающий островной таб-бар с отступами от краёв
    case island(appearance: TabBarAppearance)
}
