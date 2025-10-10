import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.L> {
    
    var innerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.LInnerlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(9.0)
        size.boxPaddingTop = CGFloat(9.0)
        size.titleBottomPadding = CGFloat(2.0)
        size.titleInnerPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "l.innerLabel",
            appearance: appearance
        )
    }
    
    var l: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.L> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(16.0)
        size.boxPaddingTop = CGFloat(16.0)
        size.endContentPadding = CGFloat(10.0)
        size.fieldHeight = CGFloat(56.0)
        size.iconActionPadding = CGFloat(10.0)
        size.iconActionSize = CGSize(width:24.0, height:24.0)

        var appearance = appearance
        appearance.size = size
        appearance.chipGroupAppearance = EmbeddedChipGroupDense.l.secondary.appearance
        appearance.textTypography = TextAreaClearTypography(l: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var outerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.LOuterlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.titleBottomPadding = CGFloat(4.0)
        size.titleInnerPadding = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "l.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:24.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "l.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:24.0)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.LInnerlabel> {
    
    var innerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.LInnerlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(9.0)
        size.boxPaddingTop = CGFloat(9.0)
        size.titleBottomPadding = CGFloat(2.0)
        size.titleInnerPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "l.innerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:24.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "l.innerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:24.0)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.LInnerlabelRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:24.0)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.LInnerlabelRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:24.0)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.LOuterlabel> {
    
    var outerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.LOuterlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.titleBottomPadding = CGFloat(4.0)
        size.titleInnerPadding = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "l.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
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
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.LOuterlabelRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.LOuterlabelRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.LRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:24.0)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.LRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:24.0)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.M> {
    
    var innerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.MInnerlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(6.0)
        size.boxPaddingTop = CGFloat(6.0)
        size.titleBottomPadding = CGFloat(2.0)
        size.titleInnerPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "m.innerLabel",
            appearance: appearance
        )
    }
    
    var m: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.M> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(12.0)
        size.boxPaddingTop = CGFloat(12.0)
        size.endContentPadding = CGFloat(8.0)
        size.fieldHeight = CGFloat(48.0)
        size.iconActionPadding = CGFloat(8.0)
        size.iconActionSize = CGSize(width:24.0, height:24.0)

        var appearance = appearance
        appearance.size = size
        appearance.chipGroupAppearance = EmbeddedChipGroupDense.m.secondary.appearance
        appearance.textTypography = TextAreaClearTypography(m: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var outerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.MOuterlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.titleBottomPadding = CGFloat(4.0)
        size.titleInnerPadding = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
    
        return .init(
            name: "m.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:20.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "m.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:20.0)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.MInnerlabel> {
    
    var innerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.MInnerlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(6.0)
        size.boxPaddingTop = CGFloat(6.0)
        size.titleBottomPadding = CGFloat(2.0)
        size.titleInnerPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "m.innerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:20.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "m.innerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:20.0)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.MInnerlabelRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:20.0)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.MInnerlabelRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:20.0)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.MOuterlabel> {
    
    var outerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.MOuterlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.titleBottomPadding = CGFloat(4.0)
        size.titleInnerPadding = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
    
        return .init(
            name: "m.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
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
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.MOuterlabelRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.MOuterlabelRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.MRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:20.0)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.MRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:20.0)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.S> {
    
    var innerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.SInnerlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(4.0)
        size.boxPaddingTop = CGFloat(4.0)
        size.titleBottomPadding = CGFloat(0.0)
        size.titleInnerPadding = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "s.innerLabel",
            appearance: appearance
        )
    }
    
    var outerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.SOuterlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.titleBottomPadding = CGFloat(4.0)
        size.titleInnerPadding = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
        return .init(
            name: "s.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:17.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "s.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:17.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "s.requiredStart",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.S> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(8.0)
        size.boxPaddingTop = CGFloat(8.0)
        size.endContentPadding = CGFloat(6.0)
        size.fieldHeight = CGFloat(40.0)
        size.iconActionPadding = CGFloat(6.0)
        size.iconActionSize = CGSize(width:24.0, height:24.0)

        var appearance = appearance
        appearance.size = size
        appearance.chipGroupAppearance = EmbeddedChipGroupDense.s.secondary.appearance
        appearance.textTypography = TextAreaClearTypography(s: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.SInnerlabel> {
    
    var innerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.SInnerlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(4.0)
        size.boxPaddingTop = CGFloat(4.0)
        size.titleBottomPadding = CGFloat(0.0)
        size.titleInnerPadding = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "s.innerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:17.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "s.innerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:17.0)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.SInnerlabelRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:17.0)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.SInnerlabelRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:17.0)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.SOuterlabel> {
    
    var outerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.SOuterlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.titleBottomPadding = CGFloat(4.0)
        size.titleInnerPadding = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
        return .init(
            name: "s.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
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
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.SOuterlabelRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.SOuterlabelRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.SRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:17.0)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.SRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:17.0)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.Xl> {
    
    var innerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.XlInnerlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(9.0)
        size.boxPaddingTop = CGFloat(9.0)
        size.titleBottomPadding = CGFloat(2.0)
        size.titleInnerPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "xl.innerLabel",
            appearance: appearance
        )
    }
    
    var outerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.XlOuterlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.titleBottomPadding = CGFloat(4.0)
        size.titleInnerPadding = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "xl.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:28.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "xl.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:28.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "xl.requiredStart",
            appearance: appearance
        )
    }
    
    var xl: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.Xl> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(21.0)
        size.boxPaddingTop = CGFloat(21.0)
        size.endContentPadding = CGFloat(10.0)
        size.fieldHeight = CGFloat(64.0)
        size.iconActionPadding = CGFloat(10.0)
        size.iconActionSize = CGSize(width:24.0, height:24.0)

        var appearance = appearance
        appearance.size = size
        appearance.chipGroupAppearance = EmbeddedChipGroupDense.l.secondary.appearance
        appearance.textTypography = TextAreaClearTypography(xl: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.XlInnerlabel> {
    
    var innerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.XlInnerlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(9.0)
        size.boxPaddingTop = CGFloat(9.0)
        size.titleBottomPadding = CGFloat(2.0)
        size.titleInnerPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "xl.innerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:28.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "xl.innerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:28.0)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.XlInnerlabelRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:28.0)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.XlInnerlabelRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:28.0)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.XlOuterlabel> {
    
    var outerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.XlOuterlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.titleBottomPadding = CGFloat(4.0)
        size.titleInnerPadding = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "xl.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
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
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.XlOuterlabelRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.XlOuterlabelRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.XlRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:28.0)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.XlRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:6.0, y:28.0)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.Xs> {
    
    var outerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.XsOuterlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(8.0)
        size.boxPaddingTop = CGFloat(8.0)
        size.titleBottomPadding = CGFloat(2.0)
        size.titleInnerPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "xs.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:13.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.right
    
        return .init(
            name: "xs.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:13.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextAreaRequiredPlacement.left
    
        return .init(
            name: "xs.requiredStart",
            appearance: appearance
        )
    }
    
    var xs: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.Xs> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(8.0)
        size.boxPaddingTop = CGFloat(8.0)
        size.endContentPadding = CGFloat(4.0)
        size.fieldHeight = CGFloat(32.0)
        size.iconActionPadding = CGFloat(4.0)
        size.iconActionSize = CGSize(width:16.0, height:16.0)

        var appearance = appearance
        appearance.size = size
        appearance.chipGroupAppearance = EmbeddedChipGroupDense.xs.secondary.appearance
        appearance.textTypography = TextAreaClearTypography(xs: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.XsOuterlabel> {
    
    var outerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.XsOuterlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(8.0)
        size.boxPaddingTop = CGFloat(8.0)
        size.titleBottomPadding = CGFloat(2.0)
        size.titleInnerPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaClearTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "xs.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
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
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.XsOuterlabelRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.XsOuterlabelRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.XsRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:13.0)
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.XsRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.indicatorOffset = CGPoint(x:4.0, y:13.0)
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


public extension ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
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
        appearance.captionColor = ColorToken.textDefaultSecondary
        appearance.captionColorFocused = ColorToken.textDefaultSecondary
        appearance.lineColor = ColorToken.surfaceDefaultTransparentTertiary
        appearance.lineColorFocused = ColorToken.surfaceDefaultAccent
        appearance.placeholderColor = ColorToken.textDefaultSecondary
        appearance.placeholderColorFocused = ColorToken.textDefaultTertiary
        appearance.startContentColor = ColorToken.textDefaultSecondary
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textColorFocused = ColorToken.textDefaultPrimary
        return appearance
    }
    
    var error: TextAreaAppearance {
        var appearance = self
        appearance.captionColor = ColorToken.textDefaultNegative
        appearance.captionColorFocused = ColorToken.textDefaultSecondary
        appearance.lineColor = ColorToken.surfaceDefaultNegative
        appearance.lineColorFocused = ColorToken.surfaceDefaultAccent
        appearance.placeholderColor = ColorToken.textDefaultNegative
        appearance.placeholderColorFocused = ColorToken.textDefaultTertiary
        appearance.startContentColor = ColorToken.textDefaultNegative
        appearance.textColor = ColorToken.textDefaultNegative
        appearance.textColorFocused = ColorToken.textDefaultPrimary
        return appearance
    }
    
    var warning: TextAreaAppearance {
        var appearance = self
        appearance.captionColor = ColorToken.textDefaultWarning
        appearance.captionColorFocused = ColorToken.textDefaultSecondary
        appearance.lineColor = ColorToken.surfaceDefaultWarning
        appearance.lineColorFocused = ColorToken.surfaceDefaultAccent
        appearance.placeholderColor = ColorToken.textDefaultWarning
        appearance.placeholderColorFocused = ColorToken.textDefaultTertiary
        appearance.startContentColor = ColorToken.textDefaultWarning
        appearance.textColor = ColorToken.textDefaultWarning
        appearance.textColorFocused = ColorToken.textDefaultPrimary
        return appearance
    }
    
}
