import Foundation
import SwiftUI
import SDDSThemeCore

/**
 `TabBarIslandAppearance` определяет внешний вид островка таб-бара, включая цвета, тени и стили элементов.

 - Properties:
    - backgroundColor: Цвет фона островка таб-бара
    - shadow: Тень островка таб-бара
    - tabBarItemAppearance: Стиль элементов таб-бара
    - size: Конфигурация размеров и отступов островка таб-бара
 */
public struct TabBarIslandAppearance: Hashable {
    let id = UUID()
    public var backgroundColor: ColorToken
    public var shadow: ShadowToken
    public var tabBarItemAppearance: TabBarItemAppearance
    public var size: TabBarIslandSizeConfiguration
    
    public init(
        backgroundColor: ColorToken = .clearColor,
        shadow: ShadowToken = ShadowToken(),
        tabBarItemAppearance: TabBarItemAppearance = .defaultValue,
        size: TabBarIslandSizeConfiguration = ZeroTabBarIslandSize()
    ) {
        self.backgroundColor = backgroundColor
        self.shadow = shadow
        self.tabBarItemAppearance = tabBarItemAppearance
        self.size = size
    }
    
    public static func == (lhs: TabBarIslandAppearance, rhs: TabBarIslandAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.backgroundColor == rhs.backgroundColor &&
        lhs.tabBarItemAppearance == rhs.tabBarItemAppearance
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension TabBarIslandAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        TabBarIslandAppearance(tabBarItemAppearance: .defaultValue)
    }
}
