import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct CollapsingNavigationBarInternalPage {
    public static var `default`: ComponentAppearanceVariation<CollapsingNavigationBarInternalPage, CollapsingNavigationBarAppearance> {
        var appearance = CollapsingNavigationBarInternalPage.baseAppearance
        appearance.size = CollapsingNavigationBarInternalPageSize.`default`
        appearance.actionButtonAppearance = IconButton.s.secondary.appearance
        appearance.actionEndColor = ColorToken.textDefaultPrimary
        appearance.actionStartColor = ColorToken.textDefaultPrimary
        appearance.backIcon = Asset.disclosureLeftOutline24.image
        appearance.backIconColor = ColorToken.textDefaultPrimary
        appearance.backgroundColor = ColorToken.surfaceDefaultClear
        appearance.descriptionColor = ColorToken.textDefaultSecondary
        appearance.descriptionTypography = CollapsingNavigationBarTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.descriptionTypographyCollapsed = CollapsingNavigationBarTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textTypography = CollapsingNavigationBarTypography(oneSize: AdaptiveTypographyToken.headerH5Normal.typography).asContainer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = CollapsingNavigationBarTypography(oneSize: AdaptiveTypographyToken.headerH2Normal.typography).asContainer
        appearance.titleTypographyCollapsed = CollapsingNavigationBarTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }

    public static let all: [Variation<CollapsingNavigationBarAppearance>] = [
        CollapsingNavigationBarInternalPage.default.variation,
    ]
}

public struct CollapsingNavigationBarInternalPageVariation {
    public struct Default {}
}

private extension CollapsingNavigationBarInternalPage {
    static var baseAppearance: CollapsingNavigationBarAppearance {
        var appearance = CollapsingNavigationBarAppearance()
        appearance.actionButtonAppearance = IconButton.s.secondary.appearance
        appearance.actionEndColor = ColorToken.textDefaultPrimary
        appearance.actionStartColor = ColorToken.textDefaultPrimary
        appearance.backIcon = Asset.disclosureLeftOutline24.image
        appearance.backIconColor = ColorToken.textDefaultPrimary
        appearance.backgroundColor = ColorToken.surfaceDefaultClear
        appearance.descriptionColor = ColorToken.textDefaultSecondary
        appearance.descriptionTypography = CollapsingNavigationBarTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.descriptionTypographyCollapsed = CollapsingNavigationBarTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textTypography = CollapsingNavigationBarTypography(oneSize: AdaptiveTypographyToken.headerH5Normal.typography).asContainer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = CollapsingNavigationBarTypography(oneSize: AdaptiveTypographyToken.headerH2Normal.typography).asContainer
        appearance.titleTypographyCollapsed = CollapsingNavigationBarTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        return appearance
    }
}
