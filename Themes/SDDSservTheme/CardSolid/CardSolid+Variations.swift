import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<CardSolid, CardAppearance, CardSolidVariation.L> {
    
    var l: ComponentAppearanceVariation<CardSolid, CardAppearance> {
        var size =  CardSolidAnySize(size: appearance.size)
        size.paddingBottom = CGFloat(12.0)
        size.paddingEnd = CGFloat(12.0)
        size.paddingStart = CGFloat(12.0)
        size.paddingTop = CGFloat(12.0)
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

public extension GeneralAppearanceVariation<CardSolid, CardAppearance, CardSolidVariation.M> {
    
    var m: ComponentAppearanceVariation<CardSolid, CardAppearance> {
        var size =  CardSolidAnySize(size: appearance.size)
        size.paddingBottom = CGFloat(10.0)
        size.paddingEnd = CGFloat(10.0)
        size.paddingStart = CGFloat(10.0)
        size.paddingTop = CGFloat(10.0)
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

public extension GeneralAppearanceVariation<CardSolid, CardAppearance, CardSolidVariation.S> {
    
    var s: ComponentAppearanceVariation<CardSolid, CardAppearance> {
        var size =  CardSolidAnySize(size: appearance.size)
        size.paddingBottom = CGFloat(8.0)
        size.paddingEnd = CGFloat(8.0)
        size.paddingStart = CGFloat(8.0)
        size.paddingTop = CGFloat(8.0)
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


public extension ComponentAppearanceVariation<CardSolid, CardAppearance> {
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
