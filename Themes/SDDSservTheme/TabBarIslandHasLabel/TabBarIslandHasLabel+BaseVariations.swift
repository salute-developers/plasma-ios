import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabBarIslandHasLabel {
    public static var l: GeneralAppearanceVariation<TabBarIslandHasLabel, TabBarIslandAppearance, TabBarIslandHasLabelVariation.L> {
        var appearance = TabBarIslandAppearance.base
        appearance.size = TabBarIslandHasLabelSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TabBarIslandHasLabel, TabBarIslandAppearance, TabBarIslandHasLabelVariation.M> {
        var appearance = TabBarIslandAppearance.base
        appearance.size = TabBarIslandHasLabelSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<TabBarIslandAppearance>] = [
        TabBarIslandHasLabel.l.variation,
        TabBarIslandHasLabel.l.shadow.variation,
        TabBarIslandHasLabel.m.variation,
        TabBarIslandHasLabel.m.shadow.variation,
    ]
}

public struct TabBarIslandHasLabelVariation {
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
