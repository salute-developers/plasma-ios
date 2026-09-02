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

        var appearance = appearance
        appearance.size = size
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [])
        appearance.counterAppearance = Counter.xs.negative.appearance
        appearance.iconColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary))
        ])
        appearance.indicatorAppearance = Indicator.m.negative.appearance
        appearance.labelColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary))
        ])
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

