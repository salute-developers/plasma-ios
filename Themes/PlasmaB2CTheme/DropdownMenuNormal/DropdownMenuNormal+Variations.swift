import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<DropdownMenuNormal, DropdownMenuAppearance, DropdownMenuNormalVariation.L> {
    
    var l: ComponentAppearanceVariation<DropdownMenuNormal, DropdownMenuAppearance> {
        var size =  DropdownMenuNormalAnySize(size: appearance.size)
        size.offset = CGFloat(0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
        size.width = CGFloat(200.0)

        var appearance = appearance
        appearance.size = size
        appearance.listAppearance = DropdownMenuListNormal.l.appearance
    
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

public extension GeneralAppearanceVariation<DropdownMenuNormal, DropdownMenuAppearance, DropdownMenuNormalVariation.M> {
    
    var m: ComponentAppearanceVariation<DropdownMenuNormal, DropdownMenuAppearance> {
        var size =  DropdownMenuNormalAnySize(size: appearance.size)
        size.offset = CGFloat(0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.width = CGFloat(200.0)

        var appearance = appearance
        appearance.size = size
        appearance.listAppearance = DropdownMenuListNormal.m.appearance
    
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

public extension GeneralAppearanceVariation<DropdownMenuNormal, DropdownMenuAppearance, DropdownMenuNormalVariation.S> {
    
    var s: ComponentAppearanceVariation<DropdownMenuNormal, DropdownMenuAppearance> {
        var size =  DropdownMenuNormalAnySize(size: appearance.size)
        size.offset = CGFloat(0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
        size.width = CGFloat(160.0)

        var appearance = appearance
        appearance.size = size
        appearance.listAppearance = DropdownMenuListNormal.s.appearance
    
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

public extension GeneralAppearanceVariation<DropdownMenuNormal, DropdownMenuAppearance, DropdownMenuNormalVariation.Xl> {
    
    var xl: ComponentAppearanceVariation<DropdownMenuNormal, DropdownMenuAppearance> {
        var size =  DropdownMenuNormalAnySize(size: appearance.size)
        size.offset = CGFloat(0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer
        size.width = CGFloat(200.0)

        var appearance = appearance
        appearance.size = size
        appearance.listAppearance = DropdownMenuListNormal.xl.appearance
    
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

public extension GeneralAppearanceVariation<DropdownMenuNormal, DropdownMenuAppearance, DropdownMenuNormalVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<DropdownMenuNormal, DropdownMenuAppearance> {
        var size =  DropdownMenuNormalAnySize(size: appearance.size)
        size.offset = CGFloat(0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
        size.width = CGFloat(160.0)

        var appearance = appearance
        appearance.size = size
        appearance.listAppearance = DropdownMenuListNormal.xs.appearance
    
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


public extension ComponentAppearanceVariation<DropdownMenuNormal, DropdownMenuAppearance> {
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

private extension DropdownMenuAppearance {
    
}
