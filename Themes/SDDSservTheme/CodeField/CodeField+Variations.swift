import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<CodeField, CodeFieldAppearance, CodeFieldVariation.L> {
    
    var l: GeneralAppearanceVariation<CodeField, CodeFieldAppearance, CodeFieldVariation.L> {
        var size =  CodeFieldAnySize(size: appearance.size)
        size.captionSpacing = CGFloat(14.0)
        size.dotSize = CGFloat(10.0)
        size.height = CGFloat(56.0)
        size.itemShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius+2.0) as PathDrawer
        size.width = CGFloat(44.0)

        var appearance = appearance
        appearance.size = size
        appearance.captionTypography = CodeFieldTypography(l: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.valueTypography = CodeFieldTypography(l: AdaptiveTypographyToken.bodyLBold.typography).asContainer
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<CodeField, CodeFieldAppearance, CodeFieldVariation.LSegmented> {
    
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
    
    var m: GeneralAppearanceVariation<CodeField, CodeFieldAppearance, CodeFieldVariation.M> {
        var size =  CodeFieldAnySize(size: appearance.size)
        size.captionSpacing = CGFloat(12.0)
        size.dotSize = CGFloat(8.0)
        size.height = CGFloat(48.0)
        size.itemShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.width = CGFloat(38.0)

        var appearance = appearance
        appearance.size = size
        appearance.captionTypography = CodeFieldTypography(m: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.valueTypography = CodeFieldTypography(m: AdaptiveTypographyToken.bodyMBold.typography).asContainer
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<CodeField, CodeFieldAppearance, CodeFieldVariation.MSegmented> {
    
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
