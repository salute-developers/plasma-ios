import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<TabBarIslandHasLabelClear, TabBarAppearance, TabBarIslandHasLabelClearVariation.L> {
    
    var l: GeneralAppearanceVariation<TabBarIslandHasLabelClear, TabBarAppearance, TabBarIslandHasLabelClearVariation.L> {
        var size =  TabBarIslandHasLabelClearAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var shadow: GeneralAppearanceVariation<TabBarIslandHasLabelClear, TabBarAppearance, TabBarIslandHasLabelClearVariation.LShadow> {
        var size =  TabBarIslandHasLabelClearAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.shadow = ShadowToken.downSoftM
    
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

public extension GeneralAppearanceVariation<TabBarIslandHasLabelClear, TabBarAppearance, TabBarIslandHasLabelClearVariation.LShadow> {
    
    var shadow: GeneralAppearanceVariation<TabBarIslandHasLabelClear, TabBarAppearance, TabBarIslandHasLabelClearVariation.LShadow> {
        var size =  TabBarIslandHasLabelClearAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.shadow = ShadowToken.downSoftM
    
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

public extension GeneralAppearanceVariation<TabBarIslandHasLabelClear, TabBarAppearance, TabBarIslandHasLabelClearVariation.M> {
    
    var m: GeneralAppearanceVariation<TabBarIslandHasLabelClear, TabBarAppearance, TabBarIslandHasLabelClearVariation.M> {
        var size =  TabBarIslandHasLabelClearAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var shadow: GeneralAppearanceVariation<TabBarIslandHasLabelClear, TabBarAppearance, TabBarIslandHasLabelClearVariation.MShadow> {
        var size =  TabBarIslandHasLabelClearAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.shadow = ShadowToken.downSoftM
    
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

public extension GeneralAppearanceVariation<TabBarIslandHasLabelClear, TabBarAppearance, TabBarIslandHasLabelClearVariation.MShadow> {
    
    var shadow: GeneralAppearanceVariation<TabBarIslandHasLabelClear, TabBarAppearance, TabBarIslandHasLabelClearVariation.MShadow> {
        var size =  TabBarIslandHasLabelClearAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.shadow = ShadowToken.downSoftM
    
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


public extension ComponentAppearanceVariation<TabBarIslandHasLabelClear, TabBarAppearance> {
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

