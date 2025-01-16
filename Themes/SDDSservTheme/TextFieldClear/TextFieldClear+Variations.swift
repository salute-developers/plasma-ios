import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.L> {
    
    var innerLabel: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.LInnerlabel> {
        var size =  TextFieldClearAnySize(size: appearance.size)
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
    
    var outerLabel: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.LOuterlabel> {
        var size =  TextFieldClearAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)
        size.titleBottomPadding = CGFloat(4.0)
        size.titleInnerPadding = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextFieldTypography(l: Typographies.bodyLNormal.typography).asContainer
        appearance.titleTypography = TextFieldTypography(l: Typographies.bodyLNormal.typography).asContainer
    
        return .init(
            name: "outerLabel",
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
    
        return .init(
            name: "requiredEnd",
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
    
        return .init(
            name: "requiredEnd",
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
    
        return .init(
            name: "requiredEnd",
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

public extension GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.M> {
    
    var innerLabel: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.MInnerlabel> {
        var size =  TextFieldClearAnySize(size: appearance.size)
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
    
    var outerLabel: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.MOuterlabel> {
        var size =  TextFieldClearAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)
        size.titleBottomPadding = CGFloat(4.0)
        size.titleInnerPadding = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextFieldTypography(m: Typographies.bodyMNormal.typography).asContainer
        appearance.titleTypography = TextFieldTypography(m: Typographies.bodyMNormal.typography).asContainer
    
        return .init(
            name: "outerLabel",
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
    
        return .init(
            name: "requiredEnd",
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
    
        return .init(
            name: "requiredEnd",
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
    
        return .init(
            name: "requiredEnd",
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

public extension GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.S> {
    
    var innerLabel: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.SInnerlabel> {
        var size =  TextFieldClearAnySize(size: appearance.size)
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
    
    var outerLabel: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.SOuterlabel> {
        var size =  TextFieldClearAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)
        size.titleBottomPadding = CGFloat(4.0)
        size.titleInnerPadding = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextFieldTypography(s: Typographies.bodySNormal.typography).asContainer
        appearance.titleTypography = TextFieldTypography(s: Typographies.bodySNormal.typography).asContainer
    
        return .init(
            name: "outerLabel",
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
    
        return .init(
            name: "requiredEnd",
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
    
        return .init(
            name: "requiredEnd",
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
    
        return .init(
            name: "requiredEnd",
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

public extension GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.Xs> {
    
    var outerLabel: GeneralAppearanceVariation<TextFieldClear, TextFieldAppearance, TextFieldClearVariation.XsOuterlabel> {
        var size =  TextFieldClearAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)
        size.titleBottomPadding = CGFloat(2.0)
        size.titleInnerPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.innerTitleTypography = TextFieldTypography(xs: Typographies.bodyXsNormal.typography).asContainer
        appearance.titleTypography = TextFieldTypography(xs: Typographies.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "outerLabel",
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
    
        return .init(
            name: "requiredEnd",
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
    
        return .init(
            name: "requiredEnd",
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
}

private extension TextFieldAppearance {
    
    var `default`: TextFieldAppearance {
        var appearance = self
        appearance.captionColor = ColorToken.textDefaultSecondary
        appearance.captionColorReadOnly = ColorToken.textDefaultSecondary
        appearance.lineColor = ColorToken.surfaceDefaultTransparentTertiary
        appearance.lineColorFocused = ColorToken.surfaceDefaultAccent
        appearance.placeholderColor = ColorToken.textDefaultSecondary
        appearance.placeholderColorFocused = ColorToken.textDefaultTertiary
        appearance.placeholderColorReadOnly = ColorToken.textDefaultSecondary
        appearance.startContentColor = ColorToken.textDefaultSecondary
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textColorFocused = ColorToken.textDefaultPrimary
        appearance.textColorReadOnly = ColorToken.textDefaultPrimary
        appearance.titleColor = ColorToken.textDefaultPrimary
        return appearance
    }
    
    var error: TextFieldAppearance {
        var appearance = self
        appearance.captionColor = ColorToken.textDefaultNegative
        appearance.captionColorReadOnly = ColorToken.textDefaultNegative
        appearance.lineColor = ColorToken.surfaceDefaultNegative
        appearance.lineColorFocused = ColorToken.surfaceDefaultAccent
        appearance.placeholderColor = ColorToken.textDefaultNegative
        appearance.placeholderColorFocused = ColorToken.textDefaultTertiary
        appearance.placeholderColorReadOnly = ColorToken.textDefaultNegative
        appearance.startContentColor = ColorToken.textDefaultNegative
        appearance.textColor = ColorToken.textDefaultNegative
        appearance.textColorFocused = ColorToken.textDefaultNegative
        appearance.textColorReadOnly = ColorToken.textDefaultNegative
        appearance.titleColor = ColorToken.textDefaultNegative
        return appearance
    }
    
    var success: TextFieldAppearance {
        var appearance = self
        appearance.captionColor = ColorToken.textDefaultPositive
        appearance.captionColorReadOnly = ColorToken.textDefaultPositive
        appearance.lineColor = ColorToken.surfaceDefaultPositive
        appearance.lineColorFocused = ColorToken.surfaceDefaultAccent
        appearance.placeholderColor = ColorToken.textDefaultPositive
        appearance.placeholderColorFocused = ColorToken.textDefaultTertiary
        appearance.placeholderColorReadOnly = ColorToken.textDefaultPositive
        appearance.startContentColor = ColorToken.textDefaultPositive
        appearance.textColor = ColorToken.textDefaultPositive
        appearance.textColorFocused = ColorToken.textDefaultPositive
        appearance.textColorReadOnly = ColorToken.textDefaultPositive
        appearance.titleColor = ColorToken.textDefaultPositive
        return appearance
    }
    
    var warning: TextFieldAppearance {
        var appearance = self
        appearance.captionColor = ColorToken.textDefaultWarning
        appearance.captionColorReadOnly = ColorToken.textDefaultWarning
        appearance.lineColor = ColorToken.surfaceDefaultWarning
        appearance.lineColorFocused = ColorToken.surfaceDefaultAccent
        appearance.placeholderColor = ColorToken.textDefaultWarning
        appearance.placeholderColorFocused = ColorToken.textDefaultTertiary
        appearance.placeholderColorReadOnly = ColorToken.textDefaultWarning
        appearance.startContentColor = ColorToken.textDefaultWarning
        appearance.textColor = ColorToken.textDefaultWarning
        appearance.textColorFocused = ColorToken.textDefaultWarning
        appearance.textColorReadOnly = ColorToken.textDefaultWarning
        appearance.titleColor = ColorToken.textDefaultWarning
        return appearance
    }
    
}
