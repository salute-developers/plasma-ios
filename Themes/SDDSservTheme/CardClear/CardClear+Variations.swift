import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<CardClear, CardAppearance, CardClearVariation.L> {
    
    var l: ComponentAppearanceVariation<CardClear, CardAppearance> {
        var size =  CardClearAnySize(size: appearance.size)
        size.paddingBottom = CGFloat(0.0)
        size.paddingEnd = CGFloat(0.0)
        size.paddingStart = CGFloat(0.0)
        size.paddingTop = CGFloat(0.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
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

public extension GeneralAppearanceVariation<CardClear, CardAppearance, CardClearVariation.M> {
    
    var m: ComponentAppearanceVariation<CardClear, CardAppearance> {
        var size =  CardClearAnySize(size: appearance.size)
        size.paddingBottom = CGFloat(0.0)
        size.paddingEnd = CGFloat(0.0)
        size.paddingStart = CGFloat(0.0)
        size.paddingTop = CGFloat(0.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
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

public extension GeneralAppearanceVariation<CardClear, CardAppearance, CardClearVariation.S> {
    
    var s: ComponentAppearanceVariation<CardClear, CardAppearance> {
        var size =  CardClearAnySize(size: appearance.size)
        size.paddingBottom = CGFloat(0.0)
        size.paddingEnd = CGFloat(0.0)
        size.paddingStart = CGFloat(0.0)
        size.paddingTop = CGFloat(0.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
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


public extension ComponentAppearanceVariation<CardClear, CardAppearance> {
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

private extension CardAppearance {
    
}
