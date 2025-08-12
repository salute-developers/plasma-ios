import Foundation
import SwiftUI

/**
 `TabBarIslandSizeConfiguration` определяет протокол для конфигурации размеров и отступов островка таб-бара.

 - Properties:
    - topShape: Форма верхней части островка
    - bottomShape: Форма нижней части островка
    - paddingStart: Отступ от левого края островка
    - paddingEnd: Отступ от правого края островка
    - contentPaddingStart: Отступ от левого края контента
    - contentPaddingEnd: Отступ от правого края контента
    - contentPaddingTop: Отступ от верхнего края контента
    - contentPaddingBottom: Отступ от нижнего края контента
    - itemSpacing: Расстояние между элементами таб-бара
 */
public protocol TabBarIslandSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var topShape: PathDrawer { get }
    var bottomShape: PathDrawer { get }
    var paddingStart: CGFloat { get }
    var paddingEnd: CGFloat { get }
    var contentPaddingStart: CGFloat { get }
    var contentPaddingEnd: CGFloat { get }
    var contentPaddingTop: CGFloat { get }
    var contentPaddingBottom: CGFloat { get }
    var itemSpacing: CGFloat { get }
}

public struct DefaultTabBarIslandSize: TabBarIslandSizeConfiguration {
    public var topShape: PathDrawer = DefaultPathDrawer()
    public var bottomShape: PathDrawer = DefaultPathDrawer()
    public var paddingStart: CGFloat = 16.0
    public var paddingEnd: CGFloat = 16.0
    public var contentPaddingStart: CGFloat = 8.0
    public var contentPaddingEnd: CGFloat = 8.0
    public var contentPaddingTop: CGFloat = 8.0
    public var contentPaddingBottom: CGFloat = 8.0
    public var itemSpacing: CGFloat = 8.0
    
    public var debugDescription: String {
        "DefaultTabBarIslandSize"
    }
    
    public init() {}
}

public struct ZeroTabBarIslandSize: TabBarIslandSizeConfiguration {
    public var topShape: PathDrawer = DefaultPathDrawer()
    public var bottomShape: PathDrawer = DefaultPathDrawer()
    public var paddingStart: CGFloat = 0
    public var paddingEnd: CGFloat = 0
    public var contentPaddingStart: CGFloat = 0
    public var contentPaddingEnd: CGFloat = 0
    public var contentPaddingTop: CGFloat = 0
    public var contentPaddingBottom: CGFloat = 0
    public var itemSpacing: CGFloat = 0
    
    public var debugDescription: String {
        "ZeroTabBarIslandSize"
    }
    
    public init() {}
}
