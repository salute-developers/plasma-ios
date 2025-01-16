import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.L> {
    
    var innerLabel: GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.LInnerlabel> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)
        size.titleBottomPadding = CGFloat(2.0)
        size.titleInnerPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextFieldTypography(l: Typographies.bodyXsNormal.typography).asContainer
        appearance.titleTypography = TextFieldTypography(l: Typographies.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "innerLabel",
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
        appearance.innerTitleTypography = TextFieldTypography(l: Typographies.bodyLNormal.typography).asContainer
        appearance.titleTypography = TextFieldTypography(l: Typographies.bodyLNormal.typography).asContainer
    
        return .init(
            name: "outerLabel",
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
    
        return .init(
            name: "requiredEnd",
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
    
        return .init(
            name: "requiredStart",
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
    
        return .init(
            name: "requiredEnd",
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
    
        return .init(
            name: "requiredStart",
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
    
        return .init(
            name: "requiredEnd",
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
    
        return .init(
            name: "requiredStart",
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
    
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.M> {
    
    var innerLabel: GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.MInnerlabel> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)
        size.titleBottomPadding = CGFloat(2.0)
        size.titleInnerPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextFieldTypography(m: Typographies.bodyXsNormal.typography).asContainer
        appearance.titleTypography = TextFieldTypography(m: Typographies.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "innerLabel",
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
        appearance.innerTitleTypography = TextFieldTypography(m: Typographies.bodyMNormal.typography).asContainer
        appearance.titleTypography = TextFieldTypography(m: Typographies.bodyMNormal.typography).asContainer
    
        return .init(
            name: "outerLabel",
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
    
        return .init(
            name: "requiredEnd",
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
    
        return .init(
            name: "requiredStart",
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
    
        return .init(
            name: "requiredEnd",
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
    
        return .init(
            name: "requiredStart",
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
    
        return .init(
            name: "requiredEnd",
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
    
        return .init(
            name: "requiredStart",
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
    
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.S> {
    
    var innerLabel: GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.SInnerlabel> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)
        size.titleBottomPadding = CGFloat(0.0)
        size.titleInnerPadding = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextFieldTypography(s: Typographies.bodyXsNormal.typography).asContainer
        appearance.titleTypography = TextFieldTypography(s: Typographies.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "innerLabel",
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
        appearance.innerTitleTypography = TextFieldTypography(s: Typographies.bodySNormal.typography).asContainer
        appearance.titleTypography = TextFieldTypography(s: Typographies.bodySNormal.typography).asContainer
    
        return .init(
            name: "outerLabel",
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
    
        return .init(
            name: "requiredEnd",
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
    
        return .init(
            name: "requiredStart",
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
    
        return .init(
            name: "requiredEnd",
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
    
        return .init(
            name: "requiredStart",
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
    
        return .init(
            name: "requiredEnd",
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
    
        return .init(
            name: "requiredStart",
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
    
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.Xs> {
    
    var outerLabel: GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.XsOuterlabel> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)
        size.titleBottomPadding = CGFloat(6.0)
        size.titleInnerPadding = CGFloat(6.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextFieldTypography(xs: Typographies.bodyXsNormal.typography).asContainer
        appearance.titleTypography = TextFieldTypography(xs: Typographies.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "outerLabel",
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
    
        return .init(
            name: "requiredEnd",
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
    
        return .init(
            name: "requiredStart",
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
    
        return .init(
            name: "requiredEnd",
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
    
        return .init(
            name: "requiredStart",
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
}

private extension TextFieldAppearance {
    
    var `default`: TextFieldAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPrimary
        appearance.backgroundColorFocused = ColorToken.surfaceDefaultTransparentSecondary
        appearance.backgroundColorReadOnly = ColorToken.surfaceDefaultTransparentPrimary
        appearance.captionColor = ColorToken.textDefaultSecondary
        appearance.captionColorReadOnly = ColorToken.textDefaultSecondary
        return appearance
    }
    
    var error: TextFieldAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.backgroundColorFocused = ColorToken.surfaceDefaultTransparentSecondary
        appearance.backgroundColorReadOnly = ColorToken.surfaceDefaultTransparentNegative
        appearance.captionColor = ColorToken.textDefaultNegative
        appearance.captionColorReadOnly = ColorToken.textDefaultNegative
        return appearance
    }
    
    var success: TextFieldAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.backgroundColorFocused = ColorToken.surfaceDefaultTransparentSecondary
        appearance.backgroundColorReadOnly = ColorToken.surfaceDefaultTransparentPositive
        appearance.captionColor = ColorToken.textDefaultPositive
        appearance.captionColorReadOnly = ColorToken.textDefaultPositive
        return appearance
    }
    
    var warning: TextFieldAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.backgroundColorFocused = ColorToken.surfaceDefaultTransparentSecondary
        appearance.backgroundColorReadOnly = ColorToken.surfaceDefaultTransparentWarning
        appearance.captionColor = ColorToken.textDefaultWarning
        appearance.captionColorReadOnly = ColorToken.textDefaultWarning
        return appearance
    }
    
}
