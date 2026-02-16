import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public extension GeneralAppearanceVariation<CollapsingNavigationBarInternalPage, CollapsingNavigationBarAppearance, CollapsingNavigationBarInternalPageVariation.Default> {
    var `default`: ComponentAppearanceVariation<CollapsingNavigationBarInternalPage, CollapsingNavigationBarAppearance> {
        var size = CollapsingNavigationBarInternalPageAnySize(size: appearance.size)
        size.backIconMargin = CGFloat(4.0)
        size.descriptionPadding = CGFloat(12.0)
        size.descriptionPaddingCollapsed = CGFloat(4.0)
        size.horizontalSpacing = CGFloat(8.0)
        size.paddingBottom = CGFloat(8.0)
        size.paddingEnd = CGFloat(16.0)
        size.paddingStart = CGFloat(16.0)
        size.paddingTop = CGFloat(8.0)
        size.textBlockTopMargin = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
        appearance.actionButtonAppearance = IconButton.s.secondary.appearance
        appearance.actionEndColor = ColorToken.textDefaultPrimary
        appearance.actionStartColor = ColorToken.textDefaultPrimary
        appearance.backIcon = Asset.disclosureLeftOutline24.image
        appearance.backIconColor = ColorToken.textDefaultPrimary
        appearance.backgroundColor = ColorToken.surfaceDefaultClear
        appearance.descriptionColor = ColorToken.textDefaultSecondary
        appearance.descriptionTypography = CollapsingNavigationBarTypography(default: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.descriptionTypographyCollapsed = CollapsingNavigationBarTypography(default: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textTypography = CollapsingNavigationBarTypography(default: AdaptiveTypographyToken.headerH5Normal.typography).asContainer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = CollapsingNavigationBarTypography(default: AdaptiveTypographyToken.headerH2Normal.typography).asContainer
        appearance.titleTypographyCollapsed = CollapsingNavigationBarTypography(default: AdaptiveTypographyToken.bodyMNormal.typography).asContainer

        return .init(
            name: "default",
            appearance: appearance
        )
    }

    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
}

public extension ComponentAppearanceVariation<CollapsingNavigationBarInternalPage, CollapsingNavigationBarAppearance> {
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
}
