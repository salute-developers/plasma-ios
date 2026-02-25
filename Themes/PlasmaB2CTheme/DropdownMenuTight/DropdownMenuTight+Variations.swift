import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<DropdownMenuTight, DropdownMenuAppearance, DropdownMenuTightVariation.L> {
    
    var l: ComponentAppearanceVariation<DropdownMenuTight, DropdownMenuAppearance> {
        var size =  DropdownMenuTightAnySize(size: appearance.size)
        size.offset = CGFloat(0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
        size.width = CGFloat(200.0)

        var appearance = appearance
        appearance.size = size
        appearance.listAppearance = DropdownMenuListTight.l.appearance
    
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

public extension GeneralAppearanceVariation<DropdownMenuTight, DropdownMenuAppearance, DropdownMenuTightVariation.M> {
    
    var m: ComponentAppearanceVariation<DropdownMenuTight, DropdownMenuAppearance> {
        var size =  DropdownMenuTightAnySize(size: appearance.size)
        size.offset = CGFloat(0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.width = CGFloat(200.0)

        var appearance = appearance
        appearance.size = size
        appearance.listAppearance = DropdownMenuListTight.m.appearance
    
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

public extension GeneralAppearanceVariation<DropdownMenuTight, DropdownMenuAppearance, DropdownMenuTightVariation.S> {
    
    var s: ComponentAppearanceVariation<DropdownMenuTight, DropdownMenuAppearance> {
        var size =  DropdownMenuTightAnySize(size: appearance.size)
        size.offset = CGFloat(0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
        size.width = CGFloat(160.0)

        var appearance = appearance
        appearance.size = size
        appearance.listAppearance = DropdownMenuListTight.s.appearance
    
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

public extension GeneralAppearanceVariation<DropdownMenuTight, DropdownMenuAppearance, DropdownMenuTightVariation.Xl> {
    
    var xl: ComponentAppearanceVariation<DropdownMenuTight, DropdownMenuAppearance> {
        var size =  DropdownMenuTightAnySize(size: appearance.size)
        size.offset = CGFloat(0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer
        size.width = CGFloat(200.0)

        var appearance = appearance
        appearance.size = size
        appearance.listAppearance = DropdownMenuListTight.xl.appearance
    
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

public extension GeneralAppearanceVariation<DropdownMenuTight, DropdownMenuAppearance, DropdownMenuTightVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<DropdownMenuTight, DropdownMenuAppearance> {
        var size =  DropdownMenuTightAnySize(size: appearance.size)
        size.offset = CGFloat(0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
        size.width = CGFloat(160.0)

        var appearance = appearance
        appearance.size = size
        appearance.listAppearance = DropdownMenuListTight.xs.appearance
    
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


public extension ComponentAppearanceVariation<DropdownMenuTight, DropdownMenuAppearance> {
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
