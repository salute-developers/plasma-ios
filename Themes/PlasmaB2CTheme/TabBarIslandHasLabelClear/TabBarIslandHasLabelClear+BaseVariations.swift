import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabBarIslandHasLabelClear {
    public static var l: GeneralAppearanceVariation<TabBarIslandHasLabelClear, TabBarIslandAppearance, TabBarIslandHasLabelClearVariation.L> {
        var appearance = TabBarIslandAppearance.base
        appearance.size = TabBarIslandHasLabelClearSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TabBarIslandHasLabelClear, TabBarIslandAppearance, TabBarIslandHasLabelClearVariation.M> {
        var appearance = TabBarIslandAppearance.base
        appearance.size = TabBarIslandHasLabelClearSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<TabBarIslandAppearance>] = [
        TabBarIslandHasLabelClear.l.variation,
        TabBarIslandHasLabelClear.l.shadow.variation,
        TabBarIslandHasLabelClear.m.variation,
        TabBarIslandHasLabelClear.m.shadow.variation,
    ]
}

public struct TabBarIslandHasLabelClearVariation {
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
