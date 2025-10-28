import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.L> {
    
    var innerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.LInnerlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(12.0)
        size.boxPaddingTop = CGFloat(9.0)
        size.titleBottomPadding = CGFloat(2.0)
        size.titleInnerPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "l.innerLabel",
            appearance: appearance
        )
    }
    
    var l: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.L> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxLeadingPadding = CGFloat(16.0)
        size.boxPaddingBottom = CGFloat(12.0)
        size.boxPaddingTop = CGFloat(16.0)
        size.boxTrailingPadding = CGFloat(16.0)
        size.captionBottomPadding = CGFloat(12.0)
        size.captionTopPadding = CGFloat(12.0)
        size.cornerRadius = ShapeToken.roundM.cornerRadius+2.0
        size.endContentPadding = CGFloat(10.0)
        size.fieldHeight = CGFloat(56.0)
        size.iconActionPadding = CGFloat(10.0)
        size.iconActionSize = CGSize(width:24.0, height:24.0)

        var appearance = appearance
        appearance.size = size
        appearance.chipGroupAppearance = EmbeddedChipGroupDense.l.secondary.appearance
        appearance.textTypography = TextAreaTypography(l: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var outerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.LOuterlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.titleBottomPadding = CGFloat(12.0)
        size.titleInnerPadding = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "l.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "l.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "l.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.LInnerlabel> {
    
    var innerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.LInnerlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(12.0)
        size.boxPaddingTop = CGFloat(9.0)
        size.titleBottomPadding = CGFloat(2.0)
        size.titleInnerPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "l.innerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "l.innerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "l.innerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.LInnerlabelRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "l.innerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.LInnerlabelRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "l.innerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.LOuterlabel> {
    
    var outerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.LOuterlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.titleBottomPadding = CGFloat(12.0)
        size.titleInnerPadding = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "l.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "l.outerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:8.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "l.outerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.LOuterlabelRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "l.outerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.LOuterlabelRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:8.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "l.outerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.LRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "l.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.LRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "l.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.M> {
    
    var innerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.MInnerlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(12.0)
        size.boxPaddingTop = CGFloat(6.0)
        size.titleBottomPadding = CGFloat(2.0)
        size.titleInnerPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "m.innerLabel",
            appearance: appearance
        )
    }
    
    var m: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.M> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxLeadingPadding = CGFloat(14.0)
        size.boxPaddingBottom = CGFloat(12.0)
        size.boxPaddingTop = CGFloat(12.0)
        size.boxTrailingPadding = CGFloat(14.0)
        size.captionBottomPadding = CGFloat(12.0)
        size.captionTopPadding = CGFloat(12.0)
        size.cornerRadius = ShapeToken.roundM.cornerRadius
        size.endContentPadding = CGFloat(8.0)
        size.fieldHeight = CGFloat(48.0)
        size.iconActionPadding = CGFloat(8.0)
        size.iconActionSize = CGSize(width:24.0, height:24.0)

        var appearance = appearance
        appearance.size = size
        appearance.chipGroupAppearance = EmbeddedChipGroupDense.m.secondary.appearance
        appearance.textTypography = TextAreaTypography(m: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var outerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.MOuterlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.titleBottomPadding = CGFloat(10.0)
        size.titleInnerPadding = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
    
        return .init(
            name: "m.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "m.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "m.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.MInnerlabel> {
    
    var innerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.MInnerlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(12.0)
        size.boxPaddingTop = CGFloat(6.0)
        size.titleBottomPadding = CGFloat(2.0)
        size.titleInnerPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "m.innerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "m.innerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "m.innerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.MInnerlabelRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "m.innerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.MInnerlabelRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "m.innerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.MOuterlabel> {
    
    var outerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.MOuterlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.titleBottomPadding = CGFloat(10.0)
        size.titleInnerPadding = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
    
        return .init(
            name: "m.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "m.outerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:7.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "m.outerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.MOuterlabelRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "m.outerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.MOuterlabelRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:7.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "m.outerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.MRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "m.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.MRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "m.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.S> {
    
    var innerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.SInnerlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(12.0)
        size.boxPaddingTop = CGFloat(4.0)
        size.titleBottomPadding = CGFloat(0.0)
        size.titleInnerPadding = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "s.innerLabel",
            appearance: appearance
        )
    }
    
    var outerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.SOuterlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.titleBottomPadding = CGFloat(8.0)
        size.titleInnerPadding = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
        return .init(
            name: "s.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "s.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "s.requiredStart",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.S> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxLeadingPadding = CGFloat(12.0)
        size.boxPaddingBottom = CGFloat(12.0)
        size.boxPaddingTop = CGFloat(8.0)
        size.boxTrailingPadding = CGFloat(12.0)
        size.captionBottomPadding = CGFloat(12.0)
        size.captionTopPadding = CGFloat(12.0)
        size.cornerRadius = ShapeToken.roundM.cornerRadius-2.0
        size.endContentPadding = CGFloat(6.0)
        size.fieldHeight = CGFloat(40.0)
        size.iconActionPadding = CGFloat(6.0)
        size.iconActionSize = CGSize(width:24.0, height:24.0)

        var appearance = appearance
        appearance.size = size
        appearance.chipGroupAppearance = EmbeddedChipGroupDense.s.secondary.appearance
        appearance.textTypography = TextAreaTypography(s: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.SInnerlabel> {
    
    var innerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.SInnerlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(12.0)
        size.boxPaddingTop = CGFloat(4.0)
        size.titleBottomPadding = CGFloat(0.0)
        size.titleInnerPadding = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "s.innerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "s.innerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "s.innerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.SInnerlabelRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "s.innerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.SInnerlabelRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "s.innerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.SOuterlabel> {
    
    var outerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.SOuterlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.titleBottomPadding = CGFloat(8.0)
        size.titleInnerPadding = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
        return .init(
            name: "s.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "s.outerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:6.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "s.outerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.SOuterlabelRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "s.outerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.SOuterlabelRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:6.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "s.outerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.SRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "s.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.SRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "s.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.Xl> {
    
    var innerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XlInnerlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(12.0)
        size.boxPaddingTop = CGFloat(12.0)
        size.titleBottomPadding = CGFloat(2.0)
        size.titleInnerPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "xl.innerLabel",
            appearance: appearance
        )
    }
    
    var outerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XlOuterlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.titleBottomPadding = CGFloat(12.0)
        size.titleInnerPadding = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "xl.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "xl.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "xl.requiredStart",
            appearance: appearance
        )
    }
    
    var xl: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.Xl> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxLeadingPadding = CGFloat(20.0)
        size.boxPaddingBottom = CGFloat(12.0)
        size.boxPaddingTop = CGFloat(12.0)
        size.boxTrailingPadding = CGFloat(18.0)
        size.captionBottomPadding = CGFloat(12.0)
        size.captionTopPadding = CGFloat(12.0)
        size.cornerRadius = ShapeToken.roundL.cornerRadius
        size.endContentPadding = CGFloat(10.0)
        size.fieldHeight = CGFloat(56.0)
        size.iconActionPadding = CGFloat(10.0)
        size.iconActionSize = CGSize(width:24.0, height:24.0)

        var appearance = appearance
        appearance.size = size
        appearance.chipGroupAppearance = EmbeddedChipGroupDense.l.secondary.appearance
        appearance.textTypography = TextAreaTypography(xl: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XlInnerlabel> {
    
    var innerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XlInnerlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(12.0)
        size.boxPaddingTop = CGFloat(12.0)
        size.titleBottomPadding = CGFloat(2.0)
        size.titleInnerPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "xl.innerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "xl.innerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "xl.innerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XlInnerlabelRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "xl.innerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XlInnerlabelRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "xl.innerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XlOuterlabel> {
    
    var outerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XlOuterlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.titleBottomPadding = CGFloat(12.0)
        size.titleInnerPadding = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "xl.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "xl.outerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:8.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "xl.outerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XlOuterlabelRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "xl.outerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XlOuterlabelRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:8.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "xl.outerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XlRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "xl.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XlRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "xl.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.Xs> {
    
    var outerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XsOuterlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(8.0)
        size.boxPaddingTop = CGFloat(8.0)
        size.titleBottomPadding = CGFloat(6.0)
        size.titleInnerPadding = CGFloat(6.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "xs.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "xs.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "xs.requiredStart",
            appearance: appearance
        )
    }
    
    var xs: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.Xs> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxLeadingPadding = CGFloat(8.0)
        size.boxPaddingBottom = CGFloat(8.0)
        size.boxPaddingTop = CGFloat(8.0)
        size.boxTrailingPadding = CGFloat(8.0)
        size.captionBottomPadding = CGFloat(8.0)
        size.captionTopPadding = CGFloat(8.0)
        size.cornerRadius = ShapeToken.roundS.cornerRadius
        size.endContentPadding = CGFloat(4.0)
        size.fieldHeight = CGFloat(32.0)
        size.iconActionPadding = CGFloat(4.0)
        size.iconActionSize = CGSize(width:16.0, height:16.0)

        var appearance = appearance
        appearance.size = size
        appearance.chipGroupAppearance = EmbeddedChipGroupDense.xs.secondary.appearance
        appearance.textTypography = TextAreaTypography(xs: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XsOuterlabel> {
    
    var outerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XsOuterlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(8.0)
        size.boxPaddingTop = CGFloat(8.0)
        size.titleBottomPadding = CGFloat(6.0)
        size.titleInnerPadding = CGFloat(6.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "xs.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:2.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "xs.outerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "xs.outerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XsOuterlabelRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:2.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "xs.outerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XsOuterlabelRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "xs.outerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XsRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "xs.requiredEnd",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XsRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "xs.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
    var `default`: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextAreaAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var warning: AppearanceVariation<TextAreaAppearance> {
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
                self.error,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension TextAreaAppearance {
    
    var `default`: TextAreaAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPrimary
        appearance.backgroundColorFocused = ColorToken.surfaceDefaultTransparentSecondary
        appearance.captionColor = ColorToken.textDefaultSecondary
        appearance.captionColorFocused = ColorToken.textDefaultSecondary
        return appearance
    }
    
    var error: TextAreaAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.backgroundColorFocused = ColorToken.surfaceDefaultTransparentSecondary
        appearance.captionColor = ColorToken.textDefaultNegative
        appearance.captionColorFocused = ColorToken.textDefaultSecondary
        return appearance
    }
    
    var warning: TextAreaAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.backgroundColorFocused = ColorToken.surfaceDefaultTransparentSecondary
        appearance.captionColor = ColorToken.textDefaultWarning
        appearance.captionColorFocused = ColorToken.textDefaultSecondary
        return appearance
    }
    
}
