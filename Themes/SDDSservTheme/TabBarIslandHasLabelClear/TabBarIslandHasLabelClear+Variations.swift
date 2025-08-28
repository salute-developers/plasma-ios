import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<TabBarIslandHasLabelClear, TabBarIslandAppearance, TabBarIslandHasLabelClearVariation.L> {
    
    var shadow: GeneralAppearanceVariation<TabBarIslandHasLabelClear, TabBarIslandAppearance, TabBarIslandHasLabelClearVariation.LShadow> {
        var size =  TabBarIslandHasLabelClearAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.shadow = ShadowToken.downSoftM
    
        return .init(
            name: "l.shadow",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<TabBarIslandAppearance> {
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

public extension GeneralAppearanceVariation<TabBarIslandHasLabelClear, TabBarIslandAppearance, TabBarIslandHasLabelClearVariation.LShadow> {
    
    var `default`: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.label.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<TabBarIslandAppearance> {
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

public extension GeneralAppearanceVariation<TabBarIslandHasLabelClear, TabBarIslandAppearance, TabBarIslandHasLabelClearVariation.M> {
    
    var shadow: GeneralAppearanceVariation<TabBarIslandHasLabelClear, TabBarIslandAppearance, TabBarIslandHasLabelClearVariation.MShadow> {
        var size =  TabBarIslandHasLabelClearAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.shadow = ShadowToken.downSoftM
    
        return .init(
            name: "m.shadow",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<TabBarIslandAppearance> {
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

public extension GeneralAppearanceVariation<TabBarIslandHasLabelClear, TabBarIslandAppearance, TabBarIslandHasLabelClearVariation.MShadow> {
    
    var `default`: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.label.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<TabBarIslandAppearance> {
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


public extension ComponentAppearanceVariation<TabBarIslandHasLabelClear, TabBarIslandAppearance> {
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

private extension TabBarIslandAppearance {
    
}
