import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<ListItemTight, ListItemAppearance, ListItemTightVariation.L> {
    
    var l: ComponentAppearanceVariation<ListItemTight, ListItemAppearance> {
        var size =  ListItemTightAnySize(size: appearance.size)
        size.contentPaddingEnd = CGFloat(8.0)
        size.height = CGFloat(48.0)
        size.paddingBottom = CGFloat(12.0)
        size.paddingEnd = CGFloat(16.0)
        size.paddingStart = CGFloat(16.0)
        size.paddingTop = CGFloat(12.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = ListItemTightTypography(l: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<ListItemTight, ListItemAppearance, ListItemTightVariation.M> {
    
    var m: ComponentAppearanceVariation<ListItemTight, ListItemAppearance> {
        var size =  ListItemTightAnySize(size: appearance.size)
        size.contentPaddingEnd = CGFloat(8.0)
        size.height = CGFloat(40.0)
        size.paddingBottom = CGFloat(8.0)
        size.paddingEnd = CGFloat(14.0)
        size.paddingStart = CGFloat(14.0)
        size.paddingTop = CGFloat(8.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = ListItemTightTypography(m: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<ListItemTight, ListItemAppearance, ListItemTightVariation.S> {
    
    var s: ComponentAppearanceVariation<ListItemTight, ListItemAppearance> {
        var size =  ListItemTightAnySize(size: appearance.size)
        size.contentPaddingEnd = CGFloat(6.0)
        size.height = CGFloat(32.0)
        size.paddingBottom = CGFloat(7.0)
        size.paddingEnd = CGFloat(12.0)
        size.paddingStart = CGFloat(12.0)
        size.paddingTop = CGFloat(7.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.disclosureIcon = Asset.disclosureRightOutline16.image
        appearance.titleTypography = ListItemTightTypography(s: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<ListItemTight, ListItemAppearance, ListItemTightVariation.Xl> {
    
    var xl: ComponentAppearanceVariation<ListItemTight, ListItemAppearance> {
        var size =  ListItemTightAnySize(size: appearance.size)
        size.contentPaddingEnd = CGFloat(8.0)
        size.height = CGFloat(56.0)
        size.paddingBottom = CGFloat(16.0)
        size.paddingEnd = CGFloat(18.0)
        size.paddingStart = CGFloat(18.0)
        size.paddingTop = CGFloat(16.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = ListItemTightTypography(xl: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<ListItemTight, ListItemAppearance, ListItemTightVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<ListItemTight, ListItemAppearance> {
        var size =  ListItemTightAnySize(size: appearance.size)
        size.contentPaddingEnd = CGFloat(6.0)
        size.height = CGFloat(24.0)
        size.paddingBottom = CGFloat(4.0)
        size.paddingEnd = CGFloat(8.0)
        size.paddingStart = CGFloat(8.0)
        size.paddingTop = CGFloat(4.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.disclosureIcon = Asset.disclosureRightOutline16.image
        appearance.titleTypography = ListItemTightTypography(xs: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
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


public extension ComponentAppearanceVariation<ListItemTight, ListItemAppearance> {
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

private extension ListItemAppearance {
    
}
