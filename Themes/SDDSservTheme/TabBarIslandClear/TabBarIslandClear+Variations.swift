import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<TabBarIslandClear, TabBarIslandAppearance, TabBarIslandClearVariation.L> {
    
    var l: GeneralAppearanceVariation<TabBarIslandClear, TabBarIslandAppearance, TabBarIslandClearVariation.L> {
        var size =  TabBarIslandClearAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var shadow: GeneralAppearanceVariation<TabBarIslandClear, TabBarIslandAppearance, TabBarIslandClearVariation.LShadow> {
        var size =  TabBarIslandClearAnySize(size: appearance.size)

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
        appearance.tabBarItemAppearance = TabBarItemClear.l.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarIslandClear, TabBarIslandAppearance, TabBarIslandClearVariation.LShadow> {
    
    var shadow: GeneralAppearanceVariation<TabBarIslandClear, TabBarIslandAppearance, TabBarIslandClearVariation.LShadow> {
        var size =  TabBarIslandClearAnySize(size: appearance.size)

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
        appearance.tabBarItemAppearance = TabBarItemClear.l.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.l.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarIslandClear, TabBarIslandAppearance, TabBarIslandClearVariation.M> {
    
    var m: GeneralAppearanceVariation<TabBarIslandClear, TabBarIslandAppearance, TabBarIslandClearVariation.M> {
        var size =  TabBarIslandClearAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var shadow: GeneralAppearanceVariation<TabBarIslandClear, TabBarIslandAppearance, TabBarIslandClearVariation.MShadow> {
        var size =  TabBarIslandClearAnySize(size: appearance.size)

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
        appearance.tabBarItemAppearance = TabBarItemClear.m.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.secondary.appearance
        
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

public extension GeneralAppearanceVariation<TabBarIslandClear, TabBarIslandAppearance, TabBarIslandClearVariation.MShadow> {
    
    var shadow: GeneralAppearanceVariation<TabBarIslandClear, TabBarIslandAppearance, TabBarIslandClearVariation.MShadow> {
        var size =  TabBarIslandClearAnySize(size: appearance.size)

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
        appearance.tabBarItemAppearance = TabBarItemClear.m.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<TabBarIslandAppearance> {
        var appearance = appearance
        appearance.tabBarItemAppearance = TabBarItemClear.m.secondary.appearance
        
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


public extension ComponentAppearanceVariation<TabBarIslandClear, TabBarIslandAppearance> {
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
