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
        appearance.backgroundColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceDefaultSolidDefault), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceDefaultSolidDefaultActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceDefaultSolidDefaultHover))
        ])
        appearance.iconColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textInversePrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textInversePrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textInversePrimaryHover))
        ])
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceInverseSolidDefault), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceInverseSolidDefaultActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceInverseSolidDefaultHover))
        ])
        appearance.subtitleColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textInverseSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textInverseSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textInverseSecondaryHover))
        ])
        appearance.titleColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textInversePrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textInversePrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textInversePrimaryHover))
        ])
        return appearance
    }
    
    var accent: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceDefaultAccent), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceDefaultAccentActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceDefaultAccentHover))
        ])
        appearance.iconColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkPrimaryHover))
        ])
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceOnDarkSolidDefault), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceOnDarkSolidDefaultActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceOnDarkSolidDefaultHover))
        ])
        appearance.subtitleColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkSecondaryHover))
        ])
        appearance.titleColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkPrimaryHover))
        ])
        return appearance
    }
    
    var clear: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceDefaultTransparentSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceDefaultTransparentSecondaryHover))
        ])
        appearance.iconColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textDefaultPrimaryHover))
        ])
        appearance.loadingAlpha = CGFloat(0.06)
        appearance.spinnerColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceDefaultSolidDefault), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceDefaultSolidDefaultActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceDefaultSolidDefaultHover))
        ])
        appearance.subtitleColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textDefaultSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textDefaultSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textDefaultSecondaryHover))
        ])
        appearance.titleColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textDefaultPrimaryHover))
        ])
        return appearance
    }
    
    var dark: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceDefaultSolidSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceDefaultSolidSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceDefaultSolidSecondaryHover))
        ])
        appearance.iconColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textDefaultPrimaryHover))
        ])
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceDefaultSolidDefault), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceDefaultSolidDefaultActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceDefaultSolidDefaultHover))
        ])
        appearance.subtitleColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textDefaultSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textDefaultSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textDefaultSecondaryHover))
        ])
        appearance.titleColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textDefaultPrimaryHover))
        ])
        return appearance
    }
    
    var negative: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceDefaultNegative), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceDefaultNegativeActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceDefaultNegativeHover))
        ])
        appearance.iconColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkPrimaryHover))
        ])
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceOnDarkSolidDefault), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceOnDarkSolidDefaultActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceOnDarkSolidDefaultHover))
        ])
        appearance.subtitleColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkSecondaryHover))
        ])
        appearance.titleColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkPrimaryHover))
        ])
        return appearance
    }
    
    var secondary: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceDefaultTransparentSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceDefaultTransparentSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceDefaultTransparentSecondaryHover))
        ])
        appearance.iconColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textDefaultPrimaryHover))
        ])
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceDefaultSolidDefault), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceDefaultSolidDefaultActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceDefaultSolidDefaultHover))
        ])
        appearance.subtitleColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textDefaultSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textDefaultSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textDefaultSecondaryHover))
        ])
        appearance.titleColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textDefaultPrimaryHover))
        ])
        return appearance
    }
    
    var warning: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceDefaultWarning), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceDefaultWarningActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceDefaultWarningHover))
        ])
        appearance.iconColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkPrimaryHover))
        ])
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceOnDarkSolidDefault), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceOnDarkSolidDefaultActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceOnDarkSolidDefaultHover))
        ])
        appearance.subtitleColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkSecondaryHover))
        ])
        appearance.titleColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkPrimaryHover))
        ])
        return appearance
    }
    
}
