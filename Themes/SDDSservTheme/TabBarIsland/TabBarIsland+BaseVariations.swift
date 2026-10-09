import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabBarIsland {
    public static var l: GeneralAppearanceVariation<TabBarIsland, TabBarAppearance, TabBarIslandVariation.L> {
        var appearance = TabBarAppearance.base
        appearance.size = TabBarIslandSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TabBarIsland, TabBarAppearance, TabBarIslandVariation.M> {
        var appearance = TabBarAppearance.base
        appearance.size = TabBarIslandSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<TabBarAppearance>] {
        [
            TabBarIsland.l.variation,
            TabBarIsland.l.shadow.variation,
            TabBarIsland.m.variation,
            TabBarIsland.m.shadow.variation,
        ]
    }
}

public struct TabBarIslandVariation {
    public struct L {}
    public struct LShadow {}
    public struct M {}
    public struct MShadow {}
}

private extension TabBarAppearance {
    static var base: TabBarAppearance {
        var appearance = TabBarAppearance()
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard
        return appearance
    }
}
