import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabBarItem {
    public static var l: GeneralAppearanceVariation<TabBarItem, TabBarItemAppearance, TabBarItemVariation.L> {
        var appearance = TabBarItemAppearance.base
        appearance.size = TabBarItemSize.l
        appearance.counterAppearance = Counter.s.negative.appearance
        appearance.indicatorAppearance = Indicator.l.negative.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TabBarItem, TabBarItemAppearance, TabBarItemVariation.M> {
        var appearance = TabBarItemAppearance.base
        appearance.size = TabBarItemSize.m
        appearance.counterAppearance = Counter.xs.negative.appearance
        appearance.indicatorAppearance = Indicator.m.negative.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<TabBarItemAppearance>] = [
        TabBarItem.l.variation,
        TabBarItem.l.label.variation,
        TabBarItem.m.variation,
        TabBarItem.m.label.variation,
    ]
}

public struct TabBarItemVariation {
    public struct L {}
    public struct LLabel {}
    public struct M {}
    public struct MLabel {}
}

private extension TabBarItemAppearance {
    static var base: TabBarItemAppearance {
        var appearance = TabBarItemAppearance()
        appearance.labelTypography = TabBarItemTypography(oneSize: AdaptiveTypographyToken.bodyXxsBold.typography).asContainer
        return appearance
    }
}
