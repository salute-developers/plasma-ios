import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<TabBarItem, TabBarItemAppearance, TabBarItemVariation.L> {
    
    var label: ComponentAppearanceVariation<TabBarItem, TabBarItemAppearance> {
        var size =  TabBarItemAnySize(size: appearance.size)
        size.labelPadding = CGFloat(0.0)
        size.labelPlacement = TabBarItemLabelPlacement.bottom
        size.paddingBottom = CGFloat(12.0)
        size.paddingTop = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.label",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TabBarItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<TabBarItemAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var secondary: AppearanceVariation<TabBarItemAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TabBarItem, TabBarItemAppearance, TabBarItemVariation.M> {
    
    var label: ComponentAppearanceVariation<TabBarItem, TabBarItemAppearance> {
        var size =  TabBarItemAnySize(size: appearance.size)
        size.labelPadding = CGFloat(2.0)
        size.labelPlacement = TabBarItemLabelPlacement.bottom
        size.paddingBottom = CGFloat(8.0)
        size.paddingTop = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.label",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TabBarItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<TabBarItemAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var secondary: AppearanceVariation<TabBarItemAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<TabBarItem, TabBarItemAppearance> {
    var `default`: AppearanceVariation<TabBarItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<TabBarItemAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var secondary: AppearanceVariation<TabBarItemAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension TabBarItemAppearance {
    
    var `default`: TabBarItemAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.surfaceDefaultSolidDefault)
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.textInversePrimary)
        appearance.labelColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.textInversePrimary)
        return appearance
    }
    
    var accent: TabBarItemAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.surfaceDefaultTransparentAccent)
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.textDefaultAccent)
        appearance.labelColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.textDefaultAccent)
        return appearance
    }
    
    var secondary: TabBarItemAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.surfaceDefaultTransparentSecondary)
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.textDefaultPrimary)
        appearance.labelColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.textDefaultPrimary)
        return appearance
    }
    
}
