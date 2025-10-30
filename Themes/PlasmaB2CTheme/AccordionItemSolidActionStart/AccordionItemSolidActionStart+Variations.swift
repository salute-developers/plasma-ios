import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public extension GeneralAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance, AccordionItemSolidActionStartVariation.H2> {
    
    var h2: ComponentAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance> {
        var size =  AccordionItemSolidActionStartAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(20.0)
        size.contentPaddingEnd = CGFloat(20.0)
        size.contentPaddingStart = CGFloat(52.0)
        size.paddingBottom = CGFloat(16.0)
        size.paddingEnd = CGFloat(18.0)
        size.paddingStart = CGFloat(18.0)
        size.paddingTop = CGFloat(16.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.disclosureDownFill24.image
        appearance.contentTextTypography = AccordionItemSolidActionStartTypography(h2: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill24.image
        appearance.titleTypography = AccordionItemSolidActionStartTypography(h2: AdaptiveTypographyToken.headerH2Bold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance, AccordionItemSolidActionStartVariation.H3> {
    
    var h3: ComponentAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance> {
        var size =  AccordionItemSolidActionStartAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(18.0)
        size.contentPaddingEnd = CGFloat(18.0)
        size.contentPaddingStart = CGFloat(48.0)
        size.paddingBottom = CGFloat(14.0)
        size.paddingEnd = CGFloat(18.0)
        size.paddingStart = CGFloat(18.0)
        size.paddingTop = CGFloat(14.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.disclosureDownFill24.image
        appearance.contentTextTypography = AccordionItemSolidActionStartTypography(h3: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill24.image
        appearance.titleTypography = AccordionItemSolidActionStartTypography(h3: AdaptiveTypographyToken.headerH3Bold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance, AccordionItemSolidActionStartVariation.H4> {
    
    var h4: ComponentAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance> {
        var size =  AccordionItemSolidActionStartAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(14.0)
        size.contentPaddingEnd = CGFloat(14.0)
        size.contentPaddingStart = CGFloat(36.0)
        size.paddingBottom = CGFloat(11.0)
        size.paddingEnd = CGFloat(14.0)
        size.paddingStart = CGFloat(14.0)
        size.paddingTop = CGFloat(11.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemSolidActionStartTypography(h4: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemSolidActionStartTypography(h4: AdaptiveTypographyToken.headerH4Bold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance, AccordionItemSolidActionStartVariation.H5> {
    
    var h5: ComponentAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance> {
        var size =  AccordionItemSolidActionStartAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(12.0)
        size.contentPaddingEnd = CGFloat(12.0)
        size.contentPaddingStart = CGFloat(12.0)
        size.paddingBottom = CGFloat(8.0)
        size.paddingEnd = CGFloat(12.0)
        size.paddingStart = CGFloat(12.0)
        size.paddingTop = CGFloat(8.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemSolidActionStartTypography(h5: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemSolidActionStartTypography(h5: AdaptiveTypographyToken.headerH5Bold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance, AccordionItemSolidActionStartVariation.L> {
    
    var l: ComponentAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance> {
        var size =  AccordionItemSolidActionStartAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(18.0)
        size.contentPaddingEnd = CGFloat(20.0)
        size.contentPaddingStart = CGFloat(42.0)
        size.paddingBottom = CGFloat(17.0)
        size.paddingEnd = CGFloat(20.0)
        size.paddingStart = CGFloat(20.0)
        size.paddingTop = CGFloat(17.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemSolidActionStartTypography(l: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemSolidActionStartTypography(l: AdaptiveTypographyToken.bodyLBold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance, AccordionItemSolidActionStartVariation.M> {
    
    var m: ComponentAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance> {
        var size =  AccordionItemSolidActionStartAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(16.0)
        size.contentPaddingEnd = CGFloat(18.0)
        size.contentPaddingStart = CGFloat(40.0)
        size.paddingBottom = CGFloat(14.0)
        size.paddingEnd = CGFloat(18.0)
        size.paddingStart = CGFloat(18.0)
        size.paddingTop = CGFloat(14.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemSolidActionStartTypography(m: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemSolidActionStartTypography(m: AdaptiveTypographyToken.bodyMBold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance, AccordionItemSolidActionStartVariation.S> {
    
    var s: ComponentAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance> {
        var size =  AccordionItemSolidActionStartAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(12.0)
        size.contentPaddingEnd = CGFloat(14.0)
        size.contentPaddingStart = CGFloat(36.0)
        size.paddingBottom = CGFloat(11.0)
        size.paddingEnd = CGFloat(14.0)
        size.paddingStart = CGFloat(14.0)
        size.paddingTop = CGFloat(11.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemSolidActionStartTypography(s: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemSolidActionStartTypography(s: AdaptiveTypographyToken.bodySBold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance, AccordionItemSolidActionStartVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance> {
        var size =  AccordionItemSolidActionStartAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(10.0)
        size.contentPaddingEnd = CGFloat(12.0)
        size.contentPaddingStart = CGFloat(32.0)
        size.paddingBottom = CGFloat(8.0)
        size.paddingEnd = CGFloat(12.0)
        size.paddingStart = CGFloat(12.0)
        size.paddingTop = CGFloat(8.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemSolidActionStartTypography(xs: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemSolidActionStartTypography(xs: AdaptiveTypographyToken.bodyXsBold.typography).asContainer
    
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


public extension ComponentAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance> {
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
