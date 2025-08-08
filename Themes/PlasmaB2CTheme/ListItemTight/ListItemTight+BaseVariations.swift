import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct ListItemTight {
    public static var l: ComponentAppearanceVariation<ListItemTight, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = ListItemTightSize.l
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = ListItemTightTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<ListItemTight, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = ListItemTightSize.m
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = ListItemTightTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<ListItemTight, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = ListItemTightSize.s
        appearance.disclosureIcon = Asset.disclosureRightOutline16.image
        appearance.titleTypography = ListItemTightTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: ComponentAppearanceVariation<ListItemTight, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = ListItemTightSize.xl
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = ListItemTightTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<ListItemTight, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = ListItemTightSize.xs
        appearance.disclosureIcon = Asset.disclosureRightOutline16.image
        appearance.titleTypography = ListItemTightTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ListItemAppearance>] = [
        ListItemTight.l.variation,
        ListItemTight.m.variation,
        ListItemTight.s.variation,
        ListItemTight.xl.variation,
        ListItemTight.xs.variation,
    ]
}

public struct ListItemTightVariation {
    public struct L {}
    public struct M {}
    public struct S {}
    public struct Xl {}
    public struct Xs {}
}

private extension ListItemAppearance {
    static var base: ListItemAppearance {
        var appearance = ListItemAppearance()
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultTransparentSecondary, selectedColor: .clearColor)
        appearance.disclosureIconColor = ColorToken.textDefaultSecondary
        appearance.titleColor = ColorToken.textDefaultPrimary
        return appearance
    }
}
