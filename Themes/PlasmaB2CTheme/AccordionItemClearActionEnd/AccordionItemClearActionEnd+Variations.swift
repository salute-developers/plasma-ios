import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public extension GeneralAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance, AccordionItemClearActionEndVariation.H2> {
    
    var h2: ComponentAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance> {
        var size =  AccordionItemClearActionEndAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(16.0)
        size.iconPadding = CGFloat(16.0)
        size.paddingBottom = CGFloat(16.0)
        size.paddingTop = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.plus24.image
        appearance.contentTextTypography = AccordionItemClearActionEndTypography(h2: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.minus24.image
        appearance.titleTypography = AccordionItemClearActionEndTypography(h2: AdaptiveTypographyToken.headerH2Bold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance, AccordionItemClearActionEndVariation.H3> {
    
    var h3: ComponentAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance> {
        var size =  AccordionItemClearActionEndAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(14.0)
        size.iconPadding = CGFloat(14.0)
        size.paddingBottom = CGFloat(14.0)
        size.paddingTop = CGFloat(14.0)

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.plus24.image
        appearance.contentTextTypography = AccordionItemClearActionEndTypography(h3: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.minus24.image
        appearance.titleTypography = AccordionItemClearActionEndTypography(h3: AdaptiveTypographyToken.headerH3Bold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance, AccordionItemClearActionEndVariation.H4> {
    
    var h4: ComponentAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance> {
        var size =  AccordionItemClearActionEndAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(12.0)
        size.iconPadding = CGFloat(12.0)
        size.paddingBottom = CGFloat(11.0)
        size.paddingTop = CGFloat(11.0)

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemClearActionEndTypography(h4: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemClearActionEndTypography(h4: AdaptiveTypographyToken.headerH4Bold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance, AccordionItemClearActionEndVariation.H5> {
    
    var h5: ComponentAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance> {
        var size =  AccordionItemClearActionEndAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(8.0)
        size.iconPadding = CGFloat(10.0)
        size.paddingBottom = CGFloat(8.0)
        size.paddingTop = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemClearActionEndTypography(h5: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemClearActionEndTypography(h5: AdaptiveTypographyToken.headerH5Bold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance, AccordionItemClearActionEndVariation.L> {
    
    var l: ComponentAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance> {
        var size =  AccordionItemClearActionEndAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(16.0)
        size.iconPadding = CGFloat(16.0)
        size.paddingBottom = CGFloat(17.0)
        size.paddingTop = CGFloat(17.0)

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemClearActionEndTypography(l: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemClearActionEndTypography(l: AdaptiveTypographyToken.bodyLBold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance, AccordionItemClearActionEndVariation.M> {
    
    var m: ComponentAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance> {
        var size =  AccordionItemClearActionEndAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(14.0)
        size.iconPadding = CGFloat(14.0)
        size.paddingBottom = CGFloat(14.0)
        size.paddingTop = CGFloat(14.0)

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemClearActionEndTypography(m: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemClearActionEndTypography(m: AdaptiveTypographyToken.bodyMBold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance, AccordionItemClearActionEndVariation.S> {
    
    var s: ComponentAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance> {
        var size =  AccordionItemClearActionEndAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(12.0)
        size.iconPadding = CGFloat(12.0)
        size.paddingBottom = CGFloat(11.0)
        size.paddingTop = CGFloat(11.0)

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemClearActionEndTypography(s: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemClearActionEndTypography(s: AdaptiveTypographyToken.bodySBold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance, AccordionItemClearActionEndVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance> {
        var size =  AccordionItemClearActionEndAnySize(size: appearance.size)
        size.contentPaddingBottom = CGFloat(8.0)
        size.iconPadding = CGFloat(10.0)
        size.paddingBottom = CGFloat(8.0)
        size.paddingTop = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemClearActionEndTypography(xs: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemClearActionEndTypography(xs: AdaptiveTypographyToken.bodyXsBold.typography).asContainer
    
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


public extension ComponentAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance> {
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
