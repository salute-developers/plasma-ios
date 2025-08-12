import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.L> {
    
    var divider: GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.LDivider> {
        var size =  TabBarHasLabelClearAnySize(size: appearance.size)
        size.dividerThickness = CGFloat(1.0)

        var appearance = appearance
        appearance.size = size
        appearance.dividerColor = ColorToken.surfaceDefaultTransparentTertiary
    
        return .init(
            name: "l.divider",
            appearance: appearance
        )
    }
    
    var rounded: GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.LRounded> {
        var size =  TabBarHasLabelClearAnySize(size: appearance.size)
        size.topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.rounded",
            appearance: appearance
        )
    }
    
    var shadow: GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.LShadow> {
        var size =  TabBarHasLabelClearAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.shadow = ShadowToken.upSoftM
    
        return .init(
            name: "l.shadow",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<TabBarAppearance> {
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

public extension GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.LDivider> {
    
    var rounded: GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.LDividerRounded> {
        var size =  TabBarHasLabelClearAnySize(size: appearance.size)
        size.topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.divider.rounded",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<TabBarAppearance> {
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

public extension GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.LDividerRounded> {
    
    var `default`: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<TabBarAppearance> {
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

public extension GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.LRounded> {
    
    var `default`: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<TabBarAppearance> {
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

public extension GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.LShadow> {
    
    var rounded: GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.LShadowRounded> {
        var size =  TabBarHasLabelClearAnySize(size: appearance.size)
        size.topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.shadow.rounded",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<TabBarAppearance> {
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

public extension GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.LShadowRounded> {
    
    var `default`: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<TabBarAppearance> {
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

public extension GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.M> {
    
    var divider: GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.MDivider> {
        var size =  TabBarHasLabelClearAnySize(size: appearance.size)
        size.dividerThickness = CGFloat(1.0)

        var appearance = appearance
        appearance.size = size
        appearance.dividerColor = ColorToken.surfaceDefaultTransparentTertiary
    
        return .init(
            name: "m.divider",
            appearance: appearance
        )
    }
    
    var rounded: GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.MRounded> {
        var size =  TabBarHasLabelClearAnySize(size: appearance.size)
        size.topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.rounded",
            appearance: appearance
        )
    }
    
    var shadow: GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.MShadow> {
        var size =  TabBarHasLabelClearAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.shadow = ShadowToken.upSoftM
    
        return .init(
            name: "m.shadow",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<TabBarAppearance> {
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

public extension GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.MDivider> {
    
    var rounded: GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.MDividerRounded> {
        var size =  TabBarHasLabelClearAnySize(size: appearance.size)
        size.topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.divider.rounded",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<TabBarAppearance> {
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

public extension GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.MDividerRounded> {
    
    var `default`: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<TabBarAppearance> {
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

public extension GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.MRounded> {
    
    var `default`: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<TabBarAppearance> {
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

public extension GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.MShadow> {
    
    var rounded: GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.MShadowRounded> {
        var size =  TabBarHasLabelClearAnySize(size: appearance.size)
        size.topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.shadow.rounded",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<TabBarAppearance> {
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

public extension GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.MShadowRounded> {
    
    var `default`: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<TabBarAppearance> {
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


public extension ComponentAppearanceVariation<TabBarHasLabelClear, TabBarAppearance> {
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

private extension TabBarAppearance {
    
}
