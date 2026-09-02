import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct CollapsingNavigationBarMainPage {
    public static var `default`: ComponentAppearanceVariation<CollapsingNavigationBarMainPage, CollapsingNavigationBarAppearance> {
        var appearance = CollapsingNavigationBarAppearance.base
        appearance.size = CollapsingNavigationBarMainPageSize.`default`
        appearance.actionButtonAppearance = IconButton.s.secondary.appearance
        appearance.actionEndColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [])
        appearance.actionStartColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [])
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [])
        appearance.descriptionColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [])
        appearance.descriptionTypography = CollapsingNavigationBarMainPageTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.descriptionTypographyCollapsed = CollapsingNavigationBarMainPageTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.textColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [])
        appearance.textTypography = CollapsingNavigationBarMainPageTypography(oneSize: AdaptiveTypographyToken.headerH5Normal.typography).asContainer
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [])
        appearance.titleTypography = CollapsingNavigationBarMainPageTypography(oneSize: AdaptiveTypographyToken.headerH2Normal.typography).asContainer
        appearance.titleTypographyCollapsed = CollapsingNavigationBarMainPageTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<CollapsingNavigationBarAppearance>] {
        [
            CollapsingNavigationBarMainPage.default.variation,
        ]
    }
}

public struct CollapsingNavigationBarMainPageVariation {
    public struct Default {}
}

private extension CollapsingNavigationBarAppearance {
    static var base: CollapsingNavigationBarAppearance {
        var appearance = CollapsingNavigationBarAppearance()
        appearance.actionButtonAppearance = IconButton.s.secondary.appearance
        appearance.actionEndColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [])
        appearance.actionStartColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [])
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [])
        appearance.descriptionColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [])
        appearance.descriptionTypography = CollapsingNavigationBarMainPageTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.descriptionTypographyCollapsed = CollapsingNavigationBarMainPageTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.textColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [])
        appearance.textTypography = CollapsingNavigationBarMainPageTypography(oneSize: AdaptiveTypographyToken.headerH5Normal.typography).asContainer
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [])
        appearance.titleTypography = CollapsingNavigationBarMainPageTypography(oneSize: AdaptiveTypographyToken.headerH2Normal.typography).asContainer
        appearance.titleTypographyCollapsed = CollapsingNavigationBarMainPageTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        return appearance
    }
}
