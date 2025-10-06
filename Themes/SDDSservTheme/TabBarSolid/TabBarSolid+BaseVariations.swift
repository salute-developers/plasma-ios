import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabBarSolid {
    public static var l: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.L> {
        var appearance = TabBarAppearance.base
        appearance.size = TabBarSolidSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.M> {
        var appearance = TabBarAppearance.base
        appearance.size = TabBarSolidSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<TabBarAppearance>] = [
        TabBarSolid.l.variation,
        TabBarSolid.l.divider.variation,
        TabBarSolid.l.divider.rounded.variation,
        TabBarSolid.l.rounded.variation,
        TabBarSolid.l.shadow.variation,
        TabBarSolid.l.shadow.rounded.variation,
        TabBarSolid.m.variation,
        TabBarSolid.m.divider.variation,
        TabBarSolid.m.divider.rounded.variation,
        TabBarSolid.m.rounded.variation,
        TabBarSolid.m.shadow.variation,
        TabBarSolid.m.shadow.rounded.variation,
    ]
}

public struct TabBarSolidVariation {
    public struct L {}
    public struct LDivider {}
    public struct LDividerRounded {}
    public struct LRounded {}
    public struct LShadow {}
    public struct LShadowRounded {}
    public struct M {}
    public struct MDivider {}
    public struct MDividerRounded {}
    public struct MRounded {}
    public struct MShadow {}
    public struct MShadowRounded {}
}

private extension TabBarAppearance {
    static var base: TabBarAppearance {
        var appearance = TabBarAppearance()
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard
        return appearance
    }
}
