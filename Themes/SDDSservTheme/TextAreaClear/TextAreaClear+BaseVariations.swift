import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public struct TextAreaClear {
    public static var l: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.L> {
        var appearance = TextAreaAppearance.base
        appearance.size = TextAreaClearSize.l
        appearance.chipAppearance = EmbeddedChip.l.secondary.appearance
        appearance.labelPlacement = TextAreaLabelPlacement.none
        appearance.textTypography = TextAreaClearTypography(oneSize: Typographies.bodyLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.M> {
        var appearance = TextAreaAppearance.base
        appearance.size = TextAreaClearSize.m
        appearance.chipAppearance = EmbeddedChip.m.secondary.appearance
        appearance.labelPlacement = TextAreaLabelPlacement.none
        appearance.textTypography = TextAreaClearTypography(oneSize: Typographies.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.S> {
        var appearance = TextAreaAppearance.base
        appearance.size = TextAreaClearSize.s
        appearance.chipAppearance = EmbeddedChip.s.secondary.appearance
        appearance.labelPlacement = TextAreaLabelPlacement.none
        appearance.textTypography = TextAreaClearTypography(oneSize: Typographies.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.Xs> {
        var appearance = TextAreaAppearance.base
        appearance.size = TextAreaClearSize.xs
        appearance.chipAppearance = EmbeddedChip.xs.secondary.appearance
        appearance.labelPlacement = TextAreaLabelPlacement.none
        appearance.textTypography = TextAreaClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<TextAreaAppearance>] = [
        TextAreaClear.l.variation,
        TextAreaClear.l.innerLabel.variation,
        TextAreaClear.l.innerLabel.requiredEnd.variation,
        TextAreaClear.l.innerLabel.requiredStart.variation,
        TextAreaClear.l.outerLabel.variation,
        TextAreaClear.l.outerLabel.requiredEnd.variation,
        TextAreaClear.l.outerLabel.requiredStart.variation,
        TextAreaClear.l.requiredEnd.variation,
        TextAreaClear.l.requiredStart.variation,
        TextAreaClear.m.variation,
        TextAreaClear.m.innerLabel.variation,
        TextAreaClear.m.innerLabel.requiredEnd.variation,
        TextAreaClear.m.innerLabel.requiredStart.variation,
        TextAreaClear.m.outerLabel.variation,
        TextAreaClear.m.outerLabel.requiredEnd.variation,
        TextAreaClear.m.outerLabel.requiredStart.variation,
        TextAreaClear.m.requiredEnd.variation,
        TextAreaClear.m.requiredStart.variation,
        TextAreaClear.s.variation,
        TextAreaClear.s.innerLabel.variation,
        TextAreaClear.s.innerLabel.requiredEnd.variation,
        TextAreaClear.s.innerLabel.requiredStart.variation,
        TextAreaClear.s.outerLabel.variation,
        TextAreaClear.s.outerLabel.requiredEnd.variation,
        TextAreaClear.s.outerLabel.requiredStart.variation,
        TextAreaClear.s.requiredEnd.variation,
        TextAreaClear.s.requiredStart.variation,
        TextAreaClear.xs.variation,
        TextAreaClear.xs.outerLabel.variation,
        TextAreaClear.xs.outerLabel.requiredEnd.variation,
        TextAreaClear.xs.outerLabel.requiredStart.variation,
        TextAreaClear.xs.requiredEnd.variation,
<<<<<<< HEAD
        TextAreaClear.xs.requiredStart.variation
=======
        TextAreaClear.xs.requiredStart.variation,
>>>>>>> eae55595 (feat: added variations support in demo app)
    ]
}

public struct TextAreaClearVariation {
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
<<<<<<< HEAD
        appearance.captionColorReadOnly = ColorToken.textDefaultSecondary
=======
        appearance.captionColorFocused = ColorToken.textDefaultAccent
>>>>>>> eae55595 (feat: added variations support in demo app)
        appearance.captionTypography = TextAreaClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.chipGroupAppearance = SDDSChipGroup.dense.appearance
        appearance.counterColor = ColorToken.textDefaultSecondary
        appearance.counterTypography = TextAreaClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.cursorColor = ColorToken.textDefaultAccent
        appearance.disabledAlpha = 0.4
        appearance.endContentColor = ColorToken.textDefaultSecondary
<<<<<<< HEAD
        appearance.endContentColorReadOnly = ColorToken.textDefaultSecondary.withOpacity(0.4)
=======
        appearance.endContentColorReadonly = ColorToken.textDefaultSecondary.withOpacity(0.4)
        appearance.labelPlacement = TextAreaLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
        appearance.lineColorReadOnly = ColorToken.surfaceDefaultTransparentPrimary
        appearance.optionalTitleColor = ColorToken.textDefaultTertiary
        appearance.placeholderColorReadOnly = ColorToken.textDefaultSecondary
        appearance.requiredIndicatorColor = ColorToken.surfaceDefaultNegative
        appearance.textColorReadOnly = ColorToken.textDefaultPrimary
        return appearance
    }
}
