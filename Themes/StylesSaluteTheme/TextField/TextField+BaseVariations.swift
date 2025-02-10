import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public struct TextField {
    public static var l: GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.L> {
        var appearance = TextFieldAppearance.base
        appearance.size = TextFieldSize.l
        appearance.chipAppearance = EmbeddedChip.l.secondary.appearance
        appearance.textAfterTypography = TextFieldTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
        appearance.textBeforeTypography = TextFieldTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
        appearance.textTypography = TextFieldTypography(oneSize: Typographies.bodyLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.M> {
        var appearance = TextFieldAppearance.base
        appearance.size = TextFieldSize.m
        appearance.chipAppearance = EmbeddedChip.m.secondary.appearance
        appearance.textAfterTypography = TextFieldTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.textBeforeTypography = TextFieldTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.textTypography = TextFieldTypography(oneSize: Typographies.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.S> {
        var appearance = TextFieldAppearance.base
        appearance.size = TextFieldSize.s
        appearance.chipAppearance = EmbeddedChip.s.secondary.appearance
        appearance.textAfterTypography = TextFieldTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.textBeforeTypography = TextFieldTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.textTypography = TextFieldTypography(oneSize: Typographies.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.Xs> {
        var appearance = TextFieldAppearance.base
        appearance.size = TextFieldSize.xs
        appearance.chipAppearance = EmbeddedChip.xs.secondary.appearance
        appearance.textAfterTypography = TextFieldTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.textBeforeTypography = TextFieldTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.textTypography = TextFieldTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<TextFieldAppearance>] = [
        TextField.l.variation,
        TextField.l.innerLabel.variation,
        TextField.l.innerLabel.requiredEnd.variation,
        TextField.l.innerLabel.requiredStart.variation,
        TextField.l.outerLabel.variation,
        TextField.l.outerLabel.requiredEnd.variation,
        TextField.l.outerLabel.requiredStart.variation,
        TextField.l.requiredEnd.variation,
        TextField.l.requiredStart.variation,
        TextField.m.variation,
        TextField.m.innerLabel.variation,
        TextField.m.innerLabel.requiredEnd.variation,
        TextField.m.innerLabel.requiredStart.variation,
        TextField.m.outerLabel.variation,
        TextField.m.outerLabel.requiredEnd.variation,
        TextField.m.outerLabel.requiredStart.variation,
        TextField.m.requiredEnd.variation,
        TextField.m.requiredStart.variation,
        TextField.s.variation,
        TextField.s.innerLabel.variation,
        TextField.s.innerLabel.requiredEnd.variation,
        TextField.s.innerLabel.requiredStart.variation,
        TextField.s.outerLabel.variation,
        TextField.s.outerLabel.requiredEnd.variation,
        TextField.s.outerLabel.requiredStart.variation,
        TextField.s.requiredEnd.variation,
        TextField.s.requiredStart.variation,
        TextField.xs.variation,
        TextField.xs.outerLabel.variation,
        TextField.xs.outerLabel.requiredEnd.variation,
        TextField.xs.outerLabel.requiredStart.variation,
        TextField.xs.requiredEnd.variation,
        TextField.xs.requiredStart.variation,
    ]
}

public struct TextFieldVariation {
    public struct L {}
    public struct LInnerlabel {}
    public struct LInnerlabelRequiredend {}
    public struct LInnerlabelRequiredstart {}
    public struct LOuterlabel {}
    public struct LOuterlabelRequiredend {}
    public struct LOuterlabelRequiredstart {}
    public struct LRequiredend {}
    public struct LRequiredstart {}
    public struct M {}
    public struct MInnerlabel {}
    public struct MInnerlabelRequiredend {}
    public struct MInnerlabelRequiredstart {}
    public struct MOuterlabel {}
    public struct MOuterlabelRequiredend {}
    public struct MOuterlabelRequiredstart {}
    public struct MRequiredend {}
    public struct MRequiredstart {}
    public struct S {}
    public struct SInnerlabel {}
    public struct SInnerlabelRequiredend {}
    public struct SInnerlabelRequiredstart {}
    public struct SOuterlabel {}
    public struct SOuterlabelRequiredend {}
    public struct SOuterlabelRequiredstart {}
    public struct SRequiredend {}
    public struct SRequiredstart {}
    public struct Xs {}
    public struct XsOuterlabel {}
    public struct XsOuterlabelRequiredend {}
    public struct XsOuterlabelRequiredstart {}
    public struct XsRequiredend {}
    public struct XsRequiredstart {}
}

private extension TextFieldAppearance {
    static var base: TextFieldAppearance {
        var appearance = TextFieldAppearance()
        appearance.backgroundColorReadOnly = ColorToken.surfaceDefaultSolidPrimary.withOpacity(0.4)
        appearance.captionColorReadOnly = ColorToken.textDefaultSecondary
        appearance.captionTypography = TextFieldTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.chipGroupAppearance = ChipGroup.dense.appearance
        appearance.cursorColor = ColorToken.textDefaultAccentMain
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
