import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public struct TextAreaClear {
    public static var l: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.L> {
        var appearance = TextAreaAppearance.base
        appearance.size = TextAreaClearSize.l
        appearance.chipAppearance = EmbeddedChip.l.secondary.appearance
        appearance.textTypography = TextFieldTypography(oneSize: Typographies.bodyLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.M> {
        var appearance = TextAreaAppearance.base
        appearance.size = TextAreaClearSize.m
        appearance.chipAppearance = EmbeddedChip.m.secondary.appearance
        appearance.textTypography = TextFieldTypography(oneSize: Typographies.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.S> {
        var appearance = TextAreaAppearance.base
        appearance.size = TextAreaClearSize.s
        appearance.chipAppearance = EmbeddedChip.s.secondary.appearance
        appearance.textTypography = TextFieldTypography(oneSize: Typographies.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.Xs> {
        var appearance = TextAreaAppearance.base
        appearance.size = TextAreaClearSize.xs
        appearance.chipAppearance = EmbeddedChip.xs.secondary.appearance
        appearance.textTypography = TextFieldTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Any] = [
        TextAreaClear.l,
        TextAreaClear.m,
        TextAreaClear.s,
        TextAreaClear.xs,
    ]
}

public struct TextAreaClearVariation {
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
        appearance.lineColorReadOnly = ColorToken.surfaceDefaultTransparentPrimary
        appearance.optionalTitleColor = ColorToken.textDefaultTertiary
        appearance.requiredIndicatorColor = ColorToken.surfaceDefaultNegative
        return appearance
    }
}
