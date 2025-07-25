import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct DropdownMenuItem {
    public static var l: ComponentAppearanceVariation<DropdownMenuItem, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = DropdownMenuItemSize.l
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = DropdownMenuItemTypography(oneSize: Typographies.bodyLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<DropdownMenuItem, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = DropdownMenuItemSize.m
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = DropdownMenuItemTypography(oneSize: Typographies.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<DropdownMenuItem, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = DropdownMenuItemSize.s
        appearance.disclosureIcon = Asset.disclosureRightOutline16.image
        appearance.titleTypography = DropdownMenuItemTypography(oneSize: Typographies.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: ComponentAppearanceVariation<DropdownMenuItem, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = DropdownMenuItemSize.xl
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = DropdownMenuItemTypography(oneSize: Typographies.bodyLNormal.typography).asContainer

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<DropdownMenuItem, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = DropdownMenuItemSize.xs
        appearance.disclosureIcon = Asset.disclosureRightOutline16.image
        appearance.titleTypography = DropdownMenuItemTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ListItemAppearance>] = [
        DropdownMenuItem.l.variation,
        DropdownMenuItem.m.variation,
        DropdownMenuItem.s.variation,
        DropdownMenuItem.xl.variation,
        DropdownMenuItem.xs.variation,
    ]
}

public struct DropdownMenuItemVariation {
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
