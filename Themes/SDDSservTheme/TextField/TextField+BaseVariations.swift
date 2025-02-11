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
    
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
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
<<<<<<< HEAD
=======
    public static let all: [VariationDescription<TextFieldAppearance>] = [
        TextField.l.variationDescription,
        TextField.l.innerLabel.variationDescription,
        TextField.l.innerLabel.requiredEnd.variationDescription,
        TextField.l.innerLabel.requiredStart.variationDescription,
        TextField.l.outerLabel.variationDescription,
        TextField.l.outerLabel.requiredEnd.variationDescription,
        TextField.l.outerLabel.requiredStart.variationDescription,
        TextField.l.requiredEnd.variationDescription,
        TextField.l.requiredStart.variationDescription,
        TextField.m.variationDescription,
        TextField.m.innerLabel.variationDescription,
        TextField.m.innerLabel.requiredEnd.variationDescription,
        TextField.m.innerLabel.requiredStart.variationDescription,
        TextField.m.outerLabel.variationDescription,
        TextField.m.outerLabel.requiredEnd.variationDescription,
        TextField.m.outerLabel.requiredStart.variationDescription,
        TextField.m.requiredEnd.variationDescription,
        TextField.m.requiredStart.variationDescription,
        TextField.s.variationDescription,
        TextField.s.innerLabel.variationDescription,
        TextField.s.innerLabel.requiredEnd.variationDescription,
        TextField.s.innerLabel.requiredStart.variationDescription,
        TextField.s.outerLabel.variationDescription,
        TextField.s.outerLabel.requiredEnd.variationDescription,
        TextField.s.outerLabel.requiredStart.variationDescription,
        TextField.s.requiredEnd.variationDescription,
        TextField.s.requiredStart.variationDescription,
        TextField.xs.variationDescription,
        TextField.xs.outerLabel.variationDescription,
        TextField.xs.outerLabel.requiredEnd.variationDescription,
        TextField.xs.outerLabel.requiredStart.variationDescription,
        TextField.xs.requiredEnd.variationDescription,
        TextField.xs.requiredStart.variationDescription,
>>>>>>> b01b2af7 (chore: added fixes to demo app)
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
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
        appearance.chipGroupAppearance = SDDSChipGroup.dense.appearance
        appearance.cursorColor = ColorToken.textDefaultAccent
        appearance.disabledAlpha = 0.4
        appearance.endContentColor = ColorToken.textDefaultSecondary
<<<<<<< HEAD
        appearance.endContentColorReadOnly = ColorToken.textDefaultSecondary.withOpacity(0.4)
=======
        appearance.endContentColorReadonly = ColorToken.textDefaultSecondary.withOpacity(0.4)
<<<<<<< HEAD
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
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
