import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<TabBar, TabBarAppearance, TabBarVariation.L> {
    
    var divider: GeneralAppearanceVariation<TabBar, TabBarAppearance, TabBarVariation.LDivider> {
        var size =  TabBarAnySize(size: appearance.size)
        size.dividerThickness = CGFloat(1.0)

        var appearance = appearance
        appearance.size = size
        appearance.dividerColor = ColorToken.surfaceDefaultTransparentTertiary
    
        return .init(
            name: "l.divider",
            appearance: appearance
        )
    }
    
    var rounded: GeneralAppearanceVariation<TabBar, TabBarAppearance, TabBarVariation.LRounded> {
        var size =  TabBarAnySize(size: appearance.size)
        size.topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.rounded",
            appearance: appearance
        )
    }
    
    var shadow: GeneralAppearanceVariation<TabBar, TabBarAppearance, TabBarVariation.LShadow> {
        var size =  TabBarAnySize(size: appearance.size)

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

public extension GeneralAppearanceVariation<TabBar, TabBarAppearance, TabBarVariation.LDivider> {
    
    var rounded: GeneralAppearanceVariation<TabBar, TabBarAppearance, TabBarVariation.LDividerRounded> {
        var size =  TabBarAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TabBar, TabBarAppearance, TabBarVariation.LShadow> {
    
    var rounded: GeneralAppearanceVariation<TabBar, TabBarAppearance, TabBarVariation.LShadowRounded> {
        var size =  TabBarAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TabBar, TabBarAppearance, TabBarVariation.M> {
    
    var divider: GeneralAppearanceVariation<TabBar, TabBarAppearance, TabBarVariation.MDivider> {
        var size =  TabBarAnySize(size: appearance.size)
        size.dividerThickness = CGFloat(1.0)

        var appearance = appearance
        appearance.size = size
        appearance.dividerColor = ColorToken.surfaceDefaultTransparentTertiary
    
        return .init(
            name: "m.divider",
            appearance: appearance
        )
    }
    
    var rounded: GeneralAppearanceVariation<TabBar, TabBarAppearance, TabBarVariation.MRounded> {
        var size =  TabBarAnySize(size: appearance.size)
        size.topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.rounded",
            appearance: appearance
        )
    }
    
    var shadow: GeneralAppearanceVariation<TabBar, TabBarAppearance, TabBarVariation.MShadow> {
        var size =  TabBarAnySize(size: appearance.size)

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

public extension GeneralAppearanceVariation<TabBar, TabBarAppearance, TabBarVariation.MDivider> {
    
    var rounded: GeneralAppearanceVariation<TabBar, TabBarAppearance, TabBarVariation.MDividerRounded> {
        var size =  TabBarAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TabBar, TabBarAppearance, TabBarVariation.MShadow> {
    
    var rounded: GeneralAppearanceVariation<TabBar, TabBarAppearance, TabBarVariation.MShadowRounded> {
        var size =  TabBarAnySize(size: appearance.size)
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


public extension ComponentAppearanceVariation<TabBar, TabBarAppearance> {
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
