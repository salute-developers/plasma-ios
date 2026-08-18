import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct CollapsingNavigationBarInternalPage {
    public static var `default`: ComponentAppearanceVariation<CollapsingNavigationBarInternalPage, CollapsingNavigationBarAppearance> {
        var appearance = CollapsingNavigationBarAppearance.base
        appearance.size = CollapsingNavigationBarInternalPageSize.`default`
        appearance.actionButtonAppearance = IconButton.s.secondary.appearance
        appearance.actionEndColor = ColorToken.textDefaultPrimary
        appearance.actionStartColor = ColorToken.textDefaultPrimary
        appearance.backIcon = Asset.chevronLeft24.image
        appearance.backIconColor = ColorToken.textDefaultPrimary
        appearance.backgroundColor = ColorToken.surfaceDefaultClear
        appearance.descriptionColor = ColorToken.textDefaultSecondary
        appearance.descriptionTypography = CollapsingNavigationBarInternalPageTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.descriptionTypographyCollapsed = CollapsingNavigationBarInternalPageTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textTypography = CollapsingNavigationBarInternalPageTypography(oneSize: AdaptiveTypographyToken.headerH5Normal.typography).asContainer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = CollapsingNavigationBarInternalPageTypography(oneSize: AdaptiveTypographyToken.headerH2Normal.typography).asContainer
        appearance.titleTypographyCollapsed = CollapsingNavigationBarInternalPageTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<CollapsingNavigationBarAppearance>] {
        [
            CollapsingNavigationBarInternalPage.default.variation,
        ]
    }
}

public struct CollapsingNavigationBarInternalPageVariation {
    public struct Default {}
}

private extension CollapsingNavigationBarAppearance {
    static var base: CollapsingNavigationBarAppearance {
        var appearance = CollapsingNavigationBarAppearance()
        appearance.actionButtonAppearance = IconButton.s.secondary.appearance
        appearance.actionEndColor = ColorToken.textDefaultPrimary
        appearance.actionStartColor = ColorToken.textDefaultPrimary
        appearance.backIcon = Asset.chevronLeft24.image
        appearance.backIconColor = ColorToken.textDefaultPrimary
        appearance.backgroundColor = ColorToken.surfaceDefaultClear
        appearance.descriptionColor = ColorToken.textDefaultSecondary
        appearance.descriptionTypography = CollapsingNavigationBarInternalPageTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.descriptionTypographyCollapsed = CollapsingNavigationBarInternalPageTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textTypography = CollapsingNavigationBarInternalPageTypography(oneSize: AdaptiveTypographyToken.headerH5Normal.typography).asContainer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = CollapsingNavigationBarInternalPageTypography(oneSize: AdaptiveTypographyToken.headerH2Normal.typography).asContainer
        appearance.titleTypographyCollapsed = CollapsingNavigationBarInternalPageTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        return appearance
    }
}
