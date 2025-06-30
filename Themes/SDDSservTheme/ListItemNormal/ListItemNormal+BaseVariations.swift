import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct ListItemNormal {
    public static var l: ComponentAppearanceVariation<ListItemNormal, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = ListItemNormalSize.l
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = ListItemNormalTypography(oneSize: Typographies.bodyLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<ListItemNormal, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = ListItemNormalSize.m
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = ListItemNormalTypography(oneSize: Typographies.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<ListItemNormal, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = ListItemNormalSize.s
        appearance.disclosureIcon = Asset.disclosureRightOutline16.image
        appearance.titleTypography = ListItemNormalTypography(oneSize: Typographies.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: ComponentAppearanceVariation<ListItemNormal, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = ListItemNormalSize.xl
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = ListItemNormalTypography(oneSize: Typographies.bodyLNormal.typography).asContainer

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<ListItemNormal, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = ListItemNormalSize.xs
        appearance.disclosureIcon = Asset.disclosureRightOutline16.image
        appearance.titleTypography = ListItemNormalTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ListItemAppearance>] = [
        ListItemNormal.l.variation,
        ListItemNormal.m.variation,
        ListItemNormal.s.variation,
        ListItemNormal.xl.variation,
        ListItemNormal.xs.variation,
    ]
}

public struct ListItemNormalVariation {
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
