import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct AccordionItemClearActionEnd {
    public static var h2: ComponentAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemClearActionEndSize.h2
        appearance.closedIcon = Asset.plus24.image
        appearance.contentTextTypography = AccordionItemClearActionEndTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.minus24.image
        appearance.titleTypography = AccordionItemClearActionEndTypography(oneSize: Typographies.headerH2Bold.typography).asContainer

        return .init(
            name: "h2",
            appearance: appearance
        )
    }
    public static var h3: ComponentAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemClearActionEndSize.h3
        appearance.closedIcon = Asset.plus24.image
        appearance.contentTextTypography = AccordionItemClearActionEndTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.minus24.image
        appearance.titleTypography = AccordionItemClearActionEndTypography(oneSize: Typographies.headerH3Bold.typography).asContainer

        return .init(
            name: "h3",
            appearance: appearance
        )
    }
    public static var h4: ComponentAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemClearActionEndSize.h4
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemClearActionEndTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemClearActionEndTypography(oneSize: Typographies.headerH4Bold.typography).asContainer

        return .init(
            name: "h4",
            appearance: appearance
        )
    }
    public static var h5: ComponentAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemClearActionEndSize.h5
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemClearActionEndTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemClearActionEndTypography(oneSize: Typographies.headerH5Bold.typography).asContainer

        return .init(
            name: "h5",
            appearance: appearance
        )
    }
    public static var l: ComponentAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemClearActionEndSize.l
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemClearActionEndTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemClearActionEndTypography(oneSize: Typographies.bodyLBold.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemClearActionEndSize.m
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemClearActionEndTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemClearActionEndTypography(oneSize: Typographies.bodyMBold.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemClearActionEndSize.s
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemClearActionEndTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemClearActionEndTypography(oneSize: Typographies.bodySBold.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<AccordionItemClearActionEnd, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemClearActionEndSize.xs
        appearance.closedIcon = Asset.plus16.image
        appearance.contentTextTypography = AccordionItemClearActionEndTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.openedIcon = Asset.minus16.image
        appearance.titleTypography = AccordionItemClearActionEndTypography(oneSize: Typographies.bodyXsBold.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<AccordionItemAppearance>] = [
        AccordionItemClearActionEnd.h2.variation,
        AccordionItemClearActionEnd.h3.variation,
        AccordionItemClearActionEnd.h4.variation,
        AccordionItemClearActionEnd.h5.variation,
        AccordionItemClearActionEnd.l.variation,
        AccordionItemClearActionEnd.m.variation,
        AccordionItemClearActionEnd.s.variation,
        AccordionItemClearActionEnd.xs.variation,
    ]
}

public struct AccordionItemClearActionEndVariation {
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
        appearance.contentTextColor = ColorToken.textDefaultPrimary
        appearance.titleColor = ColorToken.textDefaultPrimary
        return appearance
    }
}
