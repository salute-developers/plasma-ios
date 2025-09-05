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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.LOuterlabel> {
    
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.MOuterlabel> {
    
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.SOuterlabel> {
    
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

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.XlOuterlabel> {
    
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
