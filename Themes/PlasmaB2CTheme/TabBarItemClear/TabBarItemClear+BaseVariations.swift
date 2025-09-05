import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabBarItemClear {
    public static var l: GeneralAppearanceVariation<TabBarItemClear, TabBarItemAppearance, TabBarItemClearVariation.L> {
        var appearance = TabBarItemAppearance.base
        appearance.size = TabBarItemClearSize.l
        appearance.counterAppearance = Counter.s.negative.appearance
        appearance.indicatorAppearance = Indicator.l.negative.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TabBarItemClear, TabBarItemAppearance, TabBarItemClearVariation.M> {
        var appearance = TabBarItemAppearance.base
        appearance.size = TabBarItemClearSize.m
        appearance.counterAppearance = Counter.xs.negative.appearance
        appearance.indicatorAppearance = Indicator.m.negative.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<TabBarItemAppearance>] = [
        TabBarItemClear.l.variation,
        TabBarItemClear.l.label.variation,
        TabBarItemClear.m.variation,
        TabBarItemClear.m.label.variation,
    ]
}

public struct TabBarItemClearVariation {
    public struct L {}
    public struct LLabel {}
    public struct M {}
    public struct MLabel {}
}

private extension TabBarItemAppearance {
    static var base: TabBarItemAppearance {
        var appearance = TabBarItemAppearance()
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.surfaceDefaultClear)
        appearance.labelTypography = TabBarItemClearTypography(oneSize: AdaptiveTypographyToken.bodyXxsBold.typography).asContainer
        return appearance
    }
}
