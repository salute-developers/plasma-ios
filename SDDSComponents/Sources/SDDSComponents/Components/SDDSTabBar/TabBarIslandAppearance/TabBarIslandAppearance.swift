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
    public var backgroundBlurColor: ColorToken
    public var backgroundBlurRadius: CGFloat
    public var shadow: ShadowToken
    public var tabBarItemAppearance: TabBarItemAppearance
    public var size: TabBarIslandSizeConfiguration
    
    public init(
        backgroundColor: ColorToken = .clearColor,
        backgroundBlurColor: ColorToken = .clearColor,
        backgroundBlurRadius: CGFloat = 0,
        shadow: ShadowToken = ShadowToken(),
        tabBarItemAppearance: TabBarItemAppearance = .defaultValue,
        size: TabBarIslandSizeConfiguration = ZeroTabBarIslandSize()
    ) {
        self.backgroundColor = backgroundColor
        self.backgroundBlurColor = backgroundBlurColor
        self.backgroundBlurRadius = backgroundBlurRadius
        self.shadow = shadow
        self.tabBarItemAppearance = tabBarItemAppearance
        self.size = size
    }
    
    public static func == (lhs: TabBarIslandAppearance, rhs: TabBarIslandAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.backgroundColor == rhs.backgroundColor &&
        lhs.backgroundBlurColor == rhs.backgroundBlurColor &&
        lhs.backgroundBlurRadius == rhs.backgroundBlurRadius &&
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
