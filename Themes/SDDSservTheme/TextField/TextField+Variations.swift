import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.L> {
    
    var innerLabel: GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.LInnerlabel> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(9.0)
        size.boxPaddingTop = CGFloat(9.0)
        size.dividerHeight = CGFloat(1.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)
        size.titleBottomPadding = CGFloat(2.0)
        size.titleInnerPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
        appearance.innerTitleTypography = TextFieldTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextFieldTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
=======
        appearance.innerTitleTypography = TextFieldTypography(l: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.inner
        appearance.titleTypography = TextFieldTypography(l: Typographies.bodyXsNormal.typography).asContainer
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
    
        return .init(
            name: "l.innerLabel",
            appearance: appearance
        )
    }
    
    var outerLabel: GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.LOuterlabel> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)
        size.titleBottomPadding = CGFloat(12.0)
        size.titleInnerPadding = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
        appearance.innerTitleTypography = TextFieldTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextFieldTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
=======
        appearance.innerTitleTypography = TextFieldTypography(l: Typographies.bodyLNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.outer
        appearance.titleTypography = TextFieldTypography(l: Typographies.bodyLNormal.typography).asContainer
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
    
        return .init(
            name: "l.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
=======
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.requiredPlacement = TextFieldRequiredPlacement.right
    
        return .init(
            name: "l.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
=======
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.requiredPlacement = TextFieldRequiredPlacement.left
    
        return .init(
            name: "l.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var success: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "success",
            appearance: appearance.success
        )
    }
    var warning: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
                self.success,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
<<<<<<< HEAD
=======
    var views: [AppearanceVariation<TextFieldAppearance>] {
        [
            self.`default`,
            self.error,
            self.success,
            self.warning,
        ]
>>>>>>> b01b2af7 (chore: added fixes to demo app)
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    }
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.LInnerlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
=======
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.requiredPlacement = TextFieldRequiredPlacement.right
    
        return .init(
            name: "l.innerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
=======
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.requiredPlacement = TextFieldRequiredPlacement.left
    
        return .init(
            name: "l.innerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var success: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "success",
            appearance: appearance.success
        )
    }
    var warning: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
                self.success,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
<<<<<<< HEAD
=======
    var views: [AppearanceVariation<TextFieldAppearance>] {
        [
            self.`default`,
            self.error,
            self.success,
            self.warning,
        ]
>>>>>>> b01b2af7 (chore: added fixes to demo app)
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    }
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.LOuterlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
=======
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.requiredPlacement = TextFieldRequiredPlacement.right
    
        return .init(
            name: "l.outerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorOffset = CGPoint(x:6.0, y:8.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
=======
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.requiredPlacement = TextFieldRequiredPlacement.left
    
        return .init(
            name: "l.outerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var success: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "success",
            appearance: appearance.success
        )
    }
    var warning: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
                self.success,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
<<<<<<< HEAD
=======
    var views: [AppearanceVariation<TextFieldAppearance>] {
        [
            self.`default`,
            self.error,
            self.success,
            self.warning,
        ]
>>>>>>> b01b2af7 (chore: added fixes to demo app)
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    }
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.M> {
    
    var innerLabel: GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.MInnerlabel> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(6.0)
        size.boxPaddingTop = CGFloat(6.0)
        size.dividerHeight = CGFloat(1.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)
        size.titleBottomPadding = CGFloat(2.0)
        size.titleInnerPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
        appearance.innerTitleTypography = TextFieldTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextFieldTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
=======
        appearance.innerTitleTypography = TextFieldTypography(m: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.inner
        appearance.titleTypography = TextFieldTypography(m: Typographies.bodyXsNormal.typography).asContainer
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
    
        return .init(
            name: "m.innerLabel",
            appearance: appearance
        )
    }
    
    var outerLabel: GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.MOuterlabel> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)
        size.titleBottomPadding = CGFloat(10.0)
        size.titleInnerPadding = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
        appearance.innerTitleTypography = TextFieldTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextFieldTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
=======
        appearance.innerTitleTypography = TextFieldTypography(m: Typographies.bodyMNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.outer
        appearance.titleTypography = TextFieldTypography(m: Typographies.bodyMNormal.typography).asContainer
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
    
        return .init(
            name: "m.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
=======
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.requiredPlacement = TextFieldRequiredPlacement.right
    
        return .init(
            name: "m.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
=======
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.requiredPlacement = TextFieldRequiredPlacement.left
    
        return .init(
            name: "m.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var success: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "success",
            appearance: appearance.success
        )
    }
    var warning: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
                self.success,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
<<<<<<< HEAD
=======
    var views: [AppearanceVariation<TextFieldAppearance>] {
        [
            self.`default`,
            self.error,
            self.success,
            self.warning,
        ]
>>>>>>> b01b2af7 (chore: added fixes to demo app)
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    }
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.MInnerlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
=======
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.requiredPlacement = TextFieldRequiredPlacement.right
    
        return .init(
            name: "m.innerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
=======
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.requiredPlacement = TextFieldRequiredPlacement.left
    
        return .init(
            name: "m.innerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var success: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "success",
            appearance: appearance.success
        )
    }
    var warning: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
                self.success,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
<<<<<<< HEAD
=======
    var views: [AppearanceVariation<TextFieldAppearance>] {
        [
            self.`default`,
            self.error,
            self.success,
            self.warning,
        ]
>>>>>>> b01b2af7 (chore: added fixes to demo app)
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    }
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.MOuterlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
=======
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.requiredPlacement = TextFieldRequiredPlacement.right
    
        return .init(
            name: "m.outerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorOffset = CGPoint(x:6.0, y:7.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
=======
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.requiredPlacement = TextFieldRequiredPlacement.left
    
        return .init(
            name: "m.outerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var success: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "success",
            appearance: appearance.success
        )
    }
    var warning: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
                self.success,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
<<<<<<< HEAD
=======
    var views: [AppearanceVariation<TextFieldAppearance>] {
        [
            self.`default`,
            self.error,
            self.success,
            self.warning,
        ]
>>>>>>> b01b2af7 (chore: added fixes to demo app)
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    }
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.S> {
    
    var innerLabel: GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.SInnerlabel> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(4.0)
        size.boxPaddingTop = CGFloat(4.0)
        size.dividerHeight = CGFloat(1.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)
        size.titleBottomPadding = CGFloat(0.0)
        size.titleInnerPadding = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
        appearance.innerTitleTypography = TextFieldTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextFieldTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
=======
        appearance.innerTitleTypography = TextFieldTypography(s: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.inner
        appearance.titleTypography = TextFieldTypography(s: Typographies.bodyXsNormal.typography).asContainer
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
    
        return .init(
            name: "s.innerLabel",
            appearance: appearance
        )
    }
    
    var outerLabel: GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.SOuterlabel> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)
        size.titleBottomPadding = CGFloat(8.0)
        size.titleInnerPadding = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
        appearance.innerTitleTypography = TextFieldTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextFieldTypography(oneSize: Typographies.bodySNormal.typography).asContainer
=======
        appearance.innerTitleTypography = TextFieldTypography(s: Typographies.bodySNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.outer
        appearance.titleTypography = TextFieldTypography(s: Typographies.bodySNormal.typography).asContainer
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
    
        return .init(
            name: "s.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
=======
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.requiredPlacement = TextFieldRequiredPlacement.right
    
        return .init(
            name: "s.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
=======
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.requiredPlacement = TextFieldRequiredPlacement.left
    
        return .init(
            name: "s.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var success: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "success",
            appearance: appearance.success
        )
    }
    var warning: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
                self.success,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
<<<<<<< HEAD
=======
    var views: [AppearanceVariation<TextFieldAppearance>] {
        [
            self.`default`,
            self.error,
            self.success,
            self.warning,
        ]
>>>>>>> b01b2af7 (chore: added fixes to demo app)
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    }
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.SInnerlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
=======
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.requiredPlacement = TextFieldRequiredPlacement.right
    
        return .init(
            name: "s.innerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
=======
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.requiredPlacement = TextFieldRequiredPlacement.left
    
        return .init(
            name: "s.innerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var success: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "success",
            appearance: appearance.success
        )
    }
    var warning: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
                self.success,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
<<<<<<< HEAD
=======
    var views: [AppearanceVariation<TextFieldAppearance>] {
        [
            self.`default`,
            self.error,
            self.success,
            self.warning,
        ]
>>>>>>> b01b2af7 (chore: added fixes to demo app)
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    }
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.SOuterlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
=======
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.requiredPlacement = TextFieldRequiredPlacement.right
    
        return .init(
            name: "s.outerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorOffset = CGPoint(x:4.0, y:6.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
=======
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.requiredPlacement = TextFieldRequiredPlacement.left
    
        return .init(
            name: "s.outerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var success: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "success",
            appearance: appearance.success
        )
    }
    var warning: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
                self.success,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
<<<<<<< HEAD
=======
    var views: [AppearanceVariation<TextFieldAppearance>] {
        [
            self.`default`,
            self.error,
            self.success,
            self.warning,
        ]
>>>>>>> b01b2af7 (chore: added fixes to demo app)
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    }
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.Xs> {
    
    var outerLabel: GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.XsOuterlabel> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(8.0)
        size.boxPaddingTop = CGFloat(8.0)
        size.dividerHeight = CGFloat(1.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)
        size.titleBottomPadding = CGFloat(6.0)
        size.titleInnerPadding = CGFloat(6.0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
        appearance.innerTitleTypography = TextFieldTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextFieldTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
=======
        appearance.innerTitleTypography = TextFieldTypography(xs: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.outer
        appearance.titleTypography = TextFieldTypography(xs: Typographies.bodyXsNormal.typography).asContainer
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
    
        return .init(
            name: "xs.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
=======
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.requiredPlacement = TextFieldRequiredPlacement.right
    
        return .init(
            name: "xs.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
=======
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.requiredPlacement = TextFieldRequiredPlacement.left
    
        return .init(
            name: "xs.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var success: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "success",
            appearance: appearance.success
        )
    }
    var warning: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
                self.success,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
<<<<<<< HEAD
=======
    var views: [AppearanceVariation<TextFieldAppearance>] {
        [
            self.`default`,
            self.error,
            self.success,
            self.warning,
        ]
>>>>>>> b01b2af7 (chore: added fixes to demo app)
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    }
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.XsOuterlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorOffset = CGPoint(x:4.0, y:2.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
=======
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.requiredPlacement = TextFieldRequiredPlacement.right
    
        return .init(
            name: "xs.outerLabel.requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
=======
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.requiredPlacement = TextFieldRequiredPlacement.left
    
        return .init(
            name: "xs.outerLabel.requiredStart",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var success: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "success",
            appearance: appearance.success
        )
    }
    var warning: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
                self.success,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
<<<<<<< HEAD
=======
    var views: [AppearanceVariation<TextFieldAppearance>] {
        [
            self.`default`,
            self.error,
            self.success,
            self.warning,
        ]
>>>>>>> b01b2af7 (chore: added fixes to demo app)
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    }
}

public extension ComponentAppearanceVariation<TextField, TextFieldAppearance> {
    var `default`: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var error: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "error",
            appearance: appearance.error
        )
    }
    var success: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "success",
            appearance: appearance.success
        )
    }
    var warning: AppearanceVariation<TextFieldAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
                self.success,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
<<<<<<< HEAD
=======
    var views: [AppearanceVariation<TextFieldAppearance>] {
        [
            self.`default`,
            self.error,
            self.success,
            self.warning,
        ]
>>>>>>> b01b2af7 (chore: added fixes to demo app)
=======
>>>>>>> eae55595 (feat: added variations support in demo app)
    }
}

private extension TextFieldAppearance {
    
    var `default`: TextFieldAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPrimary
        appearance.backgroundColorFocused = ColorToken.surfaceDefaultTransparentSecondary
        appearance.captionColor = ColorToken.textDefaultSecondary
<<<<<<< HEAD
        appearance.captionColorFocused = ColorToken.textDefaultSecondary
=======
        appearance.captionColorReadOnly = ColorToken.textDefaultSecondary
<<<<<<< HEAD
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        return appearance
    }
    
    var error: TextFieldAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.backgroundColorFocused = ColorToken.surfaceDefaultTransparentSecondary
        appearance.captionColor = ColorToken.textDefaultNegative
<<<<<<< HEAD
        appearance.captionColorFocused = ColorToken.textDefaultSecondary
=======
        appearance.captionColorReadOnly = ColorToken.textDefaultNegative
<<<<<<< HEAD
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        return appearance
    }
    
    var success: TextFieldAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.backgroundColorFocused = ColorToken.surfaceDefaultTransparentSecondary
        appearance.captionColor = ColorToken.textDefaultPositive
<<<<<<< HEAD
        appearance.captionColorFocused = ColorToken.textDefaultSecondary
=======
        appearance.captionColorReadOnly = ColorToken.textDefaultPositive
<<<<<<< HEAD
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        return appearance
    }
    
    var warning: TextFieldAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.backgroundColorFocused = ColorToken.surfaceDefaultTransparentSecondary
        appearance.captionColor = ColorToken.textDefaultWarning
<<<<<<< HEAD
        appearance.captionColorFocused = ColorToken.textDefaultSecondary
=======
        appearance.captionColorReadOnly = ColorToken.textDefaultWarning
<<<<<<< HEAD
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        return appearance
    }
    
}
