import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<TabBarItemClear, TabBarItemAppearance, TabBarItemClearVariation.L> {
    
    var l: GeneralAppearanceVariation<TabBarItemClear, TabBarItemAppearance, TabBarItemClearVariation.L> {
        var size =  TabBarItemClearAnySize(size: appearance.size)
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
    
    var label: ComponentAppearanceVariation<TabBarItemClear, TabBarItemAppearance> {
        var size =  TabBarItemClearAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TabBarItemClear, TabBarItemAppearance, TabBarItemClearVariation.LLabel> {
    
    var label: ComponentAppearanceVariation<TabBarItemClear, TabBarItemAppearance> {
        var size =  TabBarItemClearAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TabBarItemClear, TabBarItemAppearance, TabBarItemClearVariation.M> {
    
    var label: ComponentAppearanceVariation<TabBarItemClear, TabBarItemAppearance> {
        var size =  TabBarItemClearAnySize(size: appearance.size)
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
    
    var m: GeneralAppearanceVariation<TabBarItemClear, TabBarItemAppearance, TabBarItemClearVariation.M> {
        var size =  TabBarItemClearAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TabBarItemClear, TabBarItemAppearance, TabBarItemClearVariation.MLabel> {
    
    var label: ComponentAppearanceVariation<TabBarItemClear, TabBarItemAppearance> {
        var size =  TabBarItemClearAnySize(size: appearance.size)
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


public extension ComponentAppearanceVariation<TabBarItemClear, TabBarItemAppearance> {
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
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.textDefaultPrimary)
        appearance.labelColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.textDefaultPrimary)
        return appearance
    }
    
    var accent: TabBarItemAppearance {
        var appearance = self
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.textDefaultAccent)
        appearance.labelColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.textDefaultAccent)
        return appearance
    }
    
    var secondary: TabBarItemAppearance {
        var appearance = self
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.textDefaultSecondary)
        appearance.labelColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.textDefaultSecondary)
        return appearance
    }
    
}
