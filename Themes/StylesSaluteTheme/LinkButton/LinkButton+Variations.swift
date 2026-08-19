import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


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
        appearance.iconColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.spinnerColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        return appearance
    }
    
    var accent: ButtonAppearance {
        var appearance = self
        appearance.iconColor = StatefulFillStyle(defaultValue: .color(.textDefaultAccentMain), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultAccentMainActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultAccentMainHover))
        ])
        appearance.spinnerColor = StatefulFillStyle(defaultValue: .color(.textDefaultAccentMain), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultAccentMainActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultAccentMainHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultAccentMain), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultAccentMainActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultAccentMainHover))
        ])
        return appearance
    }
    
    var negative: ButtonAppearance {
        var appearance = self
        appearance.iconColor = StatefulFillStyle(defaultValue: .color(.textDefaultNegative), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultNegativeActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultNegativeHover))
        ])
        appearance.spinnerColor = StatefulFillStyle(defaultValue: .color(.textDefaultNegative), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultNegativeActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultNegativeHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultNegative), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultNegativeActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultNegativeHover))
        ])
        return appearance
    }
    
    var positive: ButtonAppearance {
        var appearance = self
        appearance.iconColor = StatefulFillStyle(defaultValue: .color(.textDefaultPositive), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPositiveActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPositiveHover))
        ])
        appearance.spinnerColor = StatefulFillStyle(defaultValue: .color(.textDefaultPositive), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPositiveActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPositiveHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPositive), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPositiveActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPositiveHover))
        ])
        return appearance
    }
    
    var secondary: ButtonAppearance {
        var appearance = self
        appearance.iconColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover))
        ])
        appearance.spinnerColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover))
        ])
        return appearance
    }
    
    var warning: ButtonAppearance {
        var appearance = self
        appearance.iconColor = StatefulFillStyle(defaultValue: .color(.textDefaultWarning), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultWarningActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultWarningHover))
        ])
        appearance.spinnerColor = StatefulFillStyle(defaultValue: .color(.textDefaultWarning), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultWarningActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultWarningHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultWarning), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultWarningActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultWarningHover))
        ])
        return appearance
    }
    
}

