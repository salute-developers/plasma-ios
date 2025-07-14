import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct AccordionItemSolidActionStart {
    public static var h2: ComponentAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemSolidActionStartSize.h2
        appearance.closedIcon = Asset.disclosureDownFill24.image
        appearance.contentTextTypography = AccordionItemSolidActionStartTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill24.image
        appearance.titleTypography = AccordionItemSolidActionStartTypography(oneSize: Typographies.headerH2Bold.typography).asContainer

        return .init(
            name: "h2",
            appearance: appearance
        )
    }
    public static var h3: ComponentAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemSolidActionStartSize.h3
        appearance.closedIcon = Asset.disclosureDownFill24.image
        appearance.contentTextTypography = AccordionItemSolidActionStartTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill24.image
        appearance.titleTypography = AccordionItemSolidActionStartTypography(oneSize: Typographies.headerH3Bold.typography).asContainer

        return .init(
            name: "h3",
            appearance: appearance
        )
    }
    public static var h4: ComponentAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemSolidActionStartSize.h4
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemSolidActionStartTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemSolidActionStartTypography(oneSize: Typographies.headerH4Bold.typography).asContainer

        return .init(
            name: "h4",
            appearance: appearance
        )
    }
    public static var h5: ComponentAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemSolidActionStartSize.h5
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemSolidActionStartTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemSolidActionStartTypography(oneSize: Typographies.headerH5Bold.typography).asContainer

        return .init(
            name: "h5",
            appearance: appearance
        )
    }
    public static var l: ComponentAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemSolidActionStartSize.l
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemSolidActionStartTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemSolidActionStartTypography(oneSize: Typographies.bodyLBold.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemSolidActionStartSize.m
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemSolidActionStartTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemSolidActionStartTypography(oneSize: Typographies.bodyMBold.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemSolidActionStartSize.s
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemSolidActionStartTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemSolidActionStartTypography(oneSize: Typographies.bodySBold.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<AccordionItemSolidActionStart, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemSolidActionStartSize.xs
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemSolidActionStartTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemSolidActionStartTypography(oneSize: Typographies.bodyXsBold.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<AccordionItemAppearance>] = [
        AccordionItemSolidActionStart.h2.variation,
        AccordionItemSolidActionStart.h3.variation,
        AccordionItemSolidActionStart.h4.variation,
        AccordionItemSolidActionStart.h5.variation,
        AccordionItemSolidActionStart.l.variation,
        AccordionItemSolidActionStart.m.variation,
        AccordionItemSolidActionStart.s.variation,
        AccordionItemSolidActionStart.xs.variation,
    ]
}

public struct AccordionItemSolidActionStartVariation {
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
