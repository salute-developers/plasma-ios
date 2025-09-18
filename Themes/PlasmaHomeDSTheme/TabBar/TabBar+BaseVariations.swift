import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabBar {
    public static var `default`: ComponentAppearanceVariation<TabBar, TabBarAppearance> {
        var appearance = TabBarAppearance.base
        appearance.size = TabBarSize.`default`
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.tabBarItemAppearance = TabBarItem.default.appearance

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<TabBarAppearance>] = [
        TabBar.default.variation,
    ]
}

public struct TabBarVariation {
    public struct Default {}
}

private extension TabBarAppearance {
    static var base: TabBarAppearance {
        var appearance = TabBarAppearance()
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.tabBarItemAppearance = TabBarItem.default.appearance
        return appearance
    }
}
