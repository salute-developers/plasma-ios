import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance, AccordionItemSolidActionEndVariation.H2> {
    
    var h2: ComponentAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance> {
        var size =  AccordionItemSolidActionEndAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(20.0)
        size.contentPaddingEnd = CGFloat(20.0)
        size.contentPaddingStart = CGFloat(20.0)
        size.iconPadding = CGFloat(16.0)
        size.paddingBottom = CGFloat(16.0)
        size.paddingEnd = CGFloat(18.0)
        size.paddingStart = CGFloat(18.0)
        size.paddingTop = CGFloat(16.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.plus24.image
        appearance.contentTextTypography = AccordionItemSolidActionEndTypography(h2: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.minus24.image
        appearance.titleTypography = AccordionItemSolidActionEndTypography(h2: AdaptiveTypographyToken.headerH2Bold.typography).asContainer
    
        return .init(
            name: "h2",
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

public extension GeneralAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance, AccordionItemSolidActionEndVariation.H3> {
    
    var h3: ComponentAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance> {
        var size =  AccordionItemSolidActionEndAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(18.0)
        size.contentPaddingEnd = CGFloat(18.0)
        size.contentPaddingStart = CGFloat(18.0)
        size.iconPadding = CGFloat(14.0)
        size.paddingBottom = CGFloat(14.0)
        size.paddingEnd = CGFloat(18.0)
        size.paddingStart = CGFloat(18.0)
        size.paddingTop = CGFloat(14.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.plus24.image
        appearance.contentTextTypography = AccordionItemSolidActionEndTypography(h3: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.minus24.image
        appearance.titleTypography = AccordionItemSolidActionEndTypography(h3: AdaptiveTypographyToken.headerH3Bold.typography).asContainer
    
        return .init(
            name: "h3",
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

public extension GeneralAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance, AccordionItemSolidActionEndVariation.H4> {
    
    var h4: ComponentAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance> {
        var size =  AccordionItemSolidActionEndAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(14.0)
        size.contentPaddingEnd = CGFloat(14.0)
        size.contentPaddingStart = CGFloat(14.0)
        size.iconPadding = CGFloat(12.0)
        size.paddingBottom = CGFloat(11.0)
        size.paddingEnd = CGFloat(14.0)
        size.paddingStart = CGFloat(14.0)
        size.paddingTop = CGFloat(11.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemSolidActionEndTypography(h4: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemSolidActionEndTypography(h4: AdaptiveTypographyToken.headerH4Bold.typography).asContainer
    
        return .init(
            name: "h4",
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

public extension GeneralAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance, AccordionItemSolidActionEndVariation.H5> {
    
    var h5: ComponentAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance> {
        var size =  AccordionItemSolidActionEndAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(12.0)
        size.contentPaddingEnd = CGFloat(12.0)
        size.contentPaddingStart = CGFloat(12.0)
        size.iconPadding = CGFloat(10.0)
        size.paddingBottom = CGFloat(8.0)
        size.paddingEnd = CGFloat(12.0)
        size.paddingStart = CGFloat(12.0)
        size.paddingTop = CGFloat(8.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemSolidActionEndTypography(h5: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemSolidActionEndTypography(h5: AdaptiveTypographyToken.headerH5Bold.typography).asContainer
    
        return .init(
            name: "h5",
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

public extension GeneralAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance, AccordionItemSolidActionEndVariation.L> {
    
    var l: ComponentAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance> {
        var size =  AccordionItemSolidActionEndAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(18.0)
        size.contentPaddingEnd = CGFloat(20.0)
        size.contentPaddingStart = CGFloat(20.0)
        size.iconPadding = CGFloat(16.0)
        size.paddingBottom = CGFloat(17.0)
        size.paddingEnd = CGFloat(20.0)
        size.paddingStart = CGFloat(20.0)
        size.paddingTop = CGFloat(17.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemSolidActionEndTypography(l: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemSolidActionEndTypography(l: AdaptiveTypographyToken.bodyLBold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance, AccordionItemSolidActionEndVariation.M> {
    
    var m: ComponentAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance> {
        var size =  AccordionItemSolidActionEndAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(16.0)
        size.contentPaddingEnd = CGFloat(18.0)
        size.contentPaddingStart = CGFloat(18.0)
        size.iconPadding = CGFloat(14.0)
        size.paddingBottom = CGFloat(14.0)
        size.paddingEnd = CGFloat(18.0)
        size.paddingStart = CGFloat(18.0)
        size.paddingTop = CGFloat(14.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemSolidActionEndTypography(m: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemSolidActionEndTypography(m: AdaptiveTypographyToken.bodyMBold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance, AccordionItemSolidActionEndVariation.S> {
    
    var s: ComponentAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance> {
        var size =  AccordionItemSolidActionEndAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(12.0)
        size.contentPaddingEnd = CGFloat(14.0)
        size.contentPaddingStart = CGFloat(14.0)
        size.iconPadding = CGFloat(12.0)
        size.paddingBottom = CGFloat(11.0)
        size.paddingEnd = CGFloat(14.0)
        size.paddingStart = CGFloat(14.0)
        size.paddingTop = CGFloat(11.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemSolidActionEndTypography(s: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemSolidActionEndTypography(s: AdaptiveTypographyToken.bodySBold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance, AccordionItemSolidActionEndVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance> {
        var size =  AccordionItemSolidActionEndAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(10.0)
        size.contentPaddingEnd = CGFloat(12.0)
        size.contentPaddingStart = CGFloat(12.0)
        size.iconPadding = CGFloat(10.0)
        size.paddingBottom = CGFloat(8.0)
        size.paddingEnd = CGFloat(12.0)
        size.paddingStart = CGFloat(12.0)
        size.paddingTop = CGFloat(8.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemSolidActionEndTypography(xs: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemSolidActionEndTypography(xs: AdaptiveTypographyToken.bodyXsBold.typography).asContainer
    
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


public extension ComponentAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance> {
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

private extension AccordionItemAppearance {
    
}
