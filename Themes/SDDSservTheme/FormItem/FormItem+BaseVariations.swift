import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct FormItem {
    public static var l: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.L> {
        var appearance = FormItemAppearance.base
        appearance.size = FormItemSize.l
        appearance.hintIcon = Asset.infoCircleOutline24.image
        appearance.titlePlacement = FormTitlePlacement.none

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.M> {
        var appearance = FormItemAppearance.base
        appearance.size = FormItemSize.m
        appearance.hintIcon = Asset.infoCircleOutline24.image
        appearance.titlePlacement = FormTitlePlacement.none

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.S> {
        var appearance = FormItemAppearance.base
        appearance.size = FormItemSize.s
        appearance.hintIcon = Asset.infoCircleOutline24.image
        appearance.titlePlacement = FormTitlePlacement.none

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.Xs> {
        var appearance = FormItemAppearance.base
        appearance.size = FormItemSize.xs
        appearance.hintIcon = Asset.infoCircleOutline16.image
        appearance.titlePlacement = FormTitlePlacement.none

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<FormItemAppearance>] = [
        FormItem.l.variation,
        FormItem.l.requiredEnd.variation,
        FormItem.l.requiredStart.variation,
        FormItem.l.titleStart.variation,
        FormItem.l.titleStart.requiredEnd.variation,
        FormItem.l.titleStart.requiredStart.variation,
        FormItem.l.titleTop.variation,
        FormItem.l.titleTop.requiredEnd.variation,
        FormItem.l.titleTop.requiredStart.variation,
        FormItem.m.variation,
        FormItem.m.requiredEnd.variation,
        FormItem.m.requiredStart.variation,
        FormItem.m.titleStart.variation,
        FormItem.m.titleStart.requiredEnd.variation,
        FormItem.m.titleStart.requiredStart.variation,
        FormItem.m.titleTop.variation,
        FormItem.m.titleTop.requiredEnd.variation,
        FormItem.m.titleTop.requiredStart.variation,
        FormItem.s.variation,
        FormItem.s.requiredEnd.variation,
        FormItem.s.requiredStart.variation,
        FormItem.s.titleStart.variation,
        FormItem.s.titleStart.requiredEnd.variation,
        FormItem.s.titleStart.requiredStart.variation,
        FormItem.s.titleTop.variation,
        FormItem.s.titleTop.requiredEnd.variation,
        FormItem.s.titleTop.requiredStart.variation,
        FormItem.xs.variation,
        FormItem.xs.requiredEnd.variation,
        FormItem.xs.requiredStart.variation,
        FormItem.xs.titleStart.variation,
        FormItem.xs.titleStart.requiredEnd.variation,
        FormItem.xs.titleStart.requiredStart.variation,
        FormItem.xs.titleTop.variation,
        FormItem.xs.titleTop.requiredEnd.variation,
        FormItem.xs.titleTop.requiredStart.variation,
    ]
}

public struct FormItemVariation {
    public struct L {}
    public struct LRequiredend {}
    public struct LRequiredstart {}
    public struct LTitlestart {}
    public struct LTitlestartRequiredend {}
    public struct LTitlestartRequiredstart {}
    public struct LTitletop {}
    public struct LTitletopRequiredend {}
    public struct LTitletopRequiredstart {}
    public struct M {}
    public struct MRequiredend {}
    public struct MRequiredstart {}
    public struct MTitlestart {}
    public struct MTitlestartRequiredend {}
    public struct MTitlestartRequiredstart {}
    public struct MTitletop {}
    public struct MTitletopRequiredend {}
    public struct MTitletopRequiredstart {}
    public struct S {}
    public struct SRequiredend {}
    public struct SRequiredstart {}
    public struct STitlestart {}
    public struct STitlestartRequiredend {}
    public struct STitlestartRequiredstart {}
    public struct STitletop {}
    public struct STitletopRequiredend {}
    public struct STitletopRequiredstart {}
    public struct Xs {}
    public struct XsRequiredend {}
    public struct XsRequiredstart {}
    public struct XsTitlestart {}
    public struct XsTitlestartRequiredend {}
    public struct XsTitlestartRequiredstart {}
    public struct XsTitletop {}
    public struct XsTitletopRequiredend {}
    public struct XsTitletopRequiredstart {}
}

private extension FormItemAppearance {
    static var base: FormItemAppearance {
        var appearance = FormItemAppearance()
        appearance.captionTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.counterColor = StatefulColor(defaultValue: ColorToken.textDefaultSecondary)
        appearance.counterTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.disableAlpha = 0.4
        appearance.hintColor = StatefulColor(defaultValue: ColorToken.textDefaultSecondary)
        appearance.optionalColor = StatefulColor(defaultValue: ColorToken.textDefaultTertiary)
        appearance.titleCaptionColor = StatefulColor(defaultValue: ColorToken.textDefaultSecondary)
        appearance.titleCaptionTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titleColor = StatefulColor(defaultValue: ColorToken.textDefaultPrimary)
        appearance.titlePlacement = FormTitlePlacement.none
        return appearance
    }
}
