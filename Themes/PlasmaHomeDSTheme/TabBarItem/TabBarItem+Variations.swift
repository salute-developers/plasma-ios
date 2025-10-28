import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<TabBarItem, TabBarItemAppearance, TabBarItemVariation.Default> {
    
    var `default`: ComponentAppearanceVariation<TabBarItem, TabBarItemAppearance> {
        var size =  TabBarItemAnySize(size: appearance.size)
        size.iconSize = CGFloat(24.0)
        size.labelPadding = CGFloat(2.0)
        size.labelPlacement = TabBarItemLabelPlacement.bottom
        size.minHeight = CGFloat(60.0)
        size.paddingBottom = CGFloat(11.0)
        size.paddingTop = CGFloat(11.0)
        size.shape = DefaultPathDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.surfaceDefaultClear)
        appearance.counterAppearance = Counter.xs.negative.appearance
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.textDefaultPrimary)
        appearance.indicatorAppearance = Indicator.m.negative.appearance
        appearance.labelColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.textDefaultPrimary)
        appearance.labelTypography = TabBarItemTypography(default: AdaptiveTypographyToken.bodyXxsBold.typography).asContainer
    
        return .init(
            name: "default",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<TabBarItem, TabBarItemAppearance> {
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension TabBarItemAppearance {
    
}
