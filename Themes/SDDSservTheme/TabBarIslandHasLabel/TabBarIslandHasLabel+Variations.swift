import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<TabBarIslandHasLabel, TabBarIslandAppearance, TabBarIslandHasLabelVariation.L> {
    
    var shadow: GeneralAppearanceVariation<TabBarIslandHasLabel, TabBarIslandAppearance, TabBarIslandHasLabelVariation.LShadow> {
        var size =  TabBarIslandHasLabelAnySize(size: appearance.size)

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
        appearance.tabBarItemAppearance = TabBarItem.l.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.label.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarIslandHasLabel, TabBarIslandAppearance, TabBarIslandHasLabelVariation.LShadow> {
    
    var `default`: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.l.label.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarIslandHasLabel, TabBarIslandAppearance, TabBarIslandHasLabelVariation.M> {
    
    var shadow: GeneralAppearanceVariation<TabBarIslandHasLabel, TabBarIslandAppearance, TabBarIslandHasLabelVariation.MShadow> {
        var size =  TabBarIslandHasLabelAnySize(size: appearance.size)

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
        appearance.tabBarItemAppearance = TabBarItem.m.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.label.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarIslandHasLabel, TabBarIslandAppearance, TabBarIslandHasLabelVariation.MShadow> {
    
    var `default`: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.label.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.label.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItem.m.label.secondary.appearance
        
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


public extension ComponentAppearanceVariation<TabBarIslandHasLabel, TabBarIslandAppearance> {
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
