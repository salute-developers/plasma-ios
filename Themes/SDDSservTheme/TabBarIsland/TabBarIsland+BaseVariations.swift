import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabBarIsland {
    public static var l: GeneralAppearanceVariation<TabBarIsland, TabBarIslandAppearance, TabBarIslandVariation.L> {
        var appearance = TabBarIslandAppearance.base
        appearance.size = TabBarIslandSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TabBarIsland, TabBarIslandAppearance, TabBarIslandVariation.M> {
        var appearance = TabBarIslandAppearance.base
        appearance.size = TabBarIslandSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<TabBarIslandAppearance>] = [
        TabBarIsland.l.variation,
        TabBarIsland.l.shadow.variation,
        TabBarIsland.m.variation,
        TabBarIsland.m.shadow.variation,
    ]
}

public struct TabBarIslandVariation {
    public struct L {}
    public struct LShadow {}
    public struct M {}
    public struct MShadow {}
}

private extension TabBarIslandAppearance {
    static var base: TabBarIslandAppearance {
        var appearance = TabBarIslandAppearance()
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard
        return appearance
    }
}
