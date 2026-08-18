import Foundation
import SwiftUI
import SDDSApiInfo

/**
 `TabBarItemSizeConfiguration` определяет протокол для конфигурации размеров и отступов элемента таб-бара.

 - Properties:
    - minHeight: Минимальная высота элемента
    - paddingTop: Отступ от верхнего края
    - paddingBottom: Отступ от нижнего края
    - iconSize: Размер иконки
    - labelPadding: Отступ для метки
    - shape: Форма элемента
    - labelPlacement: Размещение метки
 */
public protocol TabBarItemSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var minHeight: CGFloat { get }
    var paddingTop: CGFloat { get }
    var paddingBottom: CGFloat { get }
    @ApiName("iconSize")
    var iconSize: CGFloat { get }
    var labelPadding: CGFloat { get }
    @ApiName("shape")
    var shape: PathDrawer { get }
    @ApiName("labelPlacement")
    var labelPlacement: TabBarItemLabelPlacement { get }
}

public struct DefaultTabBarItemSize: TabBarItemSizeConfiguration {
    public var minHeight: CGFloat = 48.0
    public var paddingTop: CGFloat = 8.0
    public var paddingBottom: CGFloat = 8.0
    public var iconSize: CGFloat = 24.0
    public var labelPadding: CGFloat = 4.0
    public var shape: PathDrawer = DefaultPathDrawer()
    public var labelPlacement: TabBarItemLabelPlacement = .bottom
    
    public var debugDescription: String {
        "DefaultTabBarItemSize"
    }
    
    public init() {}
}

public struct ZeroTabBarItemSize: TabBarItemSizeConfiguration {
    public var minHeight: CGFloat = 0
    public var paddingTop: CGFloat = 0
    public var paddingBottom: CGFloat = 0
    public var iconSize: CGFloat = 0
    public var labelPadding: CGFloat = 0
    public var shape: PathDrawer = DefaultPathDrawer()
    public var labelPlacement: TabBarItemLabelPlacement = .none
    
    public var debugDescription: String {
        "ZeroTabBarItemSize"
    }
    
    public init() {}
}

/**
 `TabBarItemLabelPlacement` определяет размещение метки в элементе таб-бара.
 */
public enum TabBarItemLabelPlacement: String, CaseIterable {
    case bottom = "bottom"
    @ApiDefault
    case none = "none"
    case top = "top"
}
