import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.L> {
    
    var innerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.LInnerlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(12.0)
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
    
    var outerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.LOuterlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
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
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
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

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.LInnerlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
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

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.LOuterlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
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
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.M> {
    
    var innerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.MInnerlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(12.0)
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
    
    var outerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.MOuterlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
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
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
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

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.MInnerlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
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

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.MOuterlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
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
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.S> {
    
    var innerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.SInnerlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(12.0)
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
    
    var outerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.SOuterlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
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
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
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

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.SInnerlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
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

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.SOuterlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
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
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.Xs> {
    
    var outerLabel: GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XsOuterlabel> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.boxPaddingBottom = CGFloat(8.0)
        size.boxPaddingTop = CGFloat(8.0)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
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
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "requiredEnd",
            appearance: appearance
        )
    }
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
        size.iconActionSize = CGSize(width:0.0, height:0.0)
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

public extension GeneralAppearanceVariation<TextArea, TextAreaAppearance, TextAreaVariation.XsOuterlabel> {
    
    var requiredEnd: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
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
    
    var requiredStart: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        var size =  TextAreaAnySize(size: appearance.size)
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
}

private extension TextAreaAppearance {
    
    var `default`: TextAreaAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPrimary
        appearance.backgroundColorFocused = ColorToken.surfaceDefaultTransparentSecondary
        appearance.backgroundColorReadOnly = ColorToken.surfaceDefaultTransparentPrimary
        appearance.captionColor = ColorToken.textDefaultSecondary
        appearance.captionColorReadOnly = ColorToken.textDefaultSecondary
        return appearance
    }
    
    var error: TextAreaAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.backgroundColorFocused = ColorToken.surfaceDefaultTransparentSecondary
        appearance.backgroundColorReadOnly = ColorToken.surfaceDefaultTransparentNegative
        appearance.captionColor = ColorToken.textDefaultNegative
        appearance.captionColorReadOnly = ColorToken.textDefaultNegative
        return appearance
    }
    
    var warning: TextAreaAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.backgroundColorFocused = ColorToken.surfaceDefaultTransparentSecondary
        appearance.backgroundColorReadOnly = ColorToken.surfaceDefaultTransparentWarning
        appearance.captionColor = ColorToken.textDefaultWarning
        appearance.captionColorReadOnly = ColorToken.textDefaultWarning
        return appearance
    }
    
}
