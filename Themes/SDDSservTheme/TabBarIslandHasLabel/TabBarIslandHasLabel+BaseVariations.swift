import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabBarIslandHasLabel {
    public static var l: GeneralAppearanceVariation<TabBarIslandHasLabel, TabBarAppearance, TabBarIslandHasLabelVariation.L> {
        var appearance = TabBarAppearance.base
        appearance.size = TabBarIslandHasLabelSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TabBarIslandHasLabel, TabBarAppearance, TabBarIslandHasLabelVariation.M> {
        var appearance = TabBarAppearance.base
        appearance.size = TabBarIslandHasLabelSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<TabBarAppearance>] {
        [
            TabBarIslandHasLabel.l.variation,
            TabBarIslandHasLabel.l.shadow.variation,
            TabBarIslandHasLabel.m.variation,
            TabBarIslandHasLabel.m.shadow.variation,
        ]
    }
}

public struct TabBarIslandHasLabelVariation {
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
