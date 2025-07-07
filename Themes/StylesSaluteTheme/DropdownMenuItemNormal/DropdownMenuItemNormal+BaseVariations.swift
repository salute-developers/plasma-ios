import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct DropdownMenuItemNormal {
    public static var l: ComponentAppearanceVariation<DropdownMenuItemNormal, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = DropdownMenuItemNormalSize.l
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = DropdownMenuItemNormalTypography(oneSize: Typographies.bodyLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<DropdownMenuItemNormal, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = DropdownMenuItemNormalSize.m
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = DropdownMenuItemNormalTypography(oneSize: Typographies.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<DropdownMenuItemNormal, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = DropdownMenuItemNormalSize.s
        appearance.disclosureIcon = Asset.disclosureRightOutline16.image
        appearance.titleTypography = DropdownMenuItemNormalTypography(oneSize: Typographies.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<DropdownMenuItemNormal, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = DropdownMenuItemNormalSize.xs
        appearance.disclosureIcon = Asset.disclosureRightOutline16.image
        appearance.titleTypography = DropdownMenuItemNormalTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ListItemAppearance>] = [
        DropdownMenuItemNormal.l.variation,
        DropdownMenuItemNormal.m.variation,
        DropdownMenuItemNormal.s.variation,
        DropdownMenuItemNormal.xs.variation,
    ]
}

public struct DropdownMenuItemNormalVariation {
    public struct L {}
    public struct M {}
    public struct S {}
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
