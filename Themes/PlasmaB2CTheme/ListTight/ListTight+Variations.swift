import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<ListTight, ListAppearance, ListTightVariation.L> {
    
    var l: ComponentAppearanceVariation<ListTight, ListAppearance> {
        var size =  ListTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.listItemAppearance = ListItemTight.l.appearance
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<ListTight, ListAppearance, ListTightVariation.M> {
    
    var m: ComponentAppearanceVariation<ListTight, ListAppearance> {
        var size =  ListTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.listItemAppearance = ListItemTight.m.appearance
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<ListTight, ListAppearance, ListTightVariation.S> {
    
    var s: ComponentAppearanceVariation<ListTight, ListAppearance> {
        var size =  ListTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.listItemAppearance = ListItemTight.s.appearance
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<ListTight, ListAppearance, ListTightVariation.Xl> {
    
    var xl: ComponentAppearanceVariation<ListTight, ListAppearance> {
        var size =  ListTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.listItemAppearance = ListItemTight.xl.appearance
    
        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<ListTight, ListAppearance, ListTightVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<ListTight, ListAppearance> {
        var size =  ListTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.listItemAppearance = ListItemTight.xs.appearance
    
        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
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


public extension ComponentAppearanceVariation<ListTight, ListAppearance> {
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

private extension ListAppearance {
    
}
