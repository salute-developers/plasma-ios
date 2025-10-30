import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


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
        appearance.innerTitleTypography = TextFieldTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextFieldTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "l.innerLabel",
            appearance: appearance
        )
    }
    
    var l: GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.L> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.boxLeadingPadding = CGFloat(16.0)
        size.boxPaddingBottom = CGFloat(16.0)
        size.boxPaddingTop = CGFloat(16.0)
        size.boxTrailingPadding = CGFloat(16.0)
        size.cornerRadius = ShapeToken.roundM.cornerRadius+2.0
        size.dividerHeight = CGFloat(1.0)
        size.fieldHeight = CGFloat(56.0)
        size.iconActionPadding = CGFloat(10.0)
        size.iconActionSize = CGSize(width:24.0, height:24.0)
        size.iconPadding = CGFloat(6.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.textAfterTypography = TextFieldTypography(l: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.textBeforeTypography = TextFieldTypography(l: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
        appearance.textTypography = TextFieldTypography(l: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "l",
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
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.LInnerlabel> {
    
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
        appearance.innerTitleTypography = TextFieldTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextFieldTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "l.innerLabel",
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
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.LInnerlabelRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextFieldRequiredPlacement.right
    
        return .init(
            name: "l.innerLabel.requiredEnd",
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
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.LInnerlabelRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
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
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.LRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextFieldRequiredPlacement.right
    
        return .init(
            name: "l.requiredEnd",
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
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.LRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
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
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
            ],
            name: name,
            appearance: appearance
        )
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
        appearance.innerTitleTypography = TextFieldTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextFieldTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "m.innerLabel",
            appearance: appearance
        )
    }
    
    var m: GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.M> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.boxLeadingPadding = CGFloat(14.0)
        size.boxPaddingBottom = CGFloat(12.0)
        size.boxPaddingTop = CGFloat(12.0)
        size.boxTrailingPadding = CGFloat(14.0)
        size.cornerRadius = ShapeToken.roundM.cornerRadius
        size.dividerHeight = CGFloat(1.0)
        size.fieldHeight = CGFloat(48.0)
        size.iconActionPadding = CGFloat(8.0)
        size.iconActionSize = CGSize(width:24.0, height:24.0)
        size.iconPadding = CGFloat(4.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.textAfterTypography = TextFieldTypography(m: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.textBeforeTypography = TextFieldTypography(m: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.textTypography = TextFieldTypography(m: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
    
        return .init(
            name: "m",
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
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.MInnerlabel> {
    
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
        appearance.innerTitleTypography = TextFieldTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextFieldTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "m.innerLabel",
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
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.MInnerlabelRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextFieldRequiredPlacement.right
    
        return .init(
            name: "m.innerLabel.requiredEnd",
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
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.MInnerlabelRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
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
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.MRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextFieldRequiredPlacement.right
    
        return .init(
            name: "m.requiredEnd",
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
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.MRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:8.0, height:8.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
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
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
            ],
            name: name,
            appearance: appearance
        )
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
        appearance.innerTitleTypography = TextFieldTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextFieldTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "s.innerLabel",
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
        appearance.requiredPlacement = TextFieldRequiredPlacement.left
    
        return .init(
            name: "s.requiredStart",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.S> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.boxLeadingPadding = CGFloat(12.0)
        size.boxPaddingBottom = CGFloat(8.0)
        size.boxPaddingTop = CGFloat(8.0)
        size.boxTrailingPadding = CGFloat(12.0)
        size.cornerRadius = ShapeToken.roundM.cornerRadius-2.0
        size.dividerHeight = CGFloat(1.0)
        size.fieldHeight = CGFloat(40.0)
        size.iconActionPadding = CGFloat(6.0)
        size.iconActionSize = CGSize(width:24.0, height:24.0)
        size.iconPadding = CGFloat(2.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.textAfterTypography = TextFieldTypography(s: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.textBeforeTypography = TextFieldTypography(s: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.textTypography = TextFieldTypography(s: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
        return .init(
            name: "s",
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
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.SInnerlabel> {
    
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
        appearance.innerTitleTypography = TextFieldTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelPlacement = TextFieldLabelPlacement.inner
        appearance.titleColor = ColorToken.textDefaultSecondary
        appearance.titleTypography = TextFieldTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "s.innerLabel",
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
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.SInnerlabelRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextFieldRequiredPlacement.right
    
        return .init(
            name: "s.innerLabel.requiredEnd",
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
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.SInnerlabelRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
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
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.SRequiredend> {
    
    var requiredEnd: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.requiredPlacement = TextFieldRequiredPlacement.right
    
        return .init(
            name: "s.requiredEnd",
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
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TextField, TextFieldAppearance, TextFieldVariation.SRequiredstart> {
    
    var requiredStart: ComponentAppearanceVariation<TextField, TextFieldAppearance> {
        var size =  TextFieldAnySize(size: appearance.size)
        size.dividerHeight = CGFloat(1.0)
        size.indicatorSize = CGSize(width:6.0, height:6.0)
        size.textAfterTrailingPadding = CGFloat(0)
        size.textBeforeLeadingPadding = CGFloat(0)

        var appearance = appearance
        appearance.size = size
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
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
            ],
            name: name,
            appearance: appearance
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
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.error,
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension TextFieldAppearance {
    
    var `default`: TextFieldAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPrimary
        appearance.backgroundColorFocused = ColorToken.surfaceDefaultTransparentSecondary
        appearance.captionColor = ColorToken.textDefaultSecondary
        appearance.captionColorFocused = ColorToken.textDefaultSecondary
        return appearance
    }
    
    var error: TextFieldAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.backgroundColorFocused = ColorToken.surfaceDefaultTransparentSecondary
        appearance.captionColor = ColorToken.textDefaultNegative
        appearance.captionColorFocused = ColorToken.textDefaultSecondary
        return appearance
    }
    
}
