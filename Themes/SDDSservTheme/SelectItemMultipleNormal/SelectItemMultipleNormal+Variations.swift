import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<SelectItemMultipleNormal, SelectItemAppearance, SelectItemMultipleNormalVariation.L> {
    
    var l: ComponentAppearanceVariation<SelectItemMultipleNormal, SelectItemAppearance> {
        var size =  SelectItemMultipleNormalAnySize(size: appearance.size)
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
        appearance.checkboxAppearance = Checkbox.m.default.appearance
    
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

public extension GeneralAppearanceVariation<SelectItemMultipleNormal, SelectItemAppearance, SelectItemMultipleNormalVariation.M> {
    
    var m: ComponentAppearanceVariation<SelectItemMultipleNormal, SelectItemAppearance> {
        var size =  SelectItemMultipleNormalAnySize(size: appearance.size)
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
        appearance.checkboxAppearance = Checkbox.m.default.appearance
    
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

public extension GeneralAppearanceVariation<SelectItemMultipleNormal, SelectItemAppearance, SelectItemMultipleNormalVariation.S> {
    
    var s: ComponentAppearanceVariation<SelectItemMultipleNormal, SelectItemAppearance> {
        var size =  SelectItemMultipleNormalAnySize(size: appearance.size)
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
        appearance.checkboxAppearance = Checkbox.m.default.appearance
    
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

public extension GeneralAppearanceVariation<SelectItemMultipleNormal, SelectItemAppearance, SelectItemMultipleNormalVariation.Xl> {
    
    var xl: ComponentAppearanceVariation<SelectItemMultipleNormal, SelectItemAppearance> {
        var size =  SelectItemMultipleNormalAnySize(size: appearance.size)
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
        appearance.checkboxAppearance = Checkbox.m.default.appearance
    
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

public extension GeneralAppearanceVariation<SelectItemMultipleNormal, SelectItemAppearance, SelectItemMultipleNormalVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<SelectItemMultipleNormal, SelectItemAppearance> {
        var size =  SelectItemMultipleNormalAnySize(size: appearance.size)
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
        appearance.checkboxAppearance = Checkbox.s.default.appearance
    
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


public extension ComponentAppearanceVariation<SelectItemMultipleNormal, SelectItemAppearance> {
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
