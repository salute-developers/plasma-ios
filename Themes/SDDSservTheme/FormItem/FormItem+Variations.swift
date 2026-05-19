import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.L> {
    
    var l: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.L> {
        var size =  FormItemAnySize(size: appearance.size)
        size.hintHeight = CGFloat(24.0)
        size.hintWidth = CGFloat(24.0)
        size.titleBlockPadding = CGFloat(16.0)
        size.titleCaptionPadding = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.hintIcon = Asset.infoCircleOutline24.image
        appearance.titlePlacement = FormTitlePlacement.none
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.inner
        appearance.indicatorAppearance = Indicator.m.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.none
    
        return .init(
            name: "l.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.inner
        appearance.indicatorAppearance = Indicator.m.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.none
    
        return .init(
            name: "l.requiredStart",
            appearance: appearance
        )
    }
    
    var titleStart: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.LTitlestart> {
        var size =  FormItemAnySize(size: appearance.size)
        size.hintHeight = CGFloat(16.0)
        size.hintWidth = CGFloat(16.0)
        size.titleBlockPadding = CGFloat(16.0)
        size.titleBlockWidth = CGFloat(142.0)

        var appearance = appearance
        appearance.size = size
        appearance.hintIcon = Asset.infoCircleOutline16.image
        appearance.optionalTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titlePlacement = FormTitlePlacement.start
        appearance.titleTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "l.titleStart",
            appearance: appearance
        )
    }
    
    var titleTop: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.LTitletop> {
        var size =  FormItemAnySize(size: appearance.size)
        size.hintHeight = CGFloat(16.0)
        size.hintWidth = CGFloat(16.0)
        size.titleBlockPadding = CGFloat(12.0)
        size.titleCaptionPadding = CGFloat(14.0)

        var appearance = appearance
        appearance.size = size
        appearance.hintIcon = Asset.infoCircleOutline16.image
        appearance.optionalTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titlePlacement = FormTitlePlacement.top
        appearance.titleTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "l.titleTop",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.LRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.inner
        appearance.indicatorAppearance = Indicator.m.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.none
    
        return .init(
            name: "l.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.LRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.inner
        appearance.indicatorAppearance = Indicator.m.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.none
    
        return .init(
            name: "l.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.LTitlestart> {
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.start
    
        return .init(
            name: "l.titleStart.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        size.indicatorOffset = CGPoint(x:4.0, y:0.0)
        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.centerStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.start
    
        return .init(
            name: "l.titleStart.requiredStart",
            appearance: appearance
        )
    }
    
    var titleStart: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.LTitlestart> {
        var size =  FormItemAnySize(size: appearance.size)
        size.hintHeight = CGFloat(16.0)
        size.hintWidth = CGFloat(16.0)
        size.titleBlockPadding = CGFloat(16.0)
        size.titleBlockWidth = CGFloat(142.0)

        var appearance = appearance
        appearance.size = size
        appearance.hintIcon = Asset.infoCircleOutline16.image
        appearance.optionalTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titlePlacement = FormTitlePlacement.start
        appearance.titleTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "l.titleStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.LTitlestartRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.start
    
        return .init(
            name: "l.titleStart.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.LTitlestartRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        size.indicatorOffset = CGPoint(x:4.0, y:0.0)
        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.centerStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.start
    
        return .init(
            name: "l.titleStart.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.LTitletop> {
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.top
    
        return .init(
            name: "l.titleTop.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        size.indicatorOffset = CGPoint(x:4.0, y:0.0)
        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.centerStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.top
    
        return .init(
            name: "l.titleTop.requiredStart",
            appearance: appearance
        )
    }
    
    var titleTop: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.LTitletop> {
        var size =  FormItemAnySize(size: appearance.size)
        size.hintHeight = CGFloat(16.0)
        size.hintWidth = CGFloat(16.0)
        size.titleBlockPadding = CGFloat(12.0)
        size.titleCaptionPadding = CGFloat(14.0)

        var appearance = appearance
        appearance.size = size
        appearance.hintIcon = Asset.infoCircleOutline16.image
        appearance.optionalTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titlePlacement = FormTitlePlacement.top
        appearance.titleTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "l.titleTop",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.LTitletopRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.top
    
        return .init(
            name: "l.titleTop.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.LTitletopRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        size.indicatorOffset = CGPoint(x:4.0, y:0.0)
        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.centerStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.top
    
        return .init(
            name: "l.titleTop.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.M> {
    
    var m: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.M> {
        var size =  FormItemAnySize(size: appearance.size)
        size.hintHeight = CGFloat(24.0)
        size.hintWidth = CGFloat(24.0)
        size.titleBlockPadding = CGFloat(14.0)
        size.titleCaptionPadding = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.hintIcon = Asset.infoCircleOutline24.image
        appearance.titlePlacement = FormTitlePlacement.none
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.inner
        appearance.indicatorAppearance = Indicator.m.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.none
    
        return .init(
            name: "m.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.inner
        appearance.indicatorAppearance = Indicator.m.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.none
    
        return .init(
            name: "m.requiredStart",
            appearance: appearance
        )
    }
    
    var titleStart: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.MTitlestart> {
        var size =  FormItemAnySize(size: appearance.size)
        size.hintHeight = CGFloat(16.0)
        size.hintWidth = CGFloat(16.0)
        size.titleBlockPadding = CGFloat(14.0)
        size.titleBlockWidth = CGFloat(132.0)

        var appearance = appearance
        appearance.size = size
        appearance.hintIcon = Asset.infoCircleOutline16.image
        appearance.optionalTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titlePlacement = FormTitlePlacement.start
        appearance.titleTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
    
        return .init(
            name: "m.titleStart",
            appearance: appearance
        )
    }
    
    var titleTop: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.MTitletop> {
        var size =  FormItemAnySize(size: appearance.size)
        size.hintHeight = CGFloat(16.0)
        size.hintWidth = CGFloat(16.0)
        size.titleBlockPadding = CGFloat(10.0)
        size.titleCaptionPadding = CGFloat(11.0)

        var appearance = appearance
        appearance.size = size
        appearance.hintIcon = Asset.infoCircleOutline16.image
        appearance.optionalTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titlePlacement = FormTitlePlacement.top
        appearance.titleTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
    
        return .init(
            name: "m.titleTop",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.MRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.inner
        appearance.indicatorAppearance = Indicator.m.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.none
    
        return .init(
            name: "m.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.MRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.inner
        appearance.indicatorAppearance = Indicator.m.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.none
    
        return .init(
            name: "m.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.MTitlestart> {
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.start
    
        return .init(
            name: "m.titleStart.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        size.indicatorOffset = CGPoint(x:4.0, y:0.0)
        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.centerStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.start
    
        return .init(
            name: "m.titleStart.requiredStart",
            appearance: appearance
        )
    }
    
    var titleStart: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.MTitlestart> {
        var size =  FormItemAnySize(size: appearance.size)
        size.hintHeight = CGFloat(16.0)
        size.hintWidth = CGFloat(16.0)
        size.titleBlockPadding = CGFloat(14.0)
        size.titleBlockWidth = CGFloat(132.0)

        var appearance = appearance
        appearance.size = size
        appearance.hintIcon = Asset.infoCircleOutline16.image
        appearance.optionalTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titlePlacement = FormTitlePlacement.start
        appearance.titleTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
    
        return .init(
            name: "m.titleStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.MTitlestartRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.start
    
        return .init(
            name: "m.titleStart.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.MTitlestartRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        size.indicatorOffset = CGPoint(x:4.0, y:0.0)
        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.centerStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.start
    
        return .init(
            name: "m.titleStart.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.MTitletop> {
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.top
    
        return .init(
            name: "m.titleTop.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        size.indicatorOffset = CGPoint(x:4.0, y:0.0)
        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.centerStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.top
    
        return .init(
            name: "m.titleTop.requiredStart",
            appearance: appearance
        )
    }
    
    var titleTop: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.MTitletop> {
        var size =  FormItemAnySize(size: appearance.size)
        size.hintHeight = CGFloat(16.0)
        size.hintWidth = CGFloat(16.0)
        size.titleBlockPadding = CGFloat(10.0)
        size.titleCaptionPadding = CGFloat(11.0)

        var appearance = appearance
        appearance.size = size
        appearance.hintIcon = Asset.infoCircleOutline16.image
        appearance.optionalTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titlePlacement = FormTitlePlacement.top
        appearance.titleTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
    
        return .init(
            name: "m.titleTop",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.MTitletopRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.top
    
        return .init(
            name: "m.titleTop.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.MTitletopRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        size.indicatorOffset = CGPoint(x:4.0, y:0.0)
        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.centerStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.top
    
        return .init(
            name: "m.titleTop.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.S> {
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.inner
        appearance.indicatorAppearance = Indicator.m.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.none
    
        return .init(
            name: "s.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.inner
        appearance.indicatorAppearance = Indicator.m.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.none
    
        return .init(
            name: "s.requiredStart",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.S> {
        var size =  FormItemAnySize(size: appearance.size)
        size.hintHeight = CGFloat(24.0)
        size.hintWidth = CGFloat(24.0)
        size.titleBlockPadding = CGFloat(12.0)
        size.titleCaptionPadding = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.hintIcon = Asset.infoCircleOutline24.image
        appearance.titlePlacement = FormTitlePlacement.none
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    var titleStart: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.STitlestart> {
        var size =  FormItemAnySize(size: appearance.size)
        size.hintHeight = CGFloat(14.0)
        size.hintWidth = CGFloat(16.0)
        size.titleBlockPadding = CGFloat(12.0)
        size.titleBlockWidth = CGFloat(116.0)

        var appearance = appearance
        appearance.size = size
        appearance.hintIcon = Asset.infoCircleOutline16.image
        appearance.optionalTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titlePlacement = FormTitlePlacement.start
        appearance.titleTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
        return .init(
            name: "s.titleStart",
            appearance: appearance
        )
    }
    
    var titleTop: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.STitletop> {
        var size =  FormItemAnySize(size: appearance.size)
        size.hintHeight = CGFloat(16.0)
        size.hintWidth = CGFloat(16.0)
        size.titleBlockPadding = CGFloat(8.0)
        size.titleCaptionPadding = CGFloat(9.0)

        var appearance = appearance
        appearance.size = size
        appearance.hintIcon = Asset.infoCircleOutline16.image
        appearance.optionalTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titlePlacement = FormTitlePlacement.top
        appearance.titleTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
        return .init(
            name: "s.titleTop",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.SRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.inner
        appearance.indicatorAppearance = Indicator.m.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.none
    
        return .init(
            name: "s.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.SRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.inner
        appearance.indicatorAppearance = Indicator.m.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.none
    
        return .init(
            name: "s.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.STitlestart> {
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.start
    
        return .init(
            name: "s.titleStart.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        size.indicatorOffset = CGPoint(x:4.0, y:0.0)
        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.centerStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.start
    
        return .init(
            name: "s.titleStart.requiredStart",
            appearance: appearance
        )
    }
    
    var titleStart: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.STitlestart> {
        var size =  FormItemAnySize(size: appearance.size)
        size.hintHeight = CGFloat(14.0)
        size.hintWidth = CGFloat(16.0)
        size.titleBlockPadding = CGFloat(12.0)
        size.titleBlockWidth = CGFloat(116.0)

        var appearance = appearance
        appearance.size = size
        appearance.hintIcon = Asset.infoCircleOutline16.image
        appearance.optionalTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titlePlacement = FormTitlePlacement.start
        appearance.titleTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
        return .init(
            name: "s.titleStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.STitlestartRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.start
    
        return .init(
            name: "s.titleStart.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.STitlestartRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        size.indicatorOffset = CGPoint(x:4.0, y:0.0)
        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.centerStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.start
    
        return .init(
            name: "s.titleStart.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.STitletop> {
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.top
    
        return .init(
            name: "s.titleTop.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        size.indicatorOffset = CGPoint(x:4.0, y:0.0)
        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.centerStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.top
    
        return .init(
            name: "s.titleTop.requiredStart",
            appearance: appearance
        )
    }
    
    var titleTop: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.STitletop> {
        var size =  FormItemAnySize(size: appearance.size)
        size.hintHeight = CGFloat(16.0)
        size.hintWidth = CGFloat(16.0)
        size.titleBlockPadding = CGFloat(8.0)
        size.titleCaptionPadding = CGFloat(9.0)

        var appearance = appearance
        appearance.size = size
        appearance.hintIcon = Asset.infoCircleOutline16.image
        appearance.optionalTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titlePlacement = FormTitlePlacement.top
        appearance.titleTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
        return .init(
            name: "s.titleTop",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.STitletopRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.top
    
        return .init(
            name: "s.titleTop.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.STitletopRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        size.indicatorOffset = CGPoint(x:4.0, y:0.0)
        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.centerStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.top
    
        return .init(
            name: "s.titleTop.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.Xs> {
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.inner
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.none
    
        return .init(
            name: "xs.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.inner
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.none
    
        return .init(
            name: "xs.requiredStart",
            appearance: appearance
        )
    }
    
    var titleStart: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.XsTitlestart> {
        var size =  FormItemAnySize(size: appearance.size)
        size.hintHeight = CGFloat(14.0)
        size.hintWidth = CGFloat(16.0)
        size.titleBlockPadding = CGFloat(6.0)
        size.titleBlockWidth = CGFloat(102.0)

        var appearance = appearance
        appearance.size = size
        appearance.hintIcon = Asset.infoCircleOutline16.image
        appearance.optionalTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titlePlacement = FormTitlePlacement.start
        appearance.titleTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "xs.titleStart",
            appearance: appearance
        )
    }
    
    var titleTop: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.XsTitletop> {
        var size =  FormItemAnySize(size: appearance.size)
        size.hintHeight = CGFloat(14.0)
        size.hintWidth = CGFloat(16.0)
        size.titleBlockPadding = CGFloat(6.0)
        size.titleCaptionPadding = CGFloat(6.0)

        var appearance = appearance
        appearance.size = size
        appearance.hintIcon = Asset.infoCircleOutline16.image
        appearance.optionalTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titlePlacement = FormTitlePlacement.top
        appearance.titleTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "xs.titleTop",
            appearance: appearance
        )
    }
    
    var xs: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.Xs> {
        var size =  FormItemAnySize(size: appearance.size)
        size.hintHeight = CGFloat(14.0)
        size.hintWidth = CGFloat(16.0)
        size.titleBlockPadding = CGFloat(8.0)
        size.titleCaptionPadding = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.hintIcon = Asset.infoCircleOutline16.image
        appearance.titlePlacement = FormTitlePlacement.none
    
        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.XsRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.inner
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.none
    
        return .init(
            name: "xs.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.XsRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.inner
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.none
    
        return .init(
            name: "xs.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.XsTitlestart> {
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:2.0)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.start
    
        return .init(
            name: "xs.titleStart.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        size.indicatorOffset = CGPoint(x:4.0, y:0.0)
        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.centerStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.start
    
        return .init(
            name: "xs.titleStart.requiredStart",
            appearance: appearance
        )
    }
    
    var titleStart: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.XsTitlestart> {
        var size =  FormItemAnySize(size: appearance.size)
        size.hintHeight = CGFloat(14.0)
        size.hintWidth = CGFloat(16.0)
        size.titleBlockPadding = CGFloat(6.0)
        size.titleBlockWidth = CGFloat(102.0)

        var appearance = appearance
        appearance.size = size
        appearance.hintIcon = Asset.infoCircleOutline16.image
        appearance.optionalTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titlePlacement = FormTitlePlacement.start
        appearance.titleTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "xs.titleStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.XsTitlestartRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:2.0)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.start
    
        return .init(
            name: "xs.titleStart.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.XsTitlestartRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        size.indicatorOffset = CGPoint(x:4.0, y:0.0)
        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.centerStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.start
    
        return .init(
            name: "xs.titleStart.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.XsTitletop> {
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:2.0)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.top
    
        return .init(
            name: "xs.titleTop.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        size.indicatorOffset = CGPoint(x:4.0, y:0.0)
        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.centerStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.top
    
        return .init(
            name: "xs.titleTop.requiredStart",
            appearance: appearance
        )
    }
    
    var titleTop: GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.XsTitletop> {
        var size =  FormItemAnySize(size: appearance.size)
        size.hintHeight = CGFloat(14.0)
        size.hintWidth = CGFloat(16.0)
        size.titleBlockPadding = CGFloat(6.0)
        size.titleCaptionPadding = CGFloat(6.0)

        var appearance = appearance
        appearance.size = size
        appearance.hintIcon = Asset.infoCircleOutline16.image
        appearance.optionalTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titlePlacement = FormTitlePlacement.top
        appearance.titleTypography = FormItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "xs.titleTop",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.XsTitletopRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:2.0)

        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.topEnd
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.top
    
        return .init(
            name: "xs.titleTop.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.XsTitletopRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<FormItem, FormItemAppearance> {
        var size =  FormItemAnySize(size: appearance.size)

        size.indicatorOffset = CGPoint(x:4.0, y:0.0)
        var appearance = appearance
        appearance.size = size
        appearance.formType = FormType.required
        appearance.indicatorAlignment = FormIndicatorAlignment.centerStart
        appearance.indicatorAlignmentMode = FormIndicatorAlignmentMode.outer
        appearance.indicatorAppearance = Indicator.s.negative.appearance
        appearance.titlePlacement = FormTitlePlacement.top
    
        return .init(
            name: "xs.titleTop.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<FormItem, FormItemAppearance> {
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension FormItemAppearance {
    
    var `default`: FormItemAppearance {
        var appearance = self
        appearance.captionColor = StatefulColor(defaultValue: ColorToken.textDefaultSecondary)
        return appearance
    }
    
    var negative: FormItemAppearance {
        var appearance = self
        appearance.captionColor = StatefulColor(defaultValue: ColorToken.textDefaultNegative)
        return appearance
    }
    
    var positive: FormItemAppearance {
        var appearance = self
        appearance.captionColor = StatefulColor(defaultValue: ColorToken.textDefaultPositive)
        return appearance
    }
    
    var warning: FormItemAppearance {
        var appearance = self
        appearance.captionColor = StatefulColor(defaultValue: ColorToken.textDefaultWarning)
        return appearance
    }
    
}
