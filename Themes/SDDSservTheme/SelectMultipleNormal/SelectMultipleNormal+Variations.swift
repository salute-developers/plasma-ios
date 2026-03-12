import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<SelectMultipleNormal, SelectAppearance, SelectMultipleNormalVariation.L> {
    
    var l: ComponentAppearanceVariation<SelectMultipleNormal, SelectAppearance> {
        var size =  SelectMultipleNormalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.l.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuNormal.l.appearance
        appearance.selectItemAppearance = SelectItemMultipleNormal.l.appearance
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

public extension GeneralAppearanceVariation<SelectMultipleNormal, SelectAppearance, SelectMultipleNormalVariation.M> {
    
    var m: ComponentAppearanceVariation<SelectMultipleNormal, SelectAppearance> {
        var size =  SelectMultipleNormalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.m.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuNormal.m.appearance
        appearance.selectItemAppearance = SelectItemMultipleNormal.m.appearance
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

public extension GeneralAppearanceVariation<SelectMultipleNormal, SelectAppearance, SelectMultipleNormalVariation.S> {
    
    var s: ComponentAppearanceVariation<SelectMultipleNormal, SelectAppearance> {
        var size =  SelectMultipleNormalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.s.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuNormal.s.appearance
        appearance.selectItemAppearance = SelectItemMultipleNormal.s.appearance
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

public extension GeneralAppearanceVariation<SelectMultipleNormal, SelectAppearance, SelectMultipleNormalVariation.Xl> {
    
    var xl: ComponentAppearanceVariation<SelectMultipleNormal, SelectAppearance> {
        var size =  SelectMultipleNormalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.xl.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuNormal.xl.appearance
        appearance.selectItemAppearance = SelectItemMultipleNormal.xl.appearance
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

public extension GeneralAppearanceVariation<SelectMultipleNormal, SelectAppearance, SelectMultipleNormalVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<SelectMultipleNormal, SelectAppearance> {
        var size =  SelectMultipleNormalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.xs.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuNormal.xs.appearance
        appearance.selectItemAppearance = SelectItemMultipleNormal.xs.appearance
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


public extension ComponentAppearanceVariation<SelectMultipleNormal, SelectAppearance> {
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
