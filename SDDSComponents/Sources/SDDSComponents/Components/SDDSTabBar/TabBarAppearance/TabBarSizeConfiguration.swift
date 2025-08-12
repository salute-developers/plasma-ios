import Foundation
import SwiftUI

/**
 `TabBarSizeConfiguration` определяет протокол для конфигурации размеров и отступов таб-бара.

 - Properties:
    - paddingStart: Отступ от левого края таб-бара
    - paddingEnd: Отступ от правого края таб-бара
    - contentPaddingStart: Отступ от левого края контента
    - contentPaddingEnd: Отступ от правого края контента
    - contentPaddingTop: Отступ от верхнего края контента
    - contentPaddingBottom: Отступ от нижнего края контента
    - itemSpacing: Расстояние между элементами таб-бара
    - topShape: Форма верхней части таб-бара
    - dividerThickness: Толщина разделителя
 */
public protocol TabBarSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var contentPaddingStart: CGFloat { get }
    var contentPaddingEnd: CGFloat { get }
    var contentPaddingTop: CGFloat { get }
    var contentPaddingBottom: CGFloat { get }
    var itemSpacing: CGFloat { get }
    var topShape: PathDrawer { get }
    var dividerThickness: CGFloat { get }
}

public struct DefaultTabBarSize: TabBarSizeConfiguration {
    public var contentPaddingStart: CGFloat = 16.0
    public var contentPaddingEnd: CGFloat = 16.0
    public var contentPaddingTop: CGFloat = 8.0
    public var contentPaddingBottom: CGFloat = 8.0
    public var itemSpacing: CGFloat = 8.0
    public var topShape: PathDrawer = DefaultPathDrawer()
    public var dividerThickness: CGFloat = 1.0
    
    public var debugDescription: String {
        "DefaultTabBarSize"
    }
    
    public init() {}
}

public struct ZeroTabBarSize: TabBarSizeConfiguration {
    public var contentPaddingStart: CGFloat = 0
    public var contentPaddingEnd: CGFloat = 0
    public var contentPaddingTop: CGFloat = 0
    public var contentPaddingBottom: CGFloat = 0
    public var itemSpacing: CGFloat = 0
    public var topShape: PathDrawer = DefaultPathDrawer()
    public var dividerThickness: CGFloat = 0
    
    public var debugDescription: String {
        "ZeroTabBarSize"
    }
    
    public init() {}
}
