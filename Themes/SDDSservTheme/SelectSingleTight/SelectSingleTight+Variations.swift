import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<SelectSingleTight, SelectAppearance, SelectSingleTightVariation.L> {
    
    var l: ComponentAppearanceVariation<SelectSingleTight, SelectAppearance> {
        var size =  SelectSingleTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.l.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuTight.l.appearance
        appearance.selectItemAppearance = SelectItemSingleTight.l.appearance
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

public extension GeneralAppearanceVariation<SelectSingleTight, SelectAppearance, SelectSingleTightVariation.M> {
    
    var m: ComponentAppearanceVariation<SelectSingleTight, SelectAppearance> {
        var size =  SelectSingleTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.m.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuTight.m.appearance
        appearance.selectItemAppearance = SelectItemSingleTight.m.appearance
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

public extension GeneralAppearanceVariation<SelectSingleTight, SelectAppearance, SelectSingleTightVariation.S> {
    
    var s: ComponentAppearanceVariation<SelectSingleTight, SelectAppearance> {
        var size =  SelectSingleTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.s.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuTight.s.appearance
        appearance.selectItemAppearance = SelectItemSingleTight.s.appearance
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

public extension GeneralAppearanceVariation<SelectSingleTight, SelectAppearance, SelectSingleTightVariation.Xl> {
    
    var xl: ComponentAppearanceVariation<SelectSingleTight, SelectAppearance> {
        var size =  SelectSingleTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.xl.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuTight.xl.appearance
        appearance.selectItemAppearance = SelectItemSingleTight.xl.appearance
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

public extension GeneralAppearanceVariation<SelectSingleTight, SelectAppearance, SelectSingleTightVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<SelectSingleTight, SelectAppearance> {
        var size =  SelectSingleTightAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.xs.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuTight.xs.appearance
        appearance.selectItemAppearance = SelectItemSingleTight.xs.appearance
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


public extension ComponentAppearanceVariation<SelectSingleTight, SelectAppearance> {
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
