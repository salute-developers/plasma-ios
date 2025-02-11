import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public struct TextFieldClear {
    public static var l: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.L> {
        var appearance = TextFieldAppearance.base
        appearance.size = TextFieldClearSize.l
        appearance.chipAppearance = EmbeddedChip.l.secondary.appearance
        appearance.labelPlacement = TextFieldLabelPlacement.none
        appearance.textAfterTypography = TextFieldClearTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
        appearance.textBeforeTypography = TextFieldClearTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
        appearance.textTypography = TextFieldClearTypography(oneSize: Typographies.bodyLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.M> {
        var appearance = TextFieldAppearance.base
        appearance.size = TextFieldClearSize.m
        appearance.chipAppearance = EmbeddedChip.m.secondary.appearance
        appearance.labelPlacement = TextFieldLabelPlacement.none
        appearance.textAfterTypography = TextFieldClearTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.textBeforeTypography = TextFieldClearTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.textTypography = TextFieldClearTypography(oneSize: Typographies.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.S> {
        var appearance = TextFieldAppearance.base
        appearance.size = TextFieldClearSize.s
        appearance.chipAppearance = EmbeddedChip.s.secondary.appearance
        appearance.labelPlacement = TextFieldLabelPlacement.none
        appearance.textAfterTypography = TextFieldClearTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.textBeforeTypography = TextFieldClearTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.textTypography = TextFieldClearTypography(oneSize: Typographies.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.Xs> {
        var appearance = TextFieldAppearance.base
        appearance.size = TextFieldClearSize.xs
        appearance.chipAppearance = EmbeddedChip.xs.secondary.appearance
        appearance.labelPlacement = TextFieldLabelPlacement.none
        appearance.textAfterTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.textBeforeTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.textTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer

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
        TextFieldClear.l.variation,
        TextFieldClear.l.innerLabel.variation,
        TextFieldClear.l.innerLabel.requiredEnd.variation,
        TextFieldClear.l.innerLabel.requiredStart.variation,
        TextFieldClear.l.outerLabel.variation,
        TextFieldClear.l.outerLabel.requiredEnd.variation,
        TextFieldClear.l.outerLabel.requiredStart.variation,
        TextFieldClear.l.requiredEnd.variation,
        TextFieldClear.l.requiredStart.variation,
        TextFieldClear.m.variation,
        TextFieldClear.m.innerLabel.variation,
        TextFieldClear.m.innerLabel.requiredEnd.variation,
        TextFieldClear.m.innerLabel.requiredStart.variation,
        TextFieldClear.m.outerLabel.variation,
        TextFieldClear.m.outerLabel.requiredEnd.variation,
        TextFieldClear.m.outerLabel.requiredStart.variation,
        TextFieldClear.m.requiredEnd.variation,
        TextFieldClear.m.requiredStart.variation,
        TextFieldClear.s.variation,
        TextFieldClear.s.innerLabel.variation,
        TextFieldClear.s.innerLabel.requiredEnd.variation,
        TextFieldClear.s.innerLabel.requiredStart.variation,
        TextFieldClear.s.outerLabel.variation,
        TextFieldClear.s.outerLabel.requiredEnd.variation,
        TextFieldClear.s.outerLabel.requiredStart.variation,
        TextFieldClear.s.requiredEnd.variation,
        TextFieldClear.s.requiredStart.variation,
        TextFieldClear.xs.variation,
        TextFieldClear.xs.outerLabel.variation,
        TextFieldClear.xs.outerLabel.requiredEnd.variation,
        TextFieldClear.xs.outerLabel.requiredStart.variation,
        TextFieldClear.xs.requiredEnd.variation,
        TextFieldClear.xs.requiredStart.variation,
<<<<<<< HEAD
=======
    public static let all: [VariationDescription<TextFieldAppearance>] = [
        TextFieldClear.l.variationDescription,
        TextFieldClear.l.innerLabel.variationDescription,
        TextFieldClear.l.innerLabel.requiredEnd.variationDescription,
        TextFieldClear.l.innerLabel.requiredStart.variationDescription,
        TextFieldClear.l.outerLabel.variationDescription,
        TextFieldClear.l.outerLabel.requiredEnd.variationDescription,
        TextFieldClear.l.outerLabel.requiredStart.variationDescription,
        TextFieldClear.l.requiredEnd.variationDescription,
        TextFieldClear.l.requiredStart.variationDescription,
        TextFieldClear.m.variationDescription,
        TextFieldClear.m.innerLabel.variationDescription,
        TextFieldClear.m.innerLabel.requiredEnd.variationDescription,
        TextFieldClear.m.innerLabel.requiredStart.variationDescription,
        TextFieldClear.m.outerLabel.variationDescription,
        TextFieldClear.m.outerLabel.requiredEnd.variationDescription,
        TextFieldClear.m.outerLabel.requiredStart.variationDescription,
        TextFieldClear.m.requiredEnd.variationDescription,
        TextFieldClear.m.requiredStart.variationDescription,
        TextFieldClear.s.variationDescription,
        TextFieldClear.s.innerLabel.variationDescription,
        TextFieldClear.s.innerLabel.requiredEnd.variationDescription,
        TextFieldClear.s.innerLabel.requiredStart.variationDescription,
        TextFieldClear.s.outerLabel.variationDescription,
        TextFieldClear.s.outerLabel.requiredEnd.variationDescription,
        TextFieldClear.s.outerLabel.requiredStart.variationDescription,
        TextFieldClear.s.requiredEnd.variationDescription,
        TextFieldClear.s.requiredStart.variationDescription,
        TextFieldClear.xs.variationDescription,
        TextFieldClear.xs.outerLabel.variationDescription,
        TextFieldClear.xs.outerLabel.requiredEnd.variationDescription,
        TextFieldClear.xs.outerLabel.requiredStart.variationDescription,
        TextFieldClear.xs.requiredEnd.variationDescription,
        TextFieldClear.xs.requiredStart.variationDescription,
>>>>>>> b01b2af7 (chore: added fixes to demo app)
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    ]
}

public struct TextFieldClearVariation {
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
<<<<<<< HEAD
        appearance.captionColorReadOnly = ColorToken.textDefaultSecondary
=======
        appearance.captionColorFocused = ColorToken.textDefaultAccent
>>>>>>> eae55595 (feat: added variations support in demo app)
        appearance.captionTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.chipGroupAppearance = SDDSChipGroup.dense.appearance
        appearance.cursorColor = ColorToken.textDefaultAccent
        appearance.disabledAlpha = 0.4
        appearance.endContentColor = ColorToken.textDefaultSecondary
<<<<<<< HEAD
        appearance.endContentColorReadOnly = ColorToken.textDefaultSecondary.withOpacity(0.4)
=======
        appearance.endContentColorReadonly = ColorToken.textDefaultSecondary.withOpacity(0.4)
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
        appearance.lineColorReadOnly = ColorToken.surfaceDefaultTransparentPrimary
        appearance.optionalTitleColor = ColorToken.textDefaultTertiary
        appearance.placeholderColorReadOnly = ColorToken.textDefaultSecondary
        appearance.requiredIndicatorColor = ColorToken.surfaceDefaultNegative
        appearance.startContentColorReadOnly = ColorToken.textDefaultSecondary
        appearance.textAfterColor = ColorToken.textDefaultTertiary
        appearance.textBeforeColor = ColorToken.textDefaultTertiary
        appearance.textColorReadOnly = ColorToken.textDefaultPrimary
        return appearance
    }
}
