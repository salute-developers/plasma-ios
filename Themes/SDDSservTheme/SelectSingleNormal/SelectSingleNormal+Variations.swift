import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<SelectSingleNormal, SelectAppearance, SelectSingleNormalVariation.L> {
    
    var l: ComponentAppearanceVariation<SelectSingleNormal, SelectAppearance> {
        var size =  SelectSingleNormalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.l.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuNormal.l.appearance
        appearance.selectItemAppearance = SelectItemSingleNormal.l.appearance
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

public extension GeneralAppearanceVariation<SelectSingleNormal, SelectAppearance, SelectSingleNormalVariation.M> {
    
    var m: ComponentAppearanceVariation<SelectSingleNormal, SelectAppearance> {
        var size =  SelectSingleNormalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.m.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuNormal.m.appearance
        appearance.selectItemAppearance = SelectItemSingleNormal.m.appearance
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

public extension GeneralAppearanceVariation<SelectSingleNormal, SelectAppearance, SelectSingleNormalVariation.S> {
    
    var s: ComponentAppearanceVariation<SelectSingleNormal, SelectAppearance> {
        var size =  SelectSingleNormalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.s.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuNormal.s.appearance
        appearance.selectItemAppearance = SelectItemSingleNormal.s.appearance
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

public extension GeneralAppearanceVariation<SelectSingleNormal, SelectAppearance, SelectSingleNormalVariation.Xl> {
    
    var xl: ComponentAppearanceVariation<SelectSingleNormal, SelectAppearance> {
        var size =  SelectSingleNormalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.xl.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuNormal.xl.appearance
        appearance.selectItemAppearance = SelectItemSingleNormal.xl.appearance
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

public extension GeneralAppearanceVariation<SelectSingleNormal, SelectAppearance, SelectSingleNormalVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<SelectSingleNormal, SelectAppearance> {
        var size =  SelectSingleNormalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.xs.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuNormal.xs.appearance
        appearance.selectItemAppearance = SelectItemSingleNormal.xs.appearance
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


public extension ComponentAppearanceVariation<SelectSingleNormal, SelectAppearance> {
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
