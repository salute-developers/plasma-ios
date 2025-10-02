import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<DropdownMenuListNormal, ListAppearance, DropdownMenuListNormalVariation.L> {
    
    var l: ComponentAppearanceVariation<DropdownMenuListNormal, ListAppearance> {
        var size =  DropdownMenuListNormalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.listItemAppearance = DropdownMenuItemNormal.l.default.appearance
    
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

public extension GeneralAppearanceVariation<DropdownMenuListNormal, ListAppearance, DropdownMenuListNormalVariation.M> {
    
    var m: ComponentAppearanceVariation<DropdownMenuListNormal, ListAppearance> {
        var size =  DropdownMenuListNormalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.listItemAppearance = DropdownMenuItemNormal.m.default.appearance
    
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

public extension GeneralAppearanceVariation<DropdownMenuListNormal, ListAppearance, DropdownMenuListNormalVariation.S> {
    
    var s: ComponentAppearanceVariation<DropdownMenuListNormal, ListAppearance> {
        var size =  DropdownMenuListNormalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.listItemAppearance = DropdownMenuItemNormal.s.default.appearance
    
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

public extension GeneralAppearanceVariation<DropdownMenuListNormal, ListAppearance, DropdownMenuListNormalVariation.Xl> {
    
    var xl: ComponentAppearanceVariation<DropdownMenuListNormal, ListAppearance> {
        var size =  DropdownMenuListNormalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.listItemAppearance = DropdownMenuItemNormal.xl.default.appearance
    
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

public extension GeneralAppearanceVariation<DropdownMenuListNormal, ListAppearance, DropdownMenuListNormalVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<DropdownMenuListNormal, ListAppearance> {
        var size =  DropdownMenuListNormalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.listItemAppearance = DropdownMenuItemNormal.xs.default.appearance
    
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


public extension ComponentAppearanceVariation<DropdownMenuListNormal, ListAppearance> {
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
