import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TextFieldClear {
    public static var l: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.L> {
        var appearance = TextFieldAppearance.base
        appearance.size = TextFieldClearSize.l
        appearance.chipGroupAppearance = EmbeddedChipGroupDense.l.secondary.appearance
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
        appearance.chipGroupAppearance = EmbeddedChipGroupDense.m.secondary.appearance
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
        appearance.chipGroupAppearance = EmbeddedChipGroupDense.s.secondary.appearance
        appearance.textAfterTypography = TextFieldClearTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.textBeforeTypography = TextFieldClearTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.textTypography = TextFieldClearTypography(oneSize: Typographies.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.Xl> {
        var appearance = TextFieldAppearance.base
        appearance.size = TextFieldClearSize.xl
        appearance.chipGroupAppearance = EmbeddedChipGroupDense.l.secondary.appearance
        appearance.textAfterTypography = TextFieldClearTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
        appearance.textBeforeTypography = TextFieldClearTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
        appearance.textTypography = TextFieldClearTypography(oneSize: Typographies.bodyLNormal.typography).asContainer

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.Xs> {
        var appearance = TextFieldAppearance.base
        appearance.size = TextFieldClearSize.xs
        appearance.chipGroupAppearance = EmbeddedChipGroupDense.xs.secondary.appearance
        appearance.textAfterTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.textBeforeTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.textTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
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
        TextFieldClear.xl.variation,
        TextFieldClear.xl.innerLabel.variation,
        TextFieldClear.xl.innerLabel.requiredEnd.variation,
        TextFieldClear.xl.innerLabel.requiredStart.variation,
        TextFieldClear.xl.outerLabel.variation,
        TextFieldClear.xl.outerLabel.requiredEnd.variation,
        TextFieldClear.xl.outerLabel.requiredStart.variation,
        TextFieldClear.xl.requiredEnd.variation,
        TextFieldClear.xl.requiredStart.variation,
        TextFieldClear.xs.variation,
        TextFieldClear.xs.outerLabel.variation,
        TextFieldClear.xs.outerLabel.requiredEnd.variation,
        TextFieldClear.xs.outerLabel.requiredStart.variation,
        TextFieldClear.xs.requiredEnd.variation,
        TextFieldClear.xs.requiredStart.variation,
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
    public struct Xl {}
    public struct XlInnerlabel {}
    public struct XlInnerlabelRequiredend {}
    public struct XlInnerlabelRequiredstart {}
    public struct XlOuterlabel {}
    public struct XlOuterlabelRequiredend {}
    public struct XlOuterlabelRequiredstart {}
    public struct XlRequiredend {}
    public struct XlRequiredstart {}
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
        appearance.captionColorReadOnly = ColorToken.textDefaultSecondary
        appearance.captionTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.cursorColor = ColorToken.textDefaultAccent
        appearance.disabledAlpha = 0.4
        appearance.endContentColor = ColorToken.textDefaultSecondary
        appearance.endContentColorReadOnly = ColorToken.textDefaultSecondary.withOpacity(0.4)
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
