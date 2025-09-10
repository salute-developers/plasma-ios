import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.L> {
    
    var divider: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.LDivider> {
        var size =  TabBarHasLabelAnySize(size: appearance.size)
        size.dividerThickness = CGFloat(1.0)

        var appearance = appearance
        appearance.size = size
        appearance.dividerColor = ColorToken.surfaceDefaultTransparentTertiary
    
        return .init(
            name: "l.divider",
            appearance: appearance
        )
    }
    
    var l: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.L> {
        var size =  TabBarHasLabelAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var rounded: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.LRounded> {
        var size =  TabBarHasLabelAnySize(size: appearance.size)
        size.topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.rounded",
            appearance: appearance
        )
    }
    
    var shadow: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.LShadow> {
        var size =  TabBarHasLabelAnySize(size: appearance.size)

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
        appearance.tabBarItemAppearance = TabBarItem.l.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.label.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.LDivider> {
    
    var divider: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.LDivider> {
        var size =  TabBarHasLabelAnySize(size: appearance.size)
        size.dividerThickness = CGFloat(1.0)

        var appearance = appearance
        appearance.size = size
        appearance.dividerColor = ColorToken.surfaceDefaultTransparentTertiary
    
        return .init(
            name: "l.divider",
            appearance: appearance
        )
    }
    
    var rounded: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.LDividerRounded> {
        var size =  TabBarHasLabelAnySize(size: appearance.size)
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
        appearance.tabBarItemAppearance = TabBarItem.l.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.label.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.LDividerRounded> {
    
    var rounded: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.LDividerRounded> {
        var size =  TabBarHasLabelAnySize(size: appearance.size)
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
        appearance.tabBarItemAppearance = TabBarItem.l.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.label.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.LRounded> {
    
    var rounded: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.LRounded> {
        var size =  TabBarHasLabelAnySize(size: appearance.size)
        size.topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.rounded",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.label.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.LShadow> {
    
    var rounded: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.LShadowRounded> {
        var size =  TabBarHasLabelAnySize(size: appearance.size)
        size.topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.shadow.rounded",
            appearance: appearance
        )
    }
    
    var shadow: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.LShadow> {
        var size =  TabBarHasLabelAnySize(size: appearance.size)

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
        appearance.tabBarItemAppearance = TabBarItem.l.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.label.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.LShadowRounded> {
    
    var rounded: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.LShadowRounded> {
        var size =  TabBarHasLabelAnySize(size: appearance.size)
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
        appearance.tabBarItemAppearance = TabBarItem.l.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.label.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.M> {
    
    var divider: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.MDivider> {
        var size =  TabBarHasLabelAnySize(size: appearance.size)
        size.dividerThickness = CGFloat(1.0)

        var appearance = appearance
        appearance.size = size
        appearance.dividerColor = ColorToken.surfaceDefaultTransparentTertiary
    
        return .init(
            name: "m.divider",
            appearance: appearance
        )
    }
    
    var m: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.M> {
        var size =  TabBarHasLabelAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var rounded: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.MRounded> {
        var size =  TabBarHasLabelAnySize(size: appearance.size)
        size.topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.rounded",
            appearance: appearance
        )
    }
    
    var shadow: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.MShadow> {
        var size =  TabBarHasLabelAnySize(size: appearance.size)

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
        appearance.tabBarItemAppearance = TabBarItem.m.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.label.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.MDivider> {
    
    var divider: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.MDivider> {
        var size =  TabBarHasLabelAnySize(size: appearance.size)
        size.dividerThickness = CGFloat(1.0)

        var appearance = appearance
        appearance.size = size
        appearance.dividerColor = ColorToken.surfaceDefaultTransparentTertiary
    
        return .init(
            name: "m.divider",
            appearance: appearance
        )
    }
    
    var rounded: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.MDividerRounded> {
        var size =  TabBarHasLabelAnySize(size: appearance.size)
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
        appearance.tabBarItemAppearance = TabBarItem.m.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.label.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.MDividerRounded> {
    
    var rounded: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.MDividerRounded> {
        var size =  TabBarHasLabelAnySize(size: appearance.size)
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
        appearance.tabBarItemAppearance = TabBarItem.m.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.label.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.MRounded> {
    
    var rounded: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.MRounded> {
        var size =  TabBarHasLabelAnySize(size: appearance.size)
        size.topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.rounded",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.label.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.MShadow> {
    
    var rounded: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.MShadowRounded> {
        var size =  TabBarHasLabelAnySize(size: appearance.size)
        size.topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.shadow.rounded",
            appearance: appearance
        )
    }
    
    var shadow: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.MShadow> {
        var size =  TabBarHasLabelAnySize(size: appearance.size)

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
        appearance.tabBarItemAppearance = TabBarItem.m.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.label.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.MShadowRounded> {
    
    var rounded: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.MShadowRounded> {
        var size =  TabBarHasLabelAnySize(size: appearance.size)
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
        appearance.tabBarItemAppearance = TabBarItem.m.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.label.secondary.appearance
        
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


public extension ComponentAppearanceVariation<TabBarHasLabel, TabBarAppearance> {
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
