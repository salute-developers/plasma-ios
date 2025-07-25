import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct AccordionItemClearActionStart {
    public static var h2: ComponentAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemClearActionStartSize.h2
        appearance.closedIcon = Asset.disclosureDownFill24.image
        appearance.contentTextTypography = AccordionItemClearActionStartTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill24.image
        appearance.titleTypography = AccordionItemClearActionStartTypography(oneSize: Typographies.headerH2Bold.typography).asContainer

        return .init(
            name: "h2",
            appearance: appearance
        )
    }
    public static var h3: ComponentAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemClearActionStartSize.h3
        appearance.closedIcon = Asset.disclosureDownFill24.image
        appearance.contentTextTypography = AccordionItemClearActionStartTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill24.image
        appearance.titleTypography = AccordionItemClearActionStartTypography(oneSize: Typographies.headerH3Bold.typography).asContainer

        return .init(
            name: "h3",
            appearance: appearance
        )
    }
    public static var h4: ComponentAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemClearActionStartSize.h4
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemClearActionStartTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemClearActionStartTypography(oneSize: Typographies.headerH4Bold.typography).asContainer

        return .init(
            name: "h4",
            appearance: appearance
        )
    }
    public static var h5: ComponentAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemClearActionStartSize.h5
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemClearActionStartTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemClearActionStartTypography(oneSize: Typographies.headerH5Bold.typography).asContainer

        return .init(
            name: "h5",
            appearance: appearance
        )
    }
    public static var l: ComponentAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemClearActionStartSize.l
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemClearActionStartTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemClearActionStartTypography(oneSize: Typographies.bodyLBold.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemClearActionStartSize.m
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemClearActionStartTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemClearActionStartTypography(oneSize: Typographies.bodyMBold.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemClearActionStartSize.s
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemClearActionStartTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemClearActionStartTypography(oneSize: Typographies.bodySBold.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<AccordionItemClearActionStart, AccordionItemAppearance> {
        var appearance = AccordionItemAppearance.base
        appearance.size = AccordionItemClearActionStartSize.xs
        appearance.closedIcon = Asset.disclosureDownFill16.image
        appearance.contentTextTypography = AccordionItemClearActionStartTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.openedIcon = Asset.disclosureUpFill16.image
        appearance.titleTypography = AccordionItemClearActionStartTypography(oneSize: Typographies.bodyXsBold.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<AccordionItemAppearance>] = [
        AccordionItemClearActionStart.h2.variation,
        AccordionItemClearActionStart.h3.variation,
        AccordionItemClearActionStart.h4.variation,
        AccordionItemClearActionStart.h5.variation,
        AccordionItemClearActionStart.l.variation,
        AccordionItemClearActionStart.m.variation,
        AccordionItemClearActionStart.s.variation,
        AccordionItemClearActionStart.xs.variation,
    ]
}

public struct AccordionItemClearActionStartVariation {
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
