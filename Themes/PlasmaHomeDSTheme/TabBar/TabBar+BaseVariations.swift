import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabBar {
    public static var `default`: ComponentAppearanceVariation<TabBar, TabBarAppearance> {
        var appearance = TabBarAppearance.base
        appearance.size = TabBarSize.`default`
        appearance.backgroundBlurColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.backgroundBlurRadius = CGFloat(50.0)
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidTertiary
        appearance.tabBarItemAppearance = TabBarItem.default.appearance

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<TabBarAppearance>] {
        [
            TabBar.default.variation,
        ]
    }
}

public struct TabBarVariation {
    public struct Default {}
}

private extension TabBarAppearance {
    static var base: TabBarAppearance {
        var appearance = TabBarAppearance()
        appearance.backgroundBlurColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.backgroundBlurRadius = CGFloat(50.0)
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidTertiary
        appearance.tabBarItemAppearance = TabBarItem.default.appearance
        return appearance
    }
}
