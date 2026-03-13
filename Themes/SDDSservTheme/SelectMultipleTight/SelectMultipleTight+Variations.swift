import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<SelectMultipleTight, SelectAppearance, SelectMultipleTightVariation.L> {
    
    var l: ComponentAppearanceVariation<SelectMultipleTight, SelectAppearance> {
        var size =  SelectMultipleTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.l.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuTight.l.appearance
        appearance.selectItemAppearance = SelectItemMultipleTight.l.appearance
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

public extension GeneralAppearanceVariation<SelectMultipleTight, SelectAppearance, SelectMultipleTightVariation.M> {
    
    var m: ComponentAppearanceVariation<SelectMultipleTight, SelectAppearance> {
        var size =  SelectMultipleTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.m.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuTight.m.appearance
        appearance.selectItemAppearance = SelectItemMultipleTight.m.appearance
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

public extension GeneralAppearanceVariation<SelectMultipleTight, SelectAppearance, SelectMultipleTightVariation.S> {
    
    var s: ComponentAppearanceVariation<SelectMultipleTight, SelectAppearance> {
        var size =  SelectMultipleTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.s.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuTight.s.appearance
        appearance.selectItemAppearance = SelectItemMultipleTight.s.appearance
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

public extension GeneralAppearanceVariation<SelectMultipleTight, SelectAppearance, SelectMultipleTightVariation.Xl> {
    
    var xl: ComponentAppearanceVariation<SelectMultipleTight, SelectAppearance> {
        var size =  SelectMultipleTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.xl.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuTight.xl.appearance
        appearance.selectItemAppearance = SelectItemMultipleTight.xl.appearance
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

public extension GeneralAppearanceVariation<SelectMultipleTight, SelectAppearance, SelectMultipleTightVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<SelectMultipleTight, SelectAppearance> {
        var size =  SelectMultipleTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.xs.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuTight.xs.appearance
        appearance.selectItemAppearance = SelectItemMultipleTight.xs.appearance
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


public extension ComponentAppearanceVariation<SelectMultipleTight, SelectAppearance> {
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

private extension SelectAppearance {
    
}
