import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<AutocompleteTight, AutocompleteAppearance, AutocompleteTightVariation.L> {
    
    var l: ComponentAppearanceVariation<AutocompleteTight, AutocompleteAppearance> {
        var size =  AutocompleteTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.dropdownAppearance = DropdownMenuTight.l.appearance
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

public extension GeneralAppearanceVariation<AutocompleteTight, AutocompleteAppearance, AutocompleteTightVariation.M> {
    
    var m: ComponentAppearanceVariation<AutocompleteTight, AutocompleteAppearance> {
        var size =  AutocompleteTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.dropdownAppearance = DropdownMenuTight.m.appearance
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

public extension GeneralAppearanceVariation<AutocompleteTight, AutocompleteAppearance, AutocompleteTightVariation.S> {
    
    var s: ComponentAppearanceVariation<AutocompleteTight, AutocompleteAppearance> {
        var size =  AutocompleteTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.dropdownAppearance = DropdownMenuTight.s.appearance
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

public extension GeneralAppearanceVariation<AutocompleteTight, AutocompleteAppearance, AutocompleteTightVariation.Xl> {
    
    var xl: ComponentAppearanceVariation<AutocompleteTight, AutocompleteAppearance> {
        var size =  AutocompleteTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.dropdownAppearance = DropdownMenuTight.xl.appearance
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

public extension GeneralAppearanceVariation<AutocompleteTight, AutocompleteAppearance, AutocompleteTightVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<AutocompleteTight, AutocompleteAppearance> {
        var size =  AutocompleteTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.dropdownAppearance = DropdownMenuTight.xs.appearance
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


public extension ComponentAppearanceVariation<AutocompleteTight, AutocompleteAppearance> {
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
