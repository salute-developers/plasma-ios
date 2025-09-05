import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct AccordionItemSolidActionEnd {
    public static var h2: ComponentAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemSolidActionEndSize.h2
        appearance.closedIcon = Asset.plus24.image
        appearance.contentTextTypography = AccordionItemSolidActionEndTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.minus24.image
        appearance.titleTypography = AccordionItemSolidActionEndTypography(oneSize: AdaptiveTypographyToken.headerH2Bold.typography).asContainer

        return .init(
            name: "h2",
            appearance: appearance
        )
    }
    public static var h3: ComponentAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemSolidActionEndSize.h3
        appearance.closedIcon = Asset.plus24.image
        appearance.contentTextTypography = AccordionItemSolidActionEndTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.minus24.image
        appearance.titleTypography = AccordionItemSolidActionEndTypography(oneSize: AdaptiveTypographyToken.headerH3Bold.typography).asContainer

        return .init(
            name: "h3",
            appearance: appearance
        )
    }
    public static var h4: ComponentAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemSolidActionEndSize.h4
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemSolidActionEndTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemSolidActionEndTypography(oneSize: AdaptiveTypographyToken.headerH4Bold.typography).asContainer

        return .init(
            name: "h4",
            appearance: appearance
        )
    }
    public static var h5: ComponentAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemSolidActionEndSize.h5
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemSolidActionEndTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemSolidActionEndTypography(oneSize: AdaptiveTypographyToken.headerH5Bold.typography).asContainer

        return .init(
            name: "h5",
            appearance: appearance
        )
    }
    public static var l: ComponentAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemSolidActionEndSize.l
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemSolidActionEndTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemSolidActionEndTypography(oneSize: AdaptiveTypographyToken.bodyLBold.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemSolidActionEndSize.m
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemSolidActionEndTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemSolidActionEndTypography(oneSize: AdaptiveTypographyToken.bodyMBold.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemSolidActionEndSize.s
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemSolidActionEndTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemSolidActionEndTypography(oneSize: AdaptiveTypographyToken.bodySBold.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<AccordionItemSolidActionEnd, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemSolidActionEndSize.xs
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemSolidActionEndTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemSolidActionEndTypography(oneSize: AdaptiveTypographyToken.bodyXsBold.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<AccordionItemAppearance>] = [
        AccordionItemSolidActionEnd.h2.variation,
        AccordionItemSolidActionEnd.h3.variation,
        AccordionItemSolidActionEnd.h4.variation,
        AccordionItemSolidActionEnd.h5.variation,
        AccordionItemSolidActionEnd.l.variation,
        AccordionItemSolidActionEnd.m.variation,
        AccordionItemSolidActionEnd.s.variation,
        AccordionItemSolidActionEnd.xs.variation,
    ]
}

public struct AccordionItemSolidActionEndVariation {
    public struct H2 {}
    public struct H3 {}
    public struct H4 {}
    public struct H5 {}
    public struct L {}
    public struct M {}
    public struct S {}
    public struct Xs {}
}

private extension AccordionItemAppearance {
    static var base: AccordionItemAppearance {
        var appearance = AccordionItemAppearance()
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard
        appearance.contentTextColor = ColorToken.textDefaultPrimary
        appearance.titleColor = ColorToken.textDefaultPrimary
        return appearance
    }
}
