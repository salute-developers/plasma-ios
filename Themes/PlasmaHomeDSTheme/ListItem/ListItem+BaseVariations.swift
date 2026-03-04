import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct ListItem {
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
    
    public static let all: [Variation<ListItemAppearance>] = [
        ListItem.s.variation,
        ListItem.s.hasBackground.variation,
    ]
}

public struct ListItemVariation {
    public struct S {}
    public struct SHasbackground {}
}

private extension ListItemAppearance {
    static var base: ListItemAppearance {
        var appearance = ListItemAppearance()
        appearance.disabledAlpha = CGFloat(0.4)
        appearance.disclosureIconColor = ColorToken.textDefaultSecondary
        appearance.labelColor = ColorToken.textDefaultSecondary
        appearance.subtitleColor = ColorToken.textDefaultSecondary
        appearance.titleColor = ColorToken.textDefaultPrimary
        return appearance
    }
}
