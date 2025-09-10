import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<CodeField, CodeFieldAppearance, CodeFieldVariation.L> {
    
    var segmented: ComponentAppearanceVariation<CodeField, CodeFieldAppearance> {
        var size =  CodeFieldAnySize(size: appearance.size)
        size.groupShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
        size.itemShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXs.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.segmented",
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

public extension GeneralAppearanceVariation<CodeField, CodeFieldAppearance, CodeFieldVariation.M> {
    
    var segmented: ComponentAppearanceVariation<CodeField, CodeFieldAppearance> {
        var size =  CodeFieldAnySize(size: appearance.size)
        size.groupShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.itemShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxs.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.segmented",
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


public extension ComponentAppearanceVariation<CodeField, CodeFieldAppearance> {
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

private extension CodeFieldAppearance {
    
}
