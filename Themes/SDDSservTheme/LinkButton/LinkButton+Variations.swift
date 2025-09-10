import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<LinkButton, ButtonAppearance, LinkButtonVariation.L> {
    
    var l: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        var size =  LinkButtonAnySize(size: appearance.size)
        size.height = CGFloat(56.0)
        size.iconHorizontalGap = CGFloat(8.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        size.spinnerSize = CGSize(width:22.0, height:22.0)

        var appearance = appearance
        appearance.size = size
        appearance.titleTypography = LinkButtonTypography(l: AdaptiveTypographyToken.bodyLBold.typography).asContainer
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ButtonAppearance> {
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
                self.accent,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<LinkButton, ButtonAppearance, LinkButtonVariation.M> {
    
    var m: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        var size =  LinkButtonAnySize(size: appearance.size)
        size.height = CGFloat(48.0)
        size.iconHorizontalGap = CGFloat(6.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        size.spinnerSize = CGSize(width:22.0, height:22.0)

        var appearance = appearance
        appearance.size = size
        appearance.titleTypography = LinkButtonTypography(m: AdaptiveTypographyToken.bodyMBold.typography).asContainer
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ButtonAppearance> {
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
                self.accent,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<LinkButton, ButtonAppearance, LinkButtonVariation.S> {
    
    var s: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        var size =  LinkButtonAnySize(size: appearance.size)
        size.height = CGFloat(40.0)
        size.iconHorizontalGap = CGFloat(4.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        size.spinnerSize = CGSize(width:22.0, height:22.0)

        var appearance = appearance
        appearance.size = size
        appearance.titleTypography = LinkButtonTypography(s: AdaptiveTypographyToken.bodySBold.typography).asContainer
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ButtonAppearance> {
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
                self.accent,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<LinkButton, ButtonAppearance, LinkButtonVariation.Xl> {
    
    var xl: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        var size =  LinkButtonAnySize(size: appearance.size)
        size.height = CGFloat(64.0)
        size.iconHorizontalGap = CGFloat(8.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        size.spinnerSize = CGSize(width:24.0, height:24.0)

        var appearance = appearance
        appearance.size = size
        appearance.titleTypography = LinkButtonTypography(xl: AdaptiveTypographyToken.bodyLBold.typography).asContainer
    
        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ButtonAppearance> {
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
                self.accent,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<LinkButton, ButtonAppearance, LinkButtonVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        var size =  LinkButtonAnySize(size: appearance.size)
        size.height = CGFloat(32.0)
        size.iconHorizontalGap = CGFloat(4.0)
        size.iconSize = CGSize(width:16.0, height:16.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        size.spinnerSize = CGSize(width:16.0, height:16.0)

        var appearance = appearance
        appearance.size = size
        appearance.titleTypography = LinkButtonTypography(xs: AdaptiveTypographyToken.bodyXsBold.typography).asContainer
    
        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ButtonAppearance> {
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
                self.accent,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<LinkButton, ButtonAppearance, LinkButtonVariation.Xxs> {
    
    var xxs: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        var size =  LinkButtonAnySize(size: appearance.size)
        size.height = CGFloat(24.0)
        size.iconHorizontalGap = CGFloat(4.0)
        size.iconSize = CGSize(width:12.0, height:12.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        size.spinnerSize = CGSize(width:12.0, height:12.0)

        var appearance = appearance
        appearance.size = size
        appearance.titleTypography = LinkButtonTypography(xxs: AdaptiveTypographyToken.bodyXsBold.typography).asContainer
    
        return .init(
            name: "xxs",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ButtonAppearance> {
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
                self.accent,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
    var `default`: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ButtonAppearance> {
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
                self.accent,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension ButtonAppearance {
    
    var `default`: ButtonAppearance {
        var appearance = self
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: .clearColor)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: .clearColor)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: .clearColor)
        return appearance
    }
    
    var accent: ButtonAppearance {
        var appearance = self
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultAccent, highlightedColor: ColorToken.textDefaultAccentActive, hoveredColor: ColorToken.textDefaultAccentHover, selectedColor: .clearColor)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textDefaultAccent, highlightedColor: ColorToken.textDefaultAccentActive, hoveredColor: ColorToken.textDefaultAccentHover, selectedColor: .clearColor)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultAccent, highlightedColor: ColorToken.textDefaultAccentActive, hoveredColor: ColorToken.textDefaultAccentHover, selectedColor: .clearColor)
        return appearance
    }
    
    var negative: ButtonAppearance {
        var appearance = self
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultNegative, highlightedColor: ColorToken.textDefaultNegativeActive, hoveredColor: ColorToken.textDefaultNegativeHover, selectedColor: .clearColor)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textDefaultNegative, highlightedColor: ColorToken.textDefaultNegativeActive, hoveredColor: ColorToken.textDefaultNegativeHover, selectedColor: .clearColor)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultNegative, highlightedColor: ColorToken.textDefaultNegativeActive, hoveredColor: ColorToken.textDefaultNegativeHover, selectedColor: .clearColor)
        return appearance
    }
    
    var positive: ButtonAppearance {
        var appearance = self
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultPositive, highlightedColor: ColorToken.textDefaultPositiveActive, hoveredColor: ColorToken.textDefaultPositiveHover, selectedColor: .clearColor)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textDefaultPositive, highlightedColor: ColorToken.textDefaultPositiveActive, hoveredColor: ColorToken.textDefaultPositiveHover, selectedColor: .clearColor)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPositive, highlightedColor: ColorToken.textDefaultPositiveActive, hoveredColor: ColorToken.textDefaultPositiveHover, selectedColor: .clearColor)
        return appearance
    }
    
    var secondary: ButtonAppearance {
        var appearance = self
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondaryActive, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: .clearColor)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondaryActive, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: .clearColor)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondaryActive, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: .clearColor)
        return appearance
    }
    
    var warning: ButtonAppearance {
        var appearance = self
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultWarning, highlightedColor: ColorToken.textDefaultWarningActive, hoveredColor: ColorToken.textDefaultWarningHover, selectedColor: .clearColor)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textDefaultWarning, highlightedColor: ColorToken.textDefaultWarningActive, hoveredColor: ColorToken.textDefaultWarningHover, selectedColor: .clearColor)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultWarning, highlightedColor: ColorToken.textDefaultWarningActive, hoveredColor: ColorToken.textDefaultWarningHover, selectedColor: .clearColor)
        return appearance
    }
    
}
