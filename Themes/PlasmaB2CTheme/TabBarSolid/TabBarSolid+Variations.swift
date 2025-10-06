import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.L> {
    
    var divider: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.LDivider> {
        var size =  TabBarSolidAnySize(size: appearance.size)
        size.dividerThickness = CGFloat(1.0)

        var appearance = appearance
        appearance.size = size
        appearance.dividerColor = ColorToken.surfaceDefaultTransparentTertiary
    
        return .init(
            name: "l.divider",
            appearance: appearance
        )
    }
    
    var l: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.L> {
        var size =  TabBarSolidAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var rounded: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.LRounded> {
        var size =  TabBarSolidAnySize(size: appearance.size)
        size.topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.rounded",
            appearance: appearance
        )
    }
    
    var shadow: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.LShadow> {
        var size =  TabBarSolidAnySize(size: appearance.size)

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
        appearance.tabBarItemAppearance = TabBarItem.l.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.LDivider> {
    
    var divider: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.LDivider> {
        var size =  TabBarSolidAnySize(size: appearance.size)
        size.dividerThickness = CGFloat(1.0)

        var appearance = appearance
        appearance.size = size
        appearance.dividerColor = ColorToken.surfaceDefaultTransparentTertiary
    
        return .init(
            name: "l.divider",
            appearance: appearance
        )
    }
    
    var rounded: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.LDividerRounded> {
        var size =  TabBarSolidAnySize(size: appearance.size)
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
        appearance.tabBarItemAppearance = TabBarItem.l.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.LDividerRounded> {
    
    var rounded: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.LDividerRounded> {
        var size =  TabBarSolidAnySize(size: appearance.size)
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
        appearance.tabBarItemAppearance = TabBarItem.l.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.LRounded> {
    
    var rounded: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.LRounded> {
        var size =  TabBarSolidAnySize(size: appearance.size)
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
        appearance.tabBarItemAppearance = TabBarItem.l.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.LShadow> {
    
    var rounded: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.LShadowRounded> {
        var size =  TabBarSolidAnySize(size: appearance.size)
        size.topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.shadow.rounded",
            appearance: appearance
        )
    }
    
    var shadow: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.LShadow> {
        var size =  TabBarSolidAnySize(size: appearance.size)

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
        appearance.tabBarItemAppearance = TabBarItem.l.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.LShadowRounded> {
    
    var rounded: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.LShadowRounded> {
        var size =  TabBarSolidAnySize(size: appearance.size)
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
        appearance.tabBarItemAppearance = TabBarItem.l.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.M> {
    
    var divider: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.MDivider> {
        var size =  TabBarSolidAnySize(size: appearance.size)
        size.dividerThickness = CGFloat(1.0)

        var appearance = appearance
        appearance.size = size
        appearance.dividerColor = ColorToken.surfaceDefaultTransparentTertiary
    
        return .init(
            name: "m.divider",
            appearance: appearance
        )
    }
    
    var m: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.M> {
        var size =  TabBarSolidAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var rounded: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.MRounded> {
        var size =  TabBarSolidAnySize(size: appearance.size)
        size.topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.rounded",
            appearance: appearance
        )
    }
    
    var shadow: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.MShadow> {
        var size =  TabBarSolidAnySize(size: appearance.size)

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
        appearance.tabBarItemAppearance = TabBarItem.m.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.MDivider> {
    
    var divider: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.MDivider> {
        var size =  TabBarSolidAnySize(size: appearance.size)
        size.dividerThickness = CGFloat(1.0)

        var appearance = appearance
        appearance.size = size
        appearance.dividerColor = ColorToken.surfaceDefaultTransparentTertiary
    
        return .init(
            name: "m.divider",
            appearance: appearance
        )
    }
    
    var rounded: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.MDividerRounded> {
        var size =  TabBarSolidAnySize(size: appearance.size)
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
        appearance.tabBarItemAppearance = TabBarItem.m.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.MDividerRounded> {
    
    var rounded: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.MDividerRounded> {
        var size =  TabBarSolidAnySize(size: appearance.size)
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
        appearance.tabBarItemAppearance = TabBarItem.m.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.MRounded> {
    
    var rounded: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.MRounded> {
        var size =  TabBarSolidAnySize(size: appearance.size)
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
        appearance.tabBarItemAppearance = TabBarItem.m.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.MShadow> {
    
    var rounded: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.MShadowRounded> {
        var size =  TabBarSolidAnySize(size: appearance.size)
        size.topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.shadow.rounded",
            appearance: appearance
        )
    }
    
    var shadow: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.MShadow> {
        var size =  TabBarSolidAnySize(size: appearance.size)

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
        appearance.tabBarItemAppearance = TabBarItem.m.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.MShadowRounded> {
    
    var rounded: GeneralAppearanceVariation<TabBarSolid, TabBarAppearance, TabBarSolidVariation.MShadowRounded> {
        var size =  TabBarSolidAnySize(size: appearance.size)
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
        appearance.tabBarItemAppearance = TabBarItem.m.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.secondary.appearance
        
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


public extension ComponentAppearanceVariation<TabBarSolid, TabBarAppearance> {
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
