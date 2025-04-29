import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.L> {
    
    var innerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.LInnerlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(12.0)
        size.boxPaddingTop = CGFloat(9.0)
        size.titleBottomPadding = CGFloat(2.0)
        size.titleInnerPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextAreaTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "l.innerLabel",
            appearance: appearance
        )
    }
    
    var outerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.LOuterlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.titleBottomPadding = CGFloat(12.0)
        size.titleInnerPadding = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.LOuterlabel> {
    
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

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.M> {
    
    var innerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.MInnerlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(12.0)
        size.boxPaddingTop = CGFloat(6.0)
        size.titleBottomPadding = CGFloat(2.0)
        size.titleInnerPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextAreaTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "m.innerLabel",
            appearance: appearance
        )
    }
    
    var outerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.MOuterlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.titleBottomPadding = CGFloat(10.0)
        size.titleInnerPadding = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.MOuterlabel> {
    
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

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.S> {
    
    var innerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.SInnerlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(12.0)
        size.boxPaddingTop = CGFloat(4.0)
        size.titleBottomPadding = CGFloat(0.0)
        size.titleInnerPadding = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextAreaTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
    
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
        appearance.innerTitleTypography = TextAreaTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaTypography(oneSize: Typographies.bodySNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.SOuterlabel> {
    
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

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.Xl> {
    
    var innerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XlInnerlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(12.0)
        size.boxPaddingTop = CGFloat(12.0)
        size.titleBottomPadding = CGFloat(2.0)
        size.titleInnerPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextAreaTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
    
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
        appearance.innerTitleTypography = TextAreaTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XlOuterlabel> {
    
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

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.Xs> {
    
    var outerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XsOuterlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(8.0)
        size.boxPaddingTop = CGFloat(8.0)
        size.titleBottomPadding = CGFloat(6.0)
        size.titleInnerPadding = CGFloat(6.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextAreaTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextAreaLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextAreaTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
    
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
