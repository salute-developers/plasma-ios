import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.L> {
    
    var l: GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.L> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.height = CGFloat(56.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 16.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
        size.spinnerSize = CGSize(width:22.0, height:22.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.pathDrawer = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.pilled",
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

public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.LPilled> {
    
    var pilled: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.pathDrawer = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.pilled",
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

public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.M> {
    
    var m: GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.M> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.height = CGFloat(48.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 12.0, bottom: 0.0, trailing: 12.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.spinnerSize = CGSize(width:22.0, height:22.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.pathDrawer = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.pilled",
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

public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.MPilled> {
    
    var pilled: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.pathDrawer = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.pilled",
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

public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.S> {
    
    var pilled: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.pathDrawer = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.pilled",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.S> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.height = CGFloat(40.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 8.0, bottom: 0.0, trailing: 8.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
        size.spinnerSize = CGSize(width:22.0, height:22.0)

        var appearance = appearance
        appearance.size = size
    
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

public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.SPilled> {
    
    var pilled: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.pathDrawer = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.pilled",
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

public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.Xs> {
    
    var pilled: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.pathDrawer = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.pilled",
            appearance: appearance
        )
    }
    
    var xs: GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.Xs> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.height = CGFloat(32.0)
        size.iconSize = CGSize(width:16.0, height:16.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 8.0, bottom: 0.0, trailing: 8.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
        size.spinnerSize = CGSize(width:16.0, height:16.0)

        var appearance = appearance
        appearance.size = size
    
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

public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.XsPilled> {
    
    var pilled: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.pathDrawer = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.pilled",
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


public extension ComponentAppearanceVariation<IconButton, ButtonAppearance> {
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
        appearance.backgroundColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceDefaultSolidDefault), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceDefaultSolidDefaultActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceDefaultSolidDefaultHover))
        ])
        appearance.iconColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textInversePrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textInversePrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textInversePrimaryHover))
        ])
        appearance.spinnerColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textInversePrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textInversePrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textInversePrimaryHover))
        ])
        return appearance
    }
    
    var accent: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceDefaultAccentMain), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceDefaultAccentMainActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceDefaultAccentMainHover))
        ])
        appearance.iconColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkPrimaryHover))
        ])
        appearance.spinnerColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkPrimaryHover))
        ])
        return appearance
    }
    
    var black: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceOnLightSolidDefault), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceOnLightSolidDefaultActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceOnLightSolidDefaultHover))
        ])
        appearance.iconColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkPrimaryHover))
        ])
        appearance.spinnerColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
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
        appearance.spinnerColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textDefaultPrimaryHover))
        ])
        return appearance
    }
    
    var dark: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceOnLightTransparentDeep), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceOnLightTransparentDeepActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceOnLightTransparentDeepHover))
        ])
        appearance.iconColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkPrimaryHover))
        ])
        appearance.spinnerColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkPrimaryHover))
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
        appearance.spinnerColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkPrimaryHover))
        ])
        return appearance
    }
    
    var positive: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceDefaultPositive), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceDefaultPositiveActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceDefaultPositiveHover))
        ])
        appearance.iconColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkPrimaryHover))
        ])
        appearance.spinnerColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
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
        appearance.spinnerColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textDefaultPrimary), values: [
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
        appearance.spinnerColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkPrimaryHover))
        ])
        return appearance
    }
    
    var white: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceOnDarkSolidDefault), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceOnDarkSolidDefaultActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceOnDarkSolidDefaultHover))
        ])
        appearance.iconColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnLightPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnLightPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnLightPrimaryHover))
        ])
        appearance.spinnerColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnLightPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnLightPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnLightPrimaryHover))
        ])
        return appearance
    }
    
}
