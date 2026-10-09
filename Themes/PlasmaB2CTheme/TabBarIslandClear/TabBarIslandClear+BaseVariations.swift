import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabBarIslandClear {
    public static var l: GeneralAppearanceVariation<TabBarIslandClear, TabBarAppearance, TabBarIslandClearVariation.L> {
        var appearance = TabBarAppearance.base
        appearance.size = TabBarIslandClearSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TabBarIslandClear, TabBarAppearance, TabBarIslandClearVariation.M> {
        var appearance = TabBarAppearance.base
        appearance.size = TabBarIslandClearSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<TabBarAppearance>] {
        [
            TabBarIslandClear.l.variation,
            TabBarIslandClear.l.shadow.variation,
            TabBarIslandClear.m.variation,
            TabBarIslandClear.m.shadow.variation,
        ]
    }
}

public struct TabBarIslandClearVariation {
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
