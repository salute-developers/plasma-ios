import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<CollapsingNavigationBarMainPage, CollapsingNavigationBarAppearance, CollapsingNavigationBarMainPageVariation.Default> {
    
    var `default`: ComponentAppearanceVariation<CollapsingNavigationBarMainPage, CollapsingNavigationBarAppearance> {
        var size =  CollapsingNavigationBarMainPageAnySize(size: appearance.size)
        size.descriptionPadding = CGFloat(12.0)
        size.descriptionPaddingCollapsed = CGFloat(4.0)
        size.horizontalSpacing = CGFloat(8.0)
        size.paddingBottom = CGFloat(8.0)
        size.paddingEnd = CGFloat(24.0)
        size.paddingStart = CGFloat(24.0)
        size.paddingTop = CGFloat(8.0)
        size.textBlockTopMargin = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
        appearance.actionButtonAppearance = IconButton.s.secondary.appearance
        appearance.actionEndColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [])
        appearance.actionStartColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [])
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [])
        appearance.descriptionColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [])
        appearance.descriptionTypography = CollapsingNavigationBarMainPageTypography(default: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.descriptionTypographyCollapsed = CollapsingNavigationBarMainPageTypography(default: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.textColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [])
        appearance.textTypography = CollapsingNavigationBarMainPageTypography(default: AdaptiveTypographyToken.headerH5Normal.typography).asContainer
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [])
        appearance.titleTypography = CollapsingNavigationBarMainPageTypography(default: AdaptiveTypographyToken.headerH2Normal.typography).asContainer
        appearance.titleTypographyCollapsed = CollapsingNavigationBarMainPageTypography(default: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
    
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


public extension ComponentAppearanceVariation<CollapsingNavigationBarMainPage, CollapsingNavigationBarAppearance> {
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

private extension CollapsingNavigationBarAppearance {
    
}

