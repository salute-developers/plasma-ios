import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<TabBarItemSolid, TabBarItemAppearance, TabBarItemSolidVariation.L> {
    
    var l: GeneralAppearanceVariation<TabBarItemSolid, TabBarItemAppearance, TabBarItemSolidVariation.L> {
        var size =  TabBarItemSolidAnySize(size: appearance.size)
        size.iconSize = CGFloat(36.0)
        size.labelPlacement = TabBarItemLabelPlacement.none
        size.minHeight = CGFloat(64.0)
        size.paddingBottom = CGFloat(14.0)
        size.paddingTop = CGFloat(14.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.counterAppearance = Counter.s.negative.appearance
        appearance.indicatorAppearance = Indicator.l.negative.appearance
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var label: ComponentAppearanceVariation<TabBarItemSolid, TabBarItemAppearance> {
        var size =  TabBarItemSolidAnySize(size: appearance.size)
        size.labelPadding = CGFloat(0.0)
        size.labelPlacement = TabBarItemLabelPlacement.bottom
        size.paddingBottom = CGFloat(12.0)
        size.paddingTop = CGFloat(12.0)
        size.shape = DefaultPathDrawer() as PathDrawer

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

public extension GeneralAppearanceVariation<TabBarItemSolid, TabBarItemAppearance, TabBarItemSolidVariation.LLabel> {
    
    var label: ComponentAppearanceVariation<TabBarItemSolid, TabBarItemAppearance> {
        var size =  TabBarItemSolidAnySize(size: appearance.size)
        size.labelPadding = CGFloat(0.0)
        size.labelPlacement = TabBarItemLabelPlacement.bottom
        size.paddingBottom = CGFloat(12.0)
        size.paddingTop = CGFloat(12.0)
        size.shape = DefaultPathDrawer() as PathDrawer

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

public extension GeneralAppearanceVariation<TabBarItemSolid, TabBarItemAppearance, TabBarItemSolidVariation.M> {
    
    var label: ComponentAppearanceVariation<TabBarItemSolid, TabBarItemAppearance> {
        var size =  TabBarItemSolidAnySize(size: appearance.size)
        size.labelPadding = CGFloat(2.0)
        size.labelPlacement = TabBarItemLabelPlacement.bottom
        size.paddingBottom = CGFloat(8.0)
        size.paddingTop = CGFloat(10.0)
        size.shape = DefaultPathDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.label",
            appearance: appearance
        )
    }
    
    var m: GeneralAppearanceVariation<TabBarItemSolid, TabBarItemAppearance, TabBarItemSolidVariation.M> {
        var size =  TabBarItemSolidAnySize(size: appearance.size)
        size.iconSize = CGFloat(24.0)
        size.labelPlacement = TabBarItemLabelPlacement.none
        size.minHeight = CGFloat(48.0)
        size.paddingBottom = CGFloat(12.0)
        size.paddingTop = CGFloat(12.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.counterAppearance = Counter.xs.negative.appearance
        appearance.indicatorAppearance = Indicator.m.negative.appearance
    
        return .init(
            name: "m",
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

public extension GeneralAppearanceVariation<TabBarItemSolid, TabBarItemAppearance, TabBarItemSolidVariation.MLabel> {
    
    var label: ComponentAppearanceVariation<TabBarItemSolid, TabBarItemAppearance> {
        var size =  TabBarItemSolidAnySize(size: appearance.size)
        size.labelPadding = CGFloat(2.0)
        size.labelPlacement = TabBarItemLabelPlacement.bottom
        size.paddingBottom = CGFloat(8.0)
        size.paddingTop = CGFloat(10.0)
        size.shape = DefaultPathDrawer() as PathDrawer

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


public extension ComponentAppearanceVariation<TabBarItemSolid, TabBarItemAppearance> {
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
