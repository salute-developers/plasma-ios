import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<SelectItemSingleNormal, SelectItemAppearance, SelectItemSingleNormalVariation.L> {
    
    var l: ComponentAppearanceVariation<SelectItemSingleNormal, SelectItemAppearance> {
        var size =  SelectItemSingleNormalAnySize(size: appearance.size)
        size.controlMargin = CGFloat(6.0)
        size.controlSize = CGFloat(24.0)
        size.height = CGFloat(56.0)
        size.paddingBottom = CGFloat(16.0)
        size.paddingEnd = CGFloat(16.0)
        size.paddingStart = CGFloat(14.0)
        size.paddingTop = CGFloat(16.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.cellAppearance = Cell.l.appearance
        appearance.icon = Asset.done24.image
    
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

public extension GeneralAppearanceVariation<SelectItemSingleNormal, SelectItemAppearance, SelectItemSingleNormalVariation.M> {
    
    var m: ComponentAppearanceVariation<SelectItemSingleNormal, SelectItemAppearance> {
        var size =  SelectItemSingleNormalAnySize(size: appearance.size)
        size.controlMargin = CGFloat(6.0)
        size.controlSize = CGFloat(24.0)
        size.height = CGFloat(48.0)
        size.paddingBottom = CGFloat(12.0)
        size.paddingEnd = CGFloat(14.0)
        size.paddingStart = CGFloat(12.0)
        size.paddingTop = CGFloat(12.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.cellAppearance = Cell.m.appearance
        appearance.icon = Asset.done24.image
    
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

public extension GeneralAppearanceVariation<SelectItemSingleNormal, SelectItemAppearance, SelectItemSingleNormalVariation.S> {
    
    var s: ComponentAppearanceVariation<SelectItemSingleNormal, SelectItemAppearance> {
        var size =  SelectItemSingleNormalAnySize(size: appearance.size)
        size.controlMargin = CGFloat(6.0)
        size.controlSize = CGFloat(24.0)
        size.height = CGFloat(40.0)
        size.paddingBottom = CGFloat(8.0)
        size.paddingEnd = CGFloat(12.0)
        size.paddingStart = CGFloat(10.0)
        size.paddingTop = CGFloat(8.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.cellAppearance = Cell.s.appearance
        appearance.icon = Asset.done24.image
    
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

public extension GeneralAppearanceVariation<SelectItemSingleNormal, SelectItemAppearance, SelectItemSingleNormalVariation.Xl> {
    
    var xl: ComponentAppearanceVariation<SelectItemSingleNormal, SelectItemAppearance> {
        var size =  SelectItemSingleNormalAnySize(size: appearance.size)
        size.controlMargin = CGFloat(8.0)
        size.controlSize = CGFloat(24.0)
        size.height = CGFloat(64.0)
        size.paddingBottom = CGFloat(20.0)
        size.paddingEnd = CGFloat(18.0)
        size.paddingStart = CGFloat(16.0)
        size.paddingTop = CGFloat(20.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.cellAppearance = Cell.l.appearance
        appearance.icon = Asset.done24.image
    
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

public extension GeneralAppearanceVariation<SelectItemSingleNormal, SelectItemAppearance, SelectItemSingleNormalVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<SelectItemSingleNormal, SelectItemAppearance> {
        var size =  SelectItemSingleNormalAnySize(size: appearance.size)
        size.controlMargin = CGFloat(4.0)
        size.controlSize = CGFloat(16.0)
        size.height = CGFloat(32.0)
        size.paddingBottom = CGFloat(8.0)
        size.paddingEnd = CGFloat(8.0)
        size.paddingStart = CGFloat(6.0)
        size.paddingTop = CGFloat(8.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.cellAppearance = Cell.xs.appearance
        appearance.icon = Asset.done16.image
    
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


public extension ComponentAppearanceVariation<SelectItemSingleNormal, SelectItemAppearance> {
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

private extension SelectItemAppearance {
    
}
