import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabBarItemSolid {
    public static var l: GeneralAppearanceVariation<TabBarItemSolid, TabBarItemAppearance, TabBarItemSolidVariation.L> {
        var appearance = TabBarItemAppearance.base
        appearance.size = TabBarItemSolidSize.l
        appearance.counterAppearance = Counter.s.negative.appearance
        appearance.indicatorAppearance = Indicator.l.negative.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TabBarItemSolid, TabBarItemAppearance, TabBarItemSolidVariation.M> {
        var appearance = TabBarItemAppearance.base
        appearance.size = TabBarItemSolidSize.m
        appearance.counterAppearance = Counter.xs.negative.appearance
        appearance.indicatorAppearance = Indicator.m.negative.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<TabBarItemAppearance>] = [
        TabBarItemSolid.l.variation,
        TabBarItemSolid.l.label.variation,
        TabBarItemSolid.m.variation,
        TabBarItemSolid.m.label.variation,
    ]
}

public struct TabBarItemSolidVariation {
    public struct L {}
    public struct LLabel {}
    public struct M {}
    public struct MLabel {}
}

private extension TabBarItemAppearance {
    static var base: TabBarItemAppearance {
        var appearance = TabBarItemAppearance()
        appearance.labelTypography = TabBarItemSolidTypography(oneSize: AdaptiveTypographyToken.bodyXxsBold.typography).asContainer
        return appearance
    }
}
