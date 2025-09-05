import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct DropdownMenuItemTight {
    public static var l: ComponentAppearanceVariation<DropdownMenuItemTight, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = DropdownMenuItemTightSize.l
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = DropdownMenuItemTightTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<DropdownMenuItemTight, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = DropdownMenuItemTightSize.m
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = DropdownMenuItemTightTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<DropdownMenuItemTight, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = DropdownMenuItemTightSize.s
        appearance.disclosureIcon = Asset.disclosureRightOutline16.image
        appearance.titleTypography = DropdownMenuItemTightTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: ComponentAppearanceVariation<DropdownMenuItemTight, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = DropdownMenuItemTightSize.xl
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = DropdownMenuItemTightTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<DropdownMenuItemTight, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = DropdownMenuItemTightSize.xs
        appearance.disclosureIcon = Asset.disclosureRightOutline16.image
        appearance.titleTypography = DropdownMenuItemTightTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ListItemAppearance>] = [
        DropdownMenuItemTight.l.variation,
        DropdownMenuItemTight.m.variation,
        DropdownMenuItemTight.s.variation,
        DropdownMenuItemTight.xl.variation,
        DropdownMenuItemTight.xs.variation,
    ]
}

public struct DropdownMenuItemTightVariation {
    public struct L {}
    public struct M {}
    public struct S {}
    public struct Xl {}
    public struct Xs {}
}

private extension ListItemAppearance {
    static var base: ListItemAppearance {
        var appearance = ListItemAppearance()
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClear, selectedColor: .clearColor)
        appearance.disclosureIconColor = ColorToken.textDefaultSecondary
        return appearance
    }
}
