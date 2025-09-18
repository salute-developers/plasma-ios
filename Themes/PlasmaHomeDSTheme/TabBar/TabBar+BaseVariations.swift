import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabBar {
    public static var `default`: ComponentAppearanceVariation<TabBar, TabBarIslandAppearance> {
        var appearance = TabBarIslandAppearance.base
        appearance.size = TabBarSize.`default`
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.tabBarItemAppearance = TabBarItem.default.appearance

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<TabBarIslandAppearance>] = [
        TabBar.default.variation,
    ]
}

public struct TabBarVariation {
    public struct Default {}
}

private extension TabBarIslandAppearance {
    static var base: TabBarIslandAppearance {
        var appearance = TabBarIslandAppearance()
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.tabBarItemAppearance = TabBarItem.default.appearance
        return appearance
    }
}
