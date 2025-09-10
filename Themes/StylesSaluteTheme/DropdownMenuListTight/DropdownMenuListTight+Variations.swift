import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<DropdownMenuListTight, ListAppearance, DropdownMenuListTightVariation.L> {
    
    var l: ComponentAppearanceVariation<DropdownMenuListTight, ListAppearance> {
        var size =  DropdownMenuListTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.listItemAppearance = DropdownMenuItemTight.l.default.appearance
    
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

public extension GeneralAppearanceVariation<DropdownMenuListTight, ListAppearance, DropdownMenuListTightVariation.M> {
    
    var m: ComponentAppearanceVariation<DropdownMenuListTight, ListAppearance> {
        var size =  DropdownMenuListTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.listItemAppearance = DropdownMenuItemTight.m.default.appearance
    
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

public extension GeneralAppearanceVariation<DropdownMenuListTight, ListAppearance, DropdownMenuListTightVariation.S> {
    
    var s: ComponentAppearanceVariation<DropdownMenuListTight, ListAppearance> {
        var size =  DropdownMenuListTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.listItemAppearance = DropdownMenuItemTight.s.default.appearance
    
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

public extension GeneralAppearanceVariation<DropdownMenuListTight, ListAppearance, DropdownMenuListTightVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<DropdownMenuListTight, ListAppearance> {
        var size =  DropdownMenuListTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.listItemAppearance = DropdownMenuItemTight.xs.default.appearance
    
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


public extension ComponentAppearanceVariation<DropdownMenuListTight, ListAppearance> {
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
