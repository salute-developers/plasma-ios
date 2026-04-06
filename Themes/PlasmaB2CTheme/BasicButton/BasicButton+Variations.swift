import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<BasicButton, ButtonAppearance, BasicButtonVariation.L> {
    
    var l: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        var size =  BasicButtonAnySize(size: appearance.size)
        size.height = CGFloat(56.0)
        size.iconHorizontalGap = CGFloat(8.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 24.0, bottom: 0.0, trailing: 24.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
        size.spinnerSize = CGSize(width:22.0, height:22.0)
        size.titleHorizontalGap = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.subtitleTypography = BasicButtonTypography(l: AdaptiveTypographyToken.bodyLBold.typography).asContainer
        appearance.titleTypography = BasicButtonTypography(l: AdaptiveTypographyToken.bodyLBold.typography).asContainer
    
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
    var black: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
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
    var white: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "white",
            appearance: appearance.white
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.black,
                self.clear,
                self.dark,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
                self.white,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<BasicButton, ButtonAppearance, BasicButtonVariation.M> {
    
    var m: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        var size =  BasicButtonAnySize(size: appearance.size)
        size.height = CGFloat(48.0)
        size.iconHorizontalGap = CGFloat(6.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
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
    var black: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
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
    var white: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "white",
            appearance: appearance.white
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.black,
                self.clear,
                self.dark,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
                self.white,
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
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
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
    var black: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
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
    var white: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "white",
            appearance: appearance.white
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.black,
                self.clear,
                self.dark,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
                self.white,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<BasicButton, ButtonAppearance, BasicButtonVariation.Xl> {
    
    var xl: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        var size =  BasicButtonAnySize(size: appearance.size)
        size.height = CGFloat(64.0)
        size.iconHorizontalGap = CGFloat(8.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 28.0, bottom: 0.0, trailing: 28.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer
        size.spinnerSize = CGSize(width:24.0, height:24.0)
        size.titleHorizontalGap = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.subtitleTypography = BasicButtonTypography(xl: AdaptiveTypographyToken.bodyLBold.typography).asContainer
        appearance.titleTypography = BasicButtonTypography(xl: AdaptiveTypographyToken.bodyLBold.typography).asContainer
    
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
    var black: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
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
    var white: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "white",
            appearance: appearance.white
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.black,
                self.clear,
                self.dark,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
                self.white,
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
    var black: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
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
    var white: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "white",
            appearance: appearance.white
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.black,
                self.clear,
                self.dark,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
                self.white,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<BasicButton, ButtonAppearance, BasicButtonVariation.Xxs> {
    
    var xxs: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        var size =  BasicButtonAnySize(size: appearance.size)
        size.height = CGFloat(24.0)
        size.iconHorizontalGap = CGFloat(4.0)
        size.iconSize = CGSize(width:12.0, height:12.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 10.0, bottom: 0.0, trailing: 10.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXs.cornerRadius) as PathDrawer
        size.spinnerSize = CGSize(width:12.0, height:12.0)
        size.titleHorizontalGap = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.subtitleTypography = BasicButtonTypography(xxs: AdaptiveTypographyToken.bodyXsBold.typography).asContainer
        appearance.titleTypography = BasicButtonTypography(xxs: AdaptiveTypographyToken.bodyXsBold.typography).asContainer
    
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
    var black: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
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
    var white: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "white",
            appearance: appearance.white
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.black,
                self.clear,
                self.dark,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
                self.white,
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
    var black: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
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
    var white: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "white",
            appearance: appearance.white
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.black,
                self.clear,
                self.dark,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
                self.white,
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
        appearance.spinnerColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textInversePrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textInversePrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textInversePrimaryHover)
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
        appearance.spinnerColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textOnDarkPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
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
    
    var black: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceOnLightSolidDefault, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.surfaceOnLightSolidDefaultActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceOnLightSolidDefaultHover)
        ]))
        appearance.iconColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textOnDarkPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textOnDarkPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
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
        appearance.spinnerColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textDefaultPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover)
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
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceOnLightTransparentDeep, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.surfaceOnLightTransparentDeepActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceOnLightTransparentDeepHover)
        ]))
        appearance.iconColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textOnDarkPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textOnDarkPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
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
        appearance.spinnerColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textOnDarkPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
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
    
    var positive: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultPositive, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.surfaceDefaultPositiveActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultPositiveHover)
        ]))
        appearance.iconColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textOnDarkPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textOnDarkPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
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
        appearance.spinnerColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textDefaultPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover)
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
        appearance.spinnerColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textOnDarkPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
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
    
    var white: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceOnDarkSolidDefault, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.surfaceOnDarkSolidDefaultActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceOnDarkSolidDefaultHover)
        ]))
        appearance.iconColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textOnLightPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textOnLightPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textOnLightPrimaryHover)
        ]))
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textOnLightPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textOnLightPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textOnLightPrimaryHover)
        ]))
        appearance.subtitleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textOnLightSecondary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textOnLightSecondaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textOnLightSecondaryHover)
        ]))
        appearance.titleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textOnLightPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textOnLightPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textOnLightPrimaryHover)
        ]))
        return appearance
    }
    
}
