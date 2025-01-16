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
    
    public static let all: [Any] = [
        TextField.l,
        TextField.m,
        TextField.s,
        TextField.xs,
    ]
}

public struct TextFieldVariation {
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

private extension TextFieldAppearance {
    static var base: TextFieldAppearance {
        var appearance = TextFieldAppearance()
        appearance.captionColorFocused = ColorToken.textDefaultAccent
        appearance.captionTypography = TextFieldTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.chipGroupAppearance = SDDSChipGroup.dense.appearance
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
        appearance.textAfterColor = ColorToken.textDefaultTertiary
        appearance.textBeforeColor = ColorToken.textDefaultTertiary
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textColorFocused = ColorToken.textDefaultPrimary
        appearance.textColorReadOnly = ColorToken.textDefaultPrimary
        appearance.titleColor = ColorToken.textDefaultPrimary
        return appearance
    }
}
