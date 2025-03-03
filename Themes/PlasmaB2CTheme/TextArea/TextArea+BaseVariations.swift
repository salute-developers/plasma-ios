import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public struct TextArea {
    public static var l: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.L> {
        var appearance = TextAreaAppearance.base
        appearance.size = TextAreaSize.l
        appearance.chipAppearance = EmbeddedChip.l.secondary.appearance
        appearance.textTypography = TextAreaTypography(oneSize: Typographies.bodyLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.M> {
        var appearance = TextAreaAppearance.base
        appearance.size = TextAreaSize.m
        appearance.chipAppearance = EmbeddedChip.m.secondary.appearance
        appearance.textTypography = TextAreaTypography(oneSize: Typographies.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.S> {
        var appearance = TextAreaAppearance.base
        appearance.size = TextAreaSize.s
        appearance.chipAppearance = EmbeddedChip.s.secondary.appearance
        appearance.textTypography = TextAreaTypography(oneSize: Typographies.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.Xs> {
        var appearance = TextAreaAppearance.base
        appearance.size = TextAreaSize.xs
        appearance.chipAppearance = EmbeddedChip.xs.secondary.appearance
        appearance.textTypography = TextAreaTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<TextAreaAppearance>] = [
        TextArea.l.variation,
        TextArea.l.innerLabel.variation,
        TextArea.l.innerLabel.requiredEnd.variation,
        TextArea.l.innerLabel.requiredStart.variation,
        TextArea.l.outerLabel.variation,
        TextArea.l.outerLabel.requiredEnd.variation,
        TextArea.l.outerLabel.requiredStart.variation,
        TextArea.l.requiredEnd.variation,
        TextArea.l.requiredStart.variation,
        TextArea.m.variation,
        TextArea.m.innerLabel.variation,
        TextArea.m.innerLabel.requiredEnd.variation,
        TextArea.m.innerLabel.requiredStart.variation,
        TextArea.m.outerLabel.variation,
        TextArea.m.outerLabel.requiredEnd.variation,
        TextArea.m.outerLabel.requiredStart.variation,
        TextArea.m.requiredEnd.variation,
        TextArea.m.requiredStart.variation,
        TextArea.s.variation,
        TextArea.s.innerLabel.variation,
        TextArea.s.innerLabel.requiredEnd.variation,
        TextArea.s.innerLabel.requiredStart.variation,
        TextArea.s.outerLabel.variation,
        TextArea.s.outerLabel.requiredEnd.variation,
        TextArea.s.outerLabel.requiredStart.variation,
        TextArea.s.requiredEnd.variation,
        TextArea.s.requiredStart.variation,
        TextArea.xs.variation,
        TextArea.xs.outerLabel.variation,
        TextArea.xs.outerLabel.requiredEnd.variation,
        TextArea.xs.outerLabel.requiredStart.variation,
        TextArea.xs.requiredEnd.variation,
        TextArea.xs.requiredStart.variation,
    ]
}

public struct TextAreaVariation {
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

private extension TextAreaAppearance {
    static var base: TextAreaAppearance {
        var appearance = TextAreaAppearance()
        appearance.backgroundColorReadOnly = ColorToken.surfaceDefaultSolidPrimary.withOpacity(0.4)
        appearance.captionColorReadOnly = ColorToken.textDefaultSecondary
        appearance.captionTypography = TextAreaTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.chipGroupAppearance = ChipGroup.dense.appearance
        appearance.counterColor = ColorToken.textDefaultSecondary
        appearance.counterTypography = TextAreaTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.cursorColor = ColorToken.textDefaultAccent
        appearance.disabledAlpha = 0.4
        appearance.endContentColor = ColorToken.textDefaultSecondary
        appearance.endContentColorReadOnly = ColorToken.textDefaultSecondary.withOpacity(0.4)
        appearance.optionalTitleColor = ColorToken.textDefaultTertiary
        appearance.placeholderColor = ColorToken.textDefaultSecondary
        appearance.placeholderColorFocused = ColorToken.textDefaultTertiary
        appearance.requiredIndicatorColor = ColorToken.surfaceDefaultNegative
        appearance.startContentColor = ColorToken.textDefaultSecondary
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textColorFocused = ColorToken.textDefaultPrimary
        return appearance
    }
}
