import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public struct TextFieldClear {
    public static var l: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.L> {
        var appearance = TextFieldAppearance.base
        appearance.size = TextFieldClearSize.l
        appearance.chipAppearance = EmbeddedChip.l.secondary.appearance
        appearance.textAfterTypography = TextFieldTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
        appearance.textBeforeTypography = TextFieldTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
        appearance.textTypography = TextFieldTypography(oneSize: Typographies.bodyLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.M> {
        var appearance = TextFieldAppearance.base
        appearance.size = TextFieldClearSize.m
        appearance.chipAppearance = EmbeddedChip.m.secondary.appearance
        appearance.textAfterTypography = TextFieldTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.textBeforeTypography = TextFieldTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.textTypography = TextFieldTypography(oneSize: Typographies.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.S> {
        var appearance = TextFieldAppearance.base
        appearance.size = TextFieldClearSize.s
        appearance.chipAppearance = EmbeddedChip.s.secondary.appearance
        appearance.textAfterTypography = TextFieldTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.textBeforeTypography = TextFieldTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.textTypography = TextFieldTypography(oneSize: Typographies.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.Xs> {
        var appearance = TextFieldAppearance.base
        appearance.size = TextFieldClearSize.xs
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
        TextFieldClear.l,
        TextFieldClear.m,
        TextFieldClear.s,
        TextFieldClear.xs,
    ]
}

public struct TextFieldClearVariation {
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
        appearance.lineColorReadOnly = ColorToken.surfaceDefaultTransparentPrimary
        appearance.optionalTitleColor = ColorToken.textDefaultTertiary
        appearance.requiredIndicatorColor = ColorToken.surfaceDefaultNegative
        appearance.textAfterColor = ColorToken.textDefaultTertiary
        appearance.textBeforeColor = ColorToken.textDefaultTertiary
        return appearance
    }
}
