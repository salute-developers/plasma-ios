import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<BasicButton, ButtonAppearance, BasicButtonVariation.M> {
    
    var m: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        var size =  BasicButtonAnySize(size: appearance.size)
        size.height = CGFloat(48.0)
        size.iconHorizontalGap = CGFloat(6.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer
        size.spinnerSize = CGSize(width:22.0, height:22.0)
        size.titleHorizontalGap = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.subtitleTypography = BasicButtonTypography(m: AdaptiveTypographyToken.bodyMBold.typography).asContainer
        appearance.titleTypography = BasicButtonTypography(m: AdaptiveTypographyToken.bodyMBold.typography).asContainer
    
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
    var clear: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "clear",
            appearance: appearance.clear
        )
    }
    var dark: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
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
                self.clear,
                self.dark,
                self.negative,
                self.secondary,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<BasicButton, ButtonAppearance, BasicButtonVariation.S> {
    
    var s: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        var size =  BasicButtonAnySize(size: appearance.size)
        size.height = CGFloat(40.0)
        size.iconHorizontalGap = CGFloat(4.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 16.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.spinnerSize = CGSize(width:22.0, height:22.0)
        size.titleHorizontalGap = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.subtitleTypography = BasicButtonTypography(s: AdaptiveTypographyToken.bodySBold.typography).asContainer
        appearance.titleTypography = BasicButtonTypography(s: AdaptiveTypographyToken.bodySBold.typography).asContainer
    
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
    var clear: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "clear",
            appearance: appearance.clear
        )
    }
    var dark: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
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
                self.clear,
                self.dark,
                self.negative,
                self.secondary,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<BasicButton, ButtonAppearance, BasicButtonVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        var size =  BasicButtonAnySize(size: appearance.size)
        size.height = CGFloat(32.0)
        size.iconHorizontalGap = CGFloat(4.0)
        size.iconSize = CGSize(width:16.0, height:16.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 12.0, bottom: 0.0, trailing: 12.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
        size.spinnerSize = CGSize(width:16.0, height:16.0)
        size.titleHorizontalGap = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.subtitleTypography = BasicButtonTypography(xs: AdaptiveTypographyToken.bodyXsBold.typography).asContainer
        appearance.titleTypography = BasicButtonTypography(xs: AdaptiveTypographyToken.bodyXsBold.typography).asContainer
    
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
    var clear: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "clear",
            appearance: appearance.clear
        )
    }
    var dark: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
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
                self.clear,
                self.dark,
                self.negative,
                self.secondary,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
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
    var clear: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "clear",
            appearance: appearance.clear
        )
    }
    var dark: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
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
                self.clear,
                self.dark,
                self.negative,
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
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultSolidDefault, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.surfaceDefaultSolidDefaultActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultSolidDefaultHover)
        ]))
        appearance.iconColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textInversePrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textInversePrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textInversePrimaryHover)
        ]))
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceInverseSolidDefault, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.surfaceInverseSolidDefaultActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceInverseSolidDefaultHover)
        ]))
        appearance.subtitleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textInverseSecondary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textInverseSecondaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textInverseSecondaryHover)
        ]))
        appearance.titleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textInversePrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textInversePrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textInversePrimaryHover)
        ]))
        return appearance
    }
    
    var accent: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultAccent, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.surfaceDefaultAccentActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultAccentHover)
        ]))
        appearance.iconColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textOnDarkPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceOnDarkSolidDefault, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.surfaceOnDarkSolidDefaultActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceOnDarkSolidDefaultHover)
        ]))
        appearance.subtitleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textOnDarkSecondary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textOnDarkSecondaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textOnDarkSecondaryHover)
        ]))
        appearance.titleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textOnDarkPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        return appearance
    }
    
    var clear: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultClear, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.surfaceDefaultTransparentSecondaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultTransparentSecondaryHover)
        ]))
        appearance.iconColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textDefaultPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover)
        ]))
        appearance.loadingAlpha = CGFloat(0.06)
        appearance.spinnerColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultSolidDefault, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.surfaceDefaultSolidDefaultActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultSolidDefaultHover)
        ]))
        appearance.subtitleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultSecondary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textDefaultSecondaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultSecondaryHover)
        ]))
        appearance.titleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textDefaultPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover)
        ]))
        return appearance
    }
    
    var dark: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultSolidSecondary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.surfaceDefaultSolidSecondaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultSolidSecondaryHover)
        ]))
        appearance.iconColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textDefaultPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover)
        ]))
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultSolidDefault, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.surfaceDefaultSolidDefaultActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultSolidDefaultHover)
        ]))
        appearance.subtitleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultSecondary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textDefaultSecondaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultSecondaryHover)
        ]))
        appearance.titleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textDefaultPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover)
        ]))
        return appearance
    }
    
    var negative: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultNegative, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.surfaceDefaultNegativeActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultNegativeHover)
        ]))
        appearance.iconColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textOnDarkPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceOnDarkSolidDefault, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.surfaceOnDarkSolidDefaultActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceOnDarkSolidDefaultHover)
        ]))
        appearance.subtitleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textOnDarkSecondary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textOnDarkSecondaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textOnDarkSecondaryHover)
        ]))
        appearance.titleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textOnDarkPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        return appearance
    }
    
    var secondary: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultTransparentSecondary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.surfaceDefaultTransparentSecondaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultTransparentSecondaryHover)
        ]))
        appearance.iconColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textDefaultPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover)
        ]))
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultSolidDefault, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.surfaceDefaultSolidDefaultActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultSolidDefaultHover)
        ]))
        appearance.subtitleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultSecondary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textDefaultSecondaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultSecondaryHover)
        ]))
        appearance.titleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textDefaultPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover)
        ]))
        return appearance
    }
    
    var warning: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultWarning, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.surfaceDefaultWarningActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultWarningHover)
        ]))
        appearance.iconColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textOnDarkPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceOnDarkSolidDefault, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.surfaceOnDarkSolidDefaultActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceOnDarkSolidDefaultHover)
        ]))
        appearance.subtitleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textOnDarkSecondary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textOnDarkSecondaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textOnDarkSecondaryHover)
        ]))
        appearance.titleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textOnDarkPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        return appearance
    }
    
}
