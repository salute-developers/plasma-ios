import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabBarIslandClear {
    public static var l: GeneralAppearanceVariation<TabBarIslandClear, TabBarIslandAppearance, TabBarIslandClearVariation.L> {
        var appearance = TabBarIslandAppearance.base
        appearance.size = TabBarIslandClearSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TabBarIslandClear, TabBarIslandAppearance, TabBarIslandClearVariation.M> {
        var appearance = TabBarIslandAppearance.base
        appearance.size = TabBarIslandClearSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<TabBarIslandAppearance>] = [
        TabBarIslandClear.l.variation,
        TabBarIslandClear.l.shadow.variation,
        TabBarIslandClear.m.variation,
        TabBarIslandClear.m.shadow.variation,
    ]
}

public struct TabBarIslandClearVariation {
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
