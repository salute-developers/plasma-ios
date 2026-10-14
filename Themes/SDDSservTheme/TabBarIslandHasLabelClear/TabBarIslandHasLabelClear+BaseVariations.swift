import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabBarIslandHasLabelClear {
    public static var l: GeneralAppearanceVariation<TabBarIslandHasLabelClear, TabBarAppearance, TabBarIslandHasLabelClearVariation.L> {
        var appearance = TabBarAppearance.base
        appearance.size = TabBarIslandHasLabelClearSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TabBarIslandHasLabelClear, TabBarAppearance, TabBarIslandHasLabelClearVariation.M> {
        var appearance = TabBarAppearance.base
        appearance.size = TabBarIslandHasLabelClearSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<TabBarAppearance>] {
        [
            TabBarIslandHasLabelClear.l.variation,
            TabBarIslandHasLabelClear.l.shadow.variation,
            TabBarIslandHasLabelClear.m.variation,
            TabBarIslandHasLabelClear.m.shadow.variation,
        ]
    }
}

public struct TabBarIslandHasLabelClearVariation {
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
