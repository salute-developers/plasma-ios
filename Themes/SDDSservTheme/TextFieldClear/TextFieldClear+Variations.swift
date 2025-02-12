import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.L> {
    
    var innerLabel: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.LInnerlabel> {
        var size =  TextFieldClearAnySize(size: appearance.size)
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
<<<<<<< HEAD
        appearance.innerTitleTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
=======
        appearance.innerTitleTypography = TextFieldClearTypography(l: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.inner
        appearance.titleTypography = TextFieldClearTypography(l: Typographies.bodyXsNormal.typography).asContainer
>>>>>>> eae55595 (feat: added variations support in demo app)
=======
        appearance.innerTitleTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
>>>>>>> c1d5e653 (chore: added fixes)
    
        return .init(
            name: "l.innerLabel",
            appearance: appearance
        )
    }
    
    var outerLabel: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.LOuterlabel> {
        var size =  TextFieldClearAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)
        size.titleBottomPadding = CGFloat(4.0)
        size.titleInnerPadding = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
        appearance.innerTitleTypography = TextFieldClearTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextFieldClearTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
=======
        appearance.innerTitleTypography = TextFieldClearTypography(l: Typographies.bodyLNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.outer
        appearance.titleTypography = TextFieldClearTypography(l: Typographies.bodyLNormal.typography).asContainer
>>>>>>> eae55595 (feat: added variations support in demo app)
=======
        appearance.innerTitleTypography = TextFieldClearTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextFieldClearTypography(oneSize: Typographies.bodyLNormal.typography).asContainer
>>>>>>> c1d5e653 (chore: added fixes)
    
        return .init(
            name: "l.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        var size =  TextFieldClearAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorOffset = CGPoint(x:6.0, y:24.0)
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
    
    var requiredStart: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        var size =  TextFieldClearAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorOffset = CGPoint(x:6.0, y:24.0)
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

public extension GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.LInnerlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        var size =  TextFieldClearAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorOffset = CGPoint(x:6.0, y:24.0)
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
    
    var requiredStart: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        var size =  TextFieldClearAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorOffset = CGPoint(x:6.0, y:24.0)
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

public extension GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.LOuterlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        var size =  TextFieldClearAnySize(size: appearance.size)
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
    
    var requiredStart: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        var size =  TextFieldClearAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.M> {
    
    var innerLabel: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.MInnerlabel> {
        var size =  TextFieldClearAnySize(size: appearance.size)
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
<<<<<<< HEAD
        appearance.innerTitleTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
=======
        appearance.innerTitleTypography = TextFieldClearTypography(m: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.inner
        appearance.titleTypography = TextFieldClearTypography(m: Typographies.bodyXsNormal.typography).asContainer
>>>>>>> eae55595 (feat: added variations support in demo app)
=======
        appearance.innerTitleTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
>>>>>>> c1d5e653 (chore: added fixes)
    
        return .init(
            name: "m.innerLabel",
            appearance: appearance
        )
    }
    
    var outerLabel: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.MOuterlabel> {
        var size =  TextFieldClearAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)
        size.titleBottomPadding = CGFloat(4.0)
        size.titleInnerPadding = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
        appearance.innerTitleTypography = TextFieldClearTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextFieldClearTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
=======
        appearance.innerTitleTypography = TextFieldClearTypography(m: Typographies.bodyMNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.outer
        appearance.titleTypography = TextFieldClearTypography(m: Typographies.bodyMNormal.typography).asContainer
>>>>>>> eae55595 (feat: added variations support in demo app)
=======
        appearance.innerTitleTypography = TextFieldClearTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextFieldClearTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
>>>>>>> c1d5e653 (chore: added fixes)
    
        return .init(
            name: "m.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        var size =  TextFieldClearAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorOffset = CGPoint(x:6.0, y:20.0)
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
    
    var requiredStart: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        var size =  TextFieldClearAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorOffset = CGPoint(x:6.0, y:20.0)
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

public extension GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.MInnerlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        var size =  TextFieldClearAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorOffset = CGPoint(x:6.0, y:20.0)
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
    
    var requiredStart: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        var size =  TextFieldClearAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorOffset = CGPoint(x:6.0, y:20.0)
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

public extension GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.MOuterlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        var size =  TextFieldClearAnySize(size: appearance.size)
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
    
    var requiredStart: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        var size =  TextFieldClearAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.S> {
    
    var innerLabel: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.SInnerlabel> {
        var size =  TextFieldClearAnySize(size: appearance.size)
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
<<<<<<< HEAD
        appearance.innerTitleTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
=======
        appearance.innerTitleTypography = TextFieldClearTypography(s: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.inner
        appearance.titleTypography = TextFieldClearTypography(s: Typographies.bodyXsNormal.typography).asContainer
>>>>>>> eae55595 (feat: added variations support in demo app)
=======
        appearance.innerTitleTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
>>>>>>> c1d5e653 (chore: added fixes)
    
        return .init(
            name: "s.innerLabel",
            appearance: appearance
        )
    }
    
    var outerLabel: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.SOuterlabel> {
        var size =  TextFieldClearAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)
        size.titleBottomPadding = CGFloat(4.0)
        size.titleInnerPadding = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
        appearance.innerTitleTypography = TextFieldClearTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextFieldClearTypography(oneSize: Typographies.bodySNormal.typography).asContainer
=======
        appearance.innerTitleTypography = TextFieldClearTypography(s: Typographies.bodySNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.outer
        appearance.titleTypography = TextFieldClearTypography(s: Typographies.bodySNormal.typography).asContainer
>>>>>>> eae55595 (feat: added variations support in demo app)
=======
        appearance.innerTitleTypography = TextFieldClearTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextFieldClearTypography(oneSize: Typographies.bodySNormal.typography).asContainer
>>>>>>> c1d5e653 (chore: added fixes)
    
        return .init(
            name: "s.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        var size =  TextFieldClearAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorOffset = CGPoint(x:6.0, y:17.0)
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
    
    var requiredStart: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        var size =  TextFieldClearAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorOffset = CGPoint(x:6.0, y:17.0)
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

public extension GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.SInnerlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        var size =  TextFieldClearAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorOffset = CGPoint(x:6.0, y:17.0)
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
    
    var requiredStart: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        var size =  TextFieldClearAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorOffset = CGPoint(x:6.0, y:17.0)
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

public extension GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.SOuterlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        var size =  TextFieldClearAnySize(size: appearance.size)
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
    
    var requiredStart: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        var size =  TextFieldClearAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.Xs> {
    
    var outerLabel: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.XsOuterlabel> {
        var size =  TextFieldClearAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(8.0)
        size.boxPaddingTop = CGFloat(8.0)
        size.dividerHeight = CGFloat(1.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)
        size.titleBottomPadding = CGFloat(2.0)
        size.titleInnerPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
<<<<<<< HEAD
<<<<<<< HEAD
        appearance.innerTitleTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
=======
        appearance.innerTitleTypography = TextFieldClearTypography(xs: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.outer
        appearance.titleTypography = TextFieldClearTypography(xs: Typographies.bodyXsNormal.typography).asContainer
>>>>>>> eae55595 (feat: added variations support in demo app)
=======
        appearance.innerTitleTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.outer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = TextFieldClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
>>>>>>> c1d5e653 (chore: added fixes)
    
        return .init(
            name: "xs.outerLabel",
            appearance: appearance
        )
    }
    
    var requiredEnd: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        var size =  TextFieldClearAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorOffset = CGPoint(x:4.0, y:13.0)
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
    
    var requiredStart: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        var size =  TextFieldClearAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorOffset = CGPoint(x:4.0, y:13.0)
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

public extension GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.XsOuterlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        var size =  TextFieldClearAnySize(size: appearance.size)
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
    
    var requiredStart: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        var size =  TextFieldClearAnySize(size: appearance.size)
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

public extension ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
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
        appearance.lineColor = ColorToken.surfaceDefaultTransparentTertiary
        appearance.lineColorFocused = ColorToken.surfaceDefaultAccent
        appearance.placeholderColor = ColorToken.textDefaultSecondary
        appearance.placeholderColorFocused = ColorToken.textDefaultTertiary
        appearance.startContentColor = ColorToken.textDefaultSecondary
        appearance.startContentColorFocused = ColorToken.textDefaultSecondary
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textColorFocused = ColorToken.textDefaultPrimary
<<<<<<< HEAD
=======
        appearance.textColorReadOnly = ColorToken.textDefaultPrimary
>>>>>>> c1d5e653 (chore: added fixes)
        return appearance
    }
    
    var error: TextFieldAppearance {
        var appearance = self
        appearance.captionColor = ColorToken.textDefaultNegative
<<<<<<< HEAD
<<<<<<< HEAD
        appearance.captionColorFocused = ColorToken.textDefaultSecondary
=======
=======
        appearance.captionColorFocused = ColorToken.textDefaultSecondary
>>>>>>> c1d5e653 (chore: added fixes)
        appearance.captionColorReadOnly = ColorToken.textDefaultNegative
<<<<<<< HEAD
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.lineColor = ColorToken.surfaceDefaultNegative
        appearance.lineColorFocused = ColorToken.surfaceDefaultAccent
        appearance.placeholderColor = ColorToken.textDefaultNegative
        appearance.placeholderColorFocused = ColorToken.textDefaultTertiary
        appearance.startContentColor = ColorToken.textDefaultNegative
        appearance.startContentColorFocused = ColorToken.textDefaultSecondary
        appearance.textColor = ColorToken.textDefaultNegative
<<<<<<< HEAD
        appearance.textColorFocused = ColorToken.textDefaultPrimary
=======
        appearance.textColorFocused = ColorToken.textDefaultNegative
        appearance.textColorReadOnly = ColorToken.textDefaultNegative
>>>>>>> c1d5e653 (chore: added fixes)
        return appearance
    }
    
    var success: TextFieldAppearance {
        var appearance = self
        appearance.captionColor = ColorToken.textDefaultPositive
<<<<<<< HEAD
<<<<<<< HEAD
        appearance.captionColorFocused = ColorToken.textDefaultSecondary
=======
=======
        appearance.captionColorFocused = ColorToken.textDefaultSecondary
>>>>>>> c1d5e653 (chore: added fixes)
        appearance.captionColorReadOnly = ColorToken.textDefaultPositive
<<<<<<< HEAD
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.lineColor = ColorToken.surfaceDefaultPositive
        appearance.lineColorFocused = ColorToken.surfaceDefaultAccent
        appearance.placeholderColor = ColorToken.textDefaultPositive
        appearance.placeholderColorFocused = ColorToken.textDefaultTertiary
        appearance.startContentColor = ColorToken.textDefaultPositive
        appearance.startContentColorFocused = ColorToken.textDefaultSecondary
        appearance.textColor = ColorToken.textDefaultPositive
<<<<<<< HEAD
        appearance.textColorFocused = ColorToken.textDefaultPrimary
=======
        appearance.textColorFocused = ColorToken.textDefaultPositive
        appearance.textColorReadOnly = ColorToken.textDefaultPositive
>>>>>>> c1d5e653 (chore: added fixes)
        return appearance
    }
    
    var warning: TextFieldAppearance {
        var appearance = self
        appearance.captionColor = ColorToken.textDefaultWarning
<<<<<<< HEAD
<<<<<<< HEAD
        appearance.captionColorFocused = ColorToken.textDefaultSecondary
=======
=======
        appearance.captionColorFocused = ColorToken.textDefaultSecondary
>>>>>>> c1d5e653 (chore: added fixes)
        appearance.captionColorReadOnly = ColorToken.textDefaultWarning
<<<<<<< HEAD
        appearance.labelPlacement = TextFieldLabelPlacement.none
>>>>>>> 677b6f22 (chore: fixed label placement and required placement handling)
=======
>>>>>>> cb314b2b (chore: regenerated theme)
        appearance.lineColor = ColorToken.surfaceDefaultWarning
        appearance.lineColorFocused = ColorToken.surfaceDefaultAccent
        appearance.placeholderColor = ColorToken.textDefaultWarning
        appearance.placeholderColorFocused = ColorToken.textDefaultTertiary
        appearance.startContentColor = ColorToken.textDefaultWarning
        appearance.startContentColorFocused = ColorToken.textDefaultSecondary
        appearance.textColor = ColorToken.textDefaultWarning
<<<<<<< HEAD
        appearance.textColorFocused = ColorToken.textDefaultPrimary
=======
        appearance.textColorFocused = ColorToken.textDefaultWarning
        appearance.textColorReadOnly = ColorToken.textDefaultWarning
>>>>>>> c1d5e653 (chore: added fixes)
        return appearance
    }
    
}
