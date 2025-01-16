import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.L> {
    
    var innerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.LInnerlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(9.0)
        size.boxPaddingTop = CGFloat(9.0)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
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
    
    var outerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.LOuterlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
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
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorOffset = CGPoint(x:6.0, y:24.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorOffset = CGPoint(x:6.0, y:24.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredStart",
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
    
}

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.LInnerlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorOffset = CGPoint(x:6.0, y:24.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorOffset = CGPoint(x:6.0, y:24.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredStart",
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
    
}

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.LOuterlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorOffset = CGPoint(x:6.0, y:8.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredStart",
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
    
}

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.M> {
    
    var innerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.MInnerlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(6.0)
        size.boxPaddingTop = CGFloat(6.0)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
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
    
    var outerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.MOuterlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
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
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorOffset = CGPoint(x:6.0, y:20.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorOffset = CGPoint(x:6.0, y:20.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredStart",
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
    
}

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.MInnerlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorOffset = CGPoint(x:6.0, y:20.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorOffset = CGPoint(x:6.0, y:20.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredStart",
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
    
}

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.MOuterlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorOffset = CGPoint(x:6.0, y:7.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredStart",
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
    
}

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.S> {
    
    var innerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.SInnerlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(4.0)
        size.boxPaddingTop = CGFloat(4.0)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
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
    
    var outerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.SOuterlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
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
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorOffset = CGPoint(x:6.0, y:17.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorOffset = CGPoint(x:6.0, y:17.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredStart",
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
    
}

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.SInnerlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorOffset = CGPoint(x:6.0, y:17.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorOffset = CGPoint(x:6.0, y:17.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredStart",
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
    
}

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.SOuterlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorOffset = CGPoint(x:4.0, y:6.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredStart",
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
    
}

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.Xs> {
    
    var outerLabel: GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.XsOuterlabel> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(8.0)
        size.boxPaddingTop = CGFloat(8.0)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
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
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorOffset = CGPoint(x:4.0, y:13.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorOffset = CGPoint(x:4.0, y:13.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredStart",
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
    
}

public extension GeneralAppearanceVariation<TextAreaClear, TextAreaAppearance, TextAreaClearVariation.XsOuterlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorOffset = CGPoint(x:4.0, y:2.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        var size =  TextAreaClearAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorOffset = CGPoint(x:4.0, y:4.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredStart",
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
}

private extension TextAreaAppearance {
    
    var `default`: TextAreaAppearance {
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
    
    var error: TextAreaAppearance {
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
    
    var warning: TextAreaAppearance {
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
