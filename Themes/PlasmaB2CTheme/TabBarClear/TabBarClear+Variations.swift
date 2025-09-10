import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<TabBarClear, TabBarAppearance, TabBarClearVariation.L> {
    
    var divider: GeneralAppearanceVariation<TabBarClear, TabBarAppearance, TabBarClearVariation.LDivider> {
        var size =  TabBarClearAnySize(size: appearance.size)
        size.dividerThickness = CGFloat(1.0)

        var appearance = appearance
        appearance.size = size
        appearance.dividerColor = ColorToken.surfaceDefaultTransparentTertiary
    
        return .init(
            name: "l.divider",
            appearance: appearance
        )
    }
    
    var rounded: GeneralAppearanceVariation<TabBarClear, TabBarAppearance, TabBarClearVariation.LRounded> {
        var size =  TabBarClearAnySize(size: appearance.size)
        size.topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.rounded",
            appearance: appearance
        )
    }
    
    var shadow: GeneralAppearanceVariation<TabBarClear, TabBarAppearance, TabBarClearVariation.LShadow> {
        var size =  TabBarClearAnySize(size: appearance.size)

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
        appearance.tabBarItemAppearance = TabBarItemClear.l.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarClear, TabBarAppearance, TabBarClearVariation.LDivider> {
    
    var rounded: GeneralAppearanceVariation<TabBarClear, TabBarAppearance, TabBarClearVariation.LDividerRounded> {
        var size =  TabBarClearAnySize(size: appearance.size)
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
        appearance.tabBarItemAppearance = TabBarItemClear.l.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarClear, TabBarAppearance, TabBarClearVariation.LShadow> {
    
    var rounded: GeneralAppearanceVariation<TabBarClear, TabBarAppearance, TabBarClearVariation.LShadowRounded> {
        var size =  TabBarClearAnySize(size: appearance.size)
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
        appearance.tabBarItemAppearance = TabBarItemClear.l.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarClear, TabBarAppearance, TabBarClearVariation.M> {
    
    var divider: GeneralAppearanceVariation<TabBarClear, TabBarAppearance, TabBarClearVariation.MDivider> {
        var size =  TabBarClearAnySize(size: appearance.size)
        size.dividerThickness = CGFloat(1.0)

        var appearance = appearance
        appearance.size = size
        appearance.dividerColor = ColorToken.surfaceDefaultTransparentTertiary
    
        return .init(
            name: "m.divider",
            appearance: appearance
        )
    }
    
    var rounded: GeneralAppearanceVariation<TabBarClear, TabBarAppearance, TabBarClearVariation.MRounded> {
        var size =  TabBarClearAnySize(size: appearance.size)
        size.topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.rounded",
            appearance: appearance
        )
    }
    
    var shadow: GeneralAppearanceVariation<TabBarClear, TabBarAppearance, TabBarClearVariation.MShadow> {
        var size =  TabBarClearAnySize(size: appearance.size)

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
        appearance.tabBarItemAppearance = TabBarItemClear.m.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarClear, TabBarAppearance, TabBarClearVariation.MDivider> {
    
    var rounded: GeneralAppearanceVariation<TabBarClear, TabBarAppearance, TabBarClearVariation.MDividerRounded> {
        var size =  TabBarClearAnySize(size: appearance.size)
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
        appearance.tabBarItemAppearance = TabBarItemClear.m.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarClear, TabBarAppearance, TabBarClearVariation.MShadow> {
    
    var rounded: GeneralAppearanceVariation<TabBarClear, TabBarAppearance, TabBarClearVariation.MShadowRounded> {
        var size =  TabBarClearAnySize(size: appearance.size)
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
        appearance.tabBarItemAppearance = TabBarItemClear.m.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.secondary.appearance
        
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


public extension ComponentAppearanceVariation<TabBarClear, TabBarAppearance> {
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
