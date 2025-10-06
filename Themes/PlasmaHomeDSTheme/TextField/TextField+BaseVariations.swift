import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TextField {
    public static var l: GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.L> {
        var appearance = TextFieldAppearance.base
        appearance.size = TextFieldSize.l
        appearance.textAfterTypography = TextFieldTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.textBeforeTypography = TextFieldTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.textTypography = TextFieldTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.M> {
        var appearance = TextFieldAppearance.base
        appearance.size = TextFieldSize.m
        appearance.textAfterTypography = TextFieldTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.textBeforeTypography = TextFieldTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.textTypography = TextFieldTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.S> {
        var appearance = TextFieldAppearance.base
        appearance.size = TextFieldSize.s
        appearance.textAfterTypography = TextFieldTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.textBeforeTypography = TextFieldTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.textTypography = TextFieldTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<TextFieldAppearance>] = [
        TextField.l.variation,
        TextField.l.innerLabel.variation,
        TextField.l.innerLabel.requiredEnd.variation,
        TextField.l.innerLabel.requiredStart.variation,
        TextField.l.requiredEnd.variation,
        TextField.l.requiredStart.variation,
        TextField.m.variation,
        TextField.m.innerLabel.variation,
        TextField.m.innerLabel.requiredEnd.variation,
        TextField.m.innerLabel.requiredStart.variation,
        TextField.m.requiredEnd.variation,
        TextField.m.requiredStart.variation,
        TextField.s.variation,
        TextField.s.innerLabel.variation,
        TextField.s.innerLabel.requiredEnd.variation,
        TextField.s.innerLabel.requiredStart.variation,
        TextField.s.requiredEnd.variation,
        TextField.s.requiredStart.variation,
    ]
}

public struct TextFieldVariation {
    public struct L {}
    public struct LInnerlabel {}
    public struct LInnerlabelRequiredend {}
    public struct LInnerlabelRequiredstart {}
    public struct LRequiredend {}
    public struct LRequiredstart {}
    public struct M {}
    public struct MInnerlabel {}
    public struct MInnerlabelRequiredend {}
    public struct MInnerlabelRequiredstart {}
    public struct MRequiredend {}
    public struct MRequiredstart {}
    public struct S {}
    public struct SInnerlabel {}
    public struct SInnerlabelRequiredend {}
    public struct SInnerlabelRequiredstart {}
    public struct SRequiredend {}
    public struct SRequiredstart {}
}

private extension TextFieldAppearance {
    static var base: TextFieldAppearance {
        var appearance = TextFieldAppearance()
        appearance.backgroundColorReadOnly = ColorToken.surfaceDefaultSolidPrimary.withOpacity(0.4)
        appearance.captionColorReadOnly = ColorToken.textDefaultSecondary
        appearance.captionTypography = TextFieldTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.cursorColor = ColorToken.textDefaultAccent
        appearance.disabledAlpha = 0.4
        appearance.endContentColor = ColorToken.textDefaultSecondary
        appearance.endContentColorReadOnly = ColorToken.textDefaultSecondary.withOpacity(0.4)
        appearance.optionalTitleColor = ColorToken.textDefaultTertiary
        appearance.placeholderColor = ColorToken.textDefaultSecondary
        appearance.placeholderColorFocused = ColorToken.textDefaultTertiary
        appearance.requiredIndicatorColor = ColorToken.surfaceDefaultNegative
        appearance.startContentColor = ColorToken.textDefaultSecondary
        appearance.startContentColorFocused = ColorToken.textDefaultSecondary
        appearance.textAfterColor = ColorToken.textDefaultTertiary
        appearance.textBeforeColor = ColorToken.textDefaultTertiary
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textColorFocused = ColorToken.textDefaultPrimary
        return appearance
    }
}
