import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public extension GeneralAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance, AccordionItemClearActionStartVariation.H2> {
    
    var h2: ComponentAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance> {
        var size =  AccordionItemClearActionStartAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(16.0)
        size.contentPaddingStart = CGFloat(32.0)
        size.paddingBottom = CGFloat(16.0)
        size.paddingTop = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.disclosureDownFill24.image
        appearance.contentTextTypography = AccordionItemClearActionStartTypography(h2: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill24.image
        appearance.titleTypography = AccordionItemClearActionStartTypography(h2: AdaptiveTypographyToken.headerH2Bold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance, AccordionItemClearActionStartVariation.H3> {
    
    var h3: ComponentAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance> {
        var size =  AccordionItemClearActionStartAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(14.0)
        size.contentPaddingStart = CGFloat(30.0)
        size.paddingBottom = CGFloat(14.0)
        size.paddingTop = CGFloat(14.0)

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.disclosureDownFill24.image
        appearance.contentTextTypography = AccordionItemClearActionStartTypography(h3: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill24.image
        appearance.titleTypography = AccordionItemClearActionStartTypography(h3: AdaptiveTypographyToken.headerH3Bold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance, AccordionItemClearActionStartVariation.H4> {
    
    var h4: ComponentAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance> {
        var size =  AccordionItemClearActionStartAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(12.0)
        size.contentPaddingStart = CGFloat(22.0)
        size.paddingBottom = CGFloat(11.0)
        size.paddingTop = CGFloat(11.0)

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemClearActionStartTypography(h4: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemClearActionStartTypography(h4: AdaptiveTypographyToken.headerH4Bold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance, AccordionItemClearActionStartVariation.H5> {
    
    var h5: ComponentAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance> {
        var size =  AccordionItemClearActionStartAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(8.0)
        size.contentPaddingStart = CGFloat(20.0)
        size.paddingBottom = CGFloat(8.0)
        size.paddingTop = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemClearActionStartTypography(h5: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemClearActionStartTypography(h5: AdaptiveTypographyToken.headerH5Bold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance, AccordionItemClearActionStartVariation.L> {
    
    var l: ComponentAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance> {
        var size =  AccordionItemClearActionStartAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(16.0)
        size.contentPaddingStart = CGFloat(22.0)
        size.paddingBottom = CGFloat(17.0)
        size.paddingTop = CGFloat(17.0)

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemClearActionStartTypography(l: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemClearActionStartTypography(l: AdaptiveTypographyToken.bodyLBold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance, AccordionItemClearActionStartVariation.M> {
    
    var m: ComponentAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance> {
        var size =  AccordionItemClearActionStartAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(14.0)
        size.contentPaddingStart = CGFloat(22.0)
        size.paddingBottom = CGFloat(14.0)
        size.paddingTop = CGFloat(14.0)

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemClearActionStartTypography(m: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemClearActionStartTypography(m: AdaptiveTypographyToken.bodyMBold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance, AccordionItemClearActionStartVariation.S> {
    
    var s: ComponentAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance> {
        var size =  AccordionItemClearActionStartAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(12.0)
        size.contentPaddingStart = CGFloat(22.0)
        size.paddingBottom = CGFloat(11.0)
        size.paddingTop = CGFloat(11.0)

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemClearActionStartTypography(s: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemClearActionStartTypography(s: AdaptiveTypographyToken.bodySBold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance, AccordionItemClearActionStartVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance> {
        var size =  AccordionItemClearActionStartAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(8.0)
        size.contentPaddingStart = CGFloat(20.0)
        size.paddingBottom = CGFloat(8.0)
        size.paddingTop = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemClearActionStartTypography(xs: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemClearActionStartTypography(xs: AdaptiveTypographyToken.bodyXsBold.typography).asContainer
    
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


public extension ComponentAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance> {
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
