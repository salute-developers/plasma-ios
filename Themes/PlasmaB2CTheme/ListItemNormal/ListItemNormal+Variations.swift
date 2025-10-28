import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public extension GeneralAppearanceVariation<ListItemNormal, ListItemAppearance, ListItemNormalVariation.L> {
    
    var l: ComponentAppearanceVariation<ListItemNormal, ListItemAppearance> {
        var size =  ListItemNormalAnySize(size: appearance.size)
        size.contentPaddingEnd = CGFloat(8.0)
        size.height = CGFloat(56.0)
        size.paddingBottom = CGFloat(16.0)
        size.paddingEnd = CGFloat(16.0)
        size.paddingStart = CGFloat(16.0)
        size.paddingTop = CGFloat(16.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = ListItemNormalTypography(l: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<ListItemNormal, ListItemAppearance, ListItemNormalVariation.M> {
    
    var m: ComponentAppearanceVariation<ListItemNormal, ListItemAppearance> {
        var size =  ListItemNormalAnySize(size: appearance.size)
        size.contentPaddingEnd = CGFloat(8.0)
        size.height = CGFloat(48.0)
        size.paddingBottom = CGFloat(12.0)
        size.paddingEnd = CGFloat(14.0)
        size.paddingStart = CGFloat(14.0)
        size.paddingTop = CGFloat(12.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = ListItemNormalTypography(m: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<ListItemNormal, ListItemAppearance, ListItemNormalVariation.S> {
    
    var s: ComponentAppearanceVariation<ListItemNormal, ListItemAppearance> {
        var size =  ListItemNormalAnySize(size: appearance.size)
        size.contentPaddingEnd = CGFloat(6.0)
        size.height = CGFloat(40.0)
        size.paddingBottom = CGFloat(11.0)
        size.paddingEnd = CGFloat(12.0)
        size.paddingStart = CGFloat(12.0)
        size.paddingTop = CGFloat(11.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.disclosureIcon = Asset.disclosureRightOutline16.image
        appearance.titleTypography = ListItemNormalTypography(s: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<ListItemNormal, ListItemAppearance, ListItemNormalVariation.Xl> {
    
    var xl: ComponentAppearanceVariation<ListItemNormal, ListItemAppearance> {
        var size =  ListItemNormalAnySize(size: appearance.size)
        size.contentPaddingEnd = CGFloat(8.0)
        size.height = CGFloat(64.0)
        size.paddingBottom = CGFloat(20.0)
        size.paddingEnd = CGFloat(18.0)
        size.paddingStart = CGFloat(18.0)
        size.paddingTop = CGFloat(20.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = ListItemNormalTypography(xl: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<ListItemNormal, ListItemAppearance, ListItemNormalVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<ListItemNormal, ListItemAppearance> {
        var size =  ListItemNormalAnySize(size: appearance.size)
        size.contentPaddingEnd = CGFloat(6.0)
        size.height = CGFloat(32.0)
        size.paddingBottom = CGFloat(8.0)
        size.paddingEnd = CGFloat(8.0)
        size.paddingStart = CGFloat(8.0)
        size.paddingTop = CGFloat(8.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.disclosureIcon = Asset.disclosureRightOutline16.image
        appearance.titleTypography = ListItemNormalTypography(xs: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
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


public extension ComponentAppearanceVariation<ListItemNormal, ListItemAppearance> {
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
