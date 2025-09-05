import Foundation
import SwiftUI
import SDDSThemeCore

/**
 `TabBarAppearance` определяет внешний вид таб-бара, включая цвета, тени и стили элементов.

 - Properties:
    - backgroundColor: Цвет фона таб-бара
    - shadow: Тень таб-бара
    - dividerColor: Цвет разделителя
    - tabBarItemAppearance: Стиль элементов таб-бара
    - size: Конфигурация размеров и отступов таб-бара
 */
public struct TabBarAppearance: Hashable {
    let id = UUID()
    public var backgroundColor: ColorToken
    public var shadow: ShadowToken
    public var dividerColor: ColorToken
    public var tabBarItemAppearance: TabBarItemAppearance
    public var size: TabBarSizeConfiguration
    
    public init(
        backgroundColor: ColorToken = .clearColor,
        shadow: ShadowToken = ShadowToken(),
        dividerColor: ColorToken = .clearColor,
        tabBarItemAppearance: TabBarItemAppearance = .defaultValue,
        size: TabBarSizeConfiguration = ZeroTabBarSize()
    ) {
        self.backgroundColor = backgroundColor
        self.shadow = shadow
        self.dividerColor = dividerColor
        self.tabBarItemAppearance = tabBarItemAppearance
        self.size = size
    }
    
    public static func == (lhs: TabBarAppearance, rhs: TabBarAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.backgroundColor == rhs.backgroundColor &&
        lhs.dividerColor == rhs.dividerColor &&
        lhs.tabBarItemAppearance == rhs.tabBarItemAppearance
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension TabBarAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        TabBarAppearance(tabBarItemAppearance: .defaultValue)
    }
}
