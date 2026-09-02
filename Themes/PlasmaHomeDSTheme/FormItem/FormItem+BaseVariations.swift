import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct FormItem {
    public static var `default`: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.Default> {
        var appearance = FormItemAppearance.base
        appearance.size = FormItemSize.`default`
        appearance.bottomTextAlignment = FormTextAlignment.center
        appearance.captionTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.counterColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [])
        appearance.counterTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.disableAlpha = 0.4
        appearance.hintColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [])
        appearance.hintIcon = Asset.infoCircleOutline16.image
        appearance.optionalColor = StatefulFillStyle(defaultValue: .color(.textDefaultTertiary), values: [])
        appearance.optionalTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titleCaptionColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [])
        appearance.titleCaptionTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [])
        appearance.titlePlacement = FormTitlePlacement.none
        appearance.titleTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.topTextAlignment = FormTextAlignment.center

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<FormItemAppearance>] {
        [
            FormItem.default.variation,
        ]
    }
}

public struct FormItemVariation {
    public struct Default {}
}

private extension FormItemAppearance {
    static var base: FormItemAppearance {
        var appearance = FormItemAppearance()
        appearance.bottomTextAlignment = FormTextAlignment.center
        appearance.captionTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.counterColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [])
        appearance.counterTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.disableAlpha = 0.4
        appearance.hintColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [])
        appearance.hintIcon = Asset.infoCircleOutline16.image
        appearance.optionalColor = StatefulFillStyle(defaultValue: .color(.textDefaultTertiary), values: [])
        appearance.optionalTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titleCaptionColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [])
        appearance.titleCaptionTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [])
        appearance.titlePlacement = FormTitlePlacement.none
        appearance.titleTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.topTextAlignment = FormTextAlignment.center
        return appearance
    }
}
