import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabBarItem {
    public static var `default`: ComponentAppearanceVariation<TabBarItem, TabBarItemAppearance> {
        var appearance = TabBarItemAppearance.base
        appearance.size = TabBarItemSize.`default`
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.surfaceDefaultClear)
        appearance.counterAppearance = Counter.xs.negative.appearance
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.textDefaultPrimary)
        appearance.indicatorAppearance = Indicator.m.negative.appearance
        appearance.labelColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.textDefaultPrimary)
        appearance.labelTypography = TabBarItemTypography(oneSize: AdaptiveTypographyToken.bodyXxsBold.typography).asContainer

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<TabBarItemAppearance>] = [
        TabBarItem.default.variation,
    ]
}

public struct TabBarItemVariation {
    public struct Default {}
}

private extension TabBarItemAppearance {
    static var base: TabBarItemAppearance {
        var appearance = TabBarItemAppearance()
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.surfaceDefaultClear)
        appearance.counterAppearance = Counter.xs.negative.appearance
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.textDefaultPrimary)
        appearance.indicatorAppearance = Indicator.m.negative.appearance
        appearance.labelColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.textDefaultPrimary)
        appearance.labelTypography = TabBarItemTypography(oneSize: AdaptiveTypographyToken.bodyXxsBold.typography).asContainer
        return appearance
    }
}
