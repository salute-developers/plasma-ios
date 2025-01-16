import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public struct TextArea {
    public static var l: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.L> {
        var appearance = TextAreaAppearance.base
        appearance.size = TextAreaSize.l
        appearance.chipAppearance = EmbeddedChip.l.secondary.appearance
        appearance.textTypography = TextFieldTypography(oneSize: Typographies.bodyLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.M> {
        var appearance = TextAreaAppearance.base
        appearance.size = TextAreaSize.m
        appearance.chipAppearance = EmbeddedChip.m.secondary.appearance
        appearance.textTypography = TextFieldTypography(oneSize: Typographies.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.S> {
        var appearance = TextAreaAppearance.base
        appearance.size = TextAreaSize.s
        appearance.chipAppearance = EmbeddedChip.s.secondary.appearance
        appearance.textTypography = TextFieldTypography(oneSize: Typographies.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.Xs> {
        var appearance = TextAreaAppearance.base
        appearance.size = TextAreaSize.xs
        appearance.chipAppearance = EmbeddedChip.xs.secondary.appearance
        appearance.textTypography = TextFieldTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Any] = [
        TextArea.l,
        TextArea.m,
        TextArea.s,
        TextArea.xs,
    ]
}

public struct TextAreaVariation {
    public struct L {}
    public struct LInnerlabel {}
    public struct LOuterlabel {}
    public struct M {}
    public struct MInnerlabel {}
    public struct MOuterlabel {}
    public struct S {}
    public struct SInnerlabel {}
    public struct SOuterlabel {}
    public struct Xs {}
    public struct XsOuterlabel {}
}

private extension TextAreaAppearance {
    static var base: TextAreaAppearance {
        var appearance = TextAreaAppearance()
        appearance.captionColorFocused = ColorToken.textDefaultAccent
        appearance.captionTypography = TextFieldTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.chipGroupAppearance = SDDSChipGroup.dense.appearance
        appearance.counterColor = ColorToken.textDefaultSecondary
        appearance.cursorColor = ColorToken.textDefaultAccent
        appearance.disabledAlpha = 0.4
        appearance.endContentColor = ColorToken.textDefaultSecondary
        appearance.endContentColorReadonly = ColorToken.textDefaultSecondary.withOpacity(0.4)
        appearance.optionalTitleColor = ColorToken.textDefaultTertiary
        appearance.placeholderColor = ColorToken.textDefaultSecondary
        appearance.placeholderColorFocused = ColorToken.textDefaultTertiary
        appearance.placeholderColorReadOnly = ColorToken.textDefaultSecondary
        appearance.requiredIndicatorColor = ColorToken.surfaceDefaultNegative
        appearance.startContentColor = ColorToken.textDefaultSecondary
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textColorFocused = ColorToken.textDefaultPrimary
        appearance.textColorReadOnly = ColorToken.textDefaultPrimary
        appearance.titleColor = ColorToken.textDefaultPrimary
        return appearance
    }
}
