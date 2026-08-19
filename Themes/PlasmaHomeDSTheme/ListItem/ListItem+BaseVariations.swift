import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct ListItem {
    public static var m: GeneralAppearanceVariation<ListItem, ListItemAppearance, ListItemVariation.M> {
        var appearance = ListItemAppearance.base
        appearance.size = ListItemSize.m
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.labelTypography = ListItemTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.subtitleTypography = ListItemTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.titleTypography = ListItemTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<ListItem, ListItemAppearance, ListItemVariation.S> {
        var appearance = ListItemAppearance.base
        appearance.size = ListItemSize.s
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.labelTypography = ListItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.subtitleTypography = ListItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titleTypography = ListItemTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<ListItemAppearance>] {
        [
            ListItem.m.variation,
            ListItem.m.hasBackground.variation,
            ListItem.s.variation,
            ListItem.s.hasBackground.variation,
        ]
    }
}

public struct ListItemVariation {
    public struct M {}
    public struct MHasbackground {}
    public struct S {}
    public struct SHasbackground {}
}

private extension ListItemAppearance {
    static var base: ListItemAppearance {
        var appearance = ListItemAppearance()
        appearance.disabledAlpha = CGFloat(0.4)
        appearance.disclosureIconColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [])
        appearance.labelColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [])
        return appearance
    }
}
