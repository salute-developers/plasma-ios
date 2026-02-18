import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<AutocompleteNormal, AutocompleteAppearance, AutocompleteNormalVariation.L> {
    
    var l: ComponentAppearanceVariation<AutocompleteNormal, AutocompleteAppearance> {
        var size =  AutocompleteNormalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.dropdownAppearance = DropdownMenuNormal.l.appearance
        appearance.textFieldAppearance = TextField.l.default.appearance
    
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

public extension GeneralAppearanceVariation<AutocompleteNormal, AutocompleteAppearance, AutocompleteNormalVariation.M> {
    
    var m: ComponentAppearanceVariation<AutocompleteNormal, AutocompleteAppearance> {
        var size =  AutocompleteNormalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.dropdownAppearance = DropdownMenuNormal.m.appearance
        appearance.textFieldAppearance = TextField.m.default.appearance
    
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

public extension GeneralAppearanceVariation<AutocompleteNormal, AutocompleteAppearance, AutocompleteNormalVariation.S> {
    
    var s: ComponentAppearanceVariation<AutocompleteNormal, AutocompleteAppearance> {
        var size =  AutocompleteNormalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.dropdownAppearance = DropdownMenuNormal.s.appearance
        appearance.textFieldAppearance = TextField.s.default.appearance
    
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

public extension GeneralAppearanceVariation<AutocompleteNormal, AutocompleteAppearance, AutocompleteNormalVariation.Xl> {
    
    var xl: ComponentAppearanceVariation<AutocompleteNormal, AutocompleteAppearance> {
        var size =  AutocompleteNormalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.dropdownAppearance = DropdownMenuNormal.xl.appearance
        appearance.textFieldAppearance = TextField.xl.default.appearance
    
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

public extension GeneralAppearanceVariation<AutocompleteNormal, AutocompleteAppearance, AutocompleteNormalVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<AutocompleteNormal, AutocompleteAppearance> {
        var size =  AutocompleteNormalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.dropdownAppearance = DropdownMenuNormal.xs.appearance
        appearance.textFieldAppearance = TextField.xs.default.appearance
    
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


public extension ComponentAppearanceVariation<AutocompleteNormal, AutocompleteAppearance> {
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

private extension AutocompleteAppearance {
    
}
