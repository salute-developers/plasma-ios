import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<TabBarItem, TabBarItemAppearance, TabBarItemVariation.L> {
    
    var l: GeneralAppearanceVariation<TabBarItem, TabBarItemAppearance, TabBarItemVariation.L> {
        var size =  TabBarItemAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TabBarItem, TabBarItemAppearance, TabBarItemVariation.LLabel> {
    
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
    
    var m: GeneralAppearanceVariation<TabBarItem, TabBarItemAppearance, TabBarItemVariation.M> {
        var size =  TabBarItemAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TabBarItem, TabBarItemAppearance, TabBarItemVariation.MLabel> {
    
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
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultSolidDefault)),
            .init(states: [InteractiveState.activated], value: .color(.surfaceDefaultSolidDefault))
        ])
        appearance.iconColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.activated], value: .color(.textInversePrimary))
        ])
        appearance.labelColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.activated], value: .color(.textInversePrimary))
        ])
        return appearance
    }
    
    var accent: TabBarItemAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultTransparentAccent)),
            .init(states: [InteractiveState.activated], value: .color(.surfaceDefaultTransparentAccent))
        ])
        appearance.iconColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.selected], value: .color(.textDefaultAccent)),
            .init(states: [InteractiveState.activated], value: .color(.textDefaultAccent))
        ])
        appearance.labelColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.selected], value: .color(.textDefaultAccent)),
            .init(states: [InteractiveState.activated], value: .color(.textDefaultAccent))
        ])
        return appearance
    }
    
    var secondary: TabBarItemAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultTransparentSecondary)),
            .init(states: [InteractiveState.activated], value: .color(.surfaceDefaultTransparentSecondary))
        ])
        appearance.iconColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.activated], value: .color(.textDefaultPrimary))
        ])
        appearance.labelColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.activated], value: .color(.textDefaultPrimary))
        ])
        return appearance
    }
    
}
