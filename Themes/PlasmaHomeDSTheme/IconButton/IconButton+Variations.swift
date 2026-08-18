import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.L> {
    
    var l: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.height = CGFloat(56.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 16.0)
        size.spinnerSize = CGSize(width:22.0, height:22.0)

        var appearance = appearance
        appearance.size = size
    
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

public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.M> {
    
    var m: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.height = CGFloat(48.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 12.0, bottom: 0.0, trailing: 12.0)
        size.spinnerSize = CGSize(width:22.0, height:22.0)

        var appearance = appearance
        appearance.size = size
    
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

public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.S> {
    
    var s: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.height = CGFloat(40.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 8.0, bottom: 0.0, trailing: 8.0)
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

public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.height = CGFloat(32.0)
        size.iconSize = CGSize(width:16.0, height:16.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 8.0, bottom: 0.0, trailing: 8.0)
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
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultSolidDefault), values: [
            .init(states: [InteractiveState.pressed], value: .color(.surfaceDefaultSolidDefaultActive)),
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultSolidDefaultHover))
        ])
        appearance.iconColor = StatefulFillStyle(defaultValue: .color(.textInversePrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.spinnerColor = StatefulFillStyle(defaultValue: .color(.surfaceInverseSolidDefault), values: [
            .init(states: [InteractiveState.pressed], value: .color(.surfaceInverseSolidDefaultActive)),
            .init(states: [InteractiveState.hovered], value: .color(.surfaceInverseSolidDefaultHover))
        ])
        return appearance
    }
    
    var accent: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultAccent), values: [
            .init(states: [InteractiveState.pressed], value: .color(.surfaceDefaultAccentActive)),
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultAccentHover))
        ])
        appearance.iconColor = StatefulFillStyle(defaultValue: .color(.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.spinnerColor = StatefulFillStyle(defaultValue: .color(.surfaceOnDarkSolidDefault), values: [
            .init(states: [InteractiveState.pressed], value: .color(.surfaceOnDarkSolidDefaultActive)),
            .init(states: [InteractiveState.hovered], value: .color(.surfaceOnDarkSolidDefaultHover))
        ])
        return appearance
    }
    
    var clear: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.pressed], value: .color(.surfaceDefaultTransparentSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultTransparentSecondaryHover))
        ])
        appearance.iconColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.spinnerColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultSolidDefault), values: [
            .init(states: [InteractiveState.pressed], value: .color(.surfaceDefaultSolidDefaultActive)),
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultSolidDefaultHover))
        ])
        return appearance
    }
    
    var dark: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultSolidSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.surfaceDefaultSolidSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultSolidSecondaryHover))
        ])
        appearance.iconColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.spinnerColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultSolidDefault), values: [
            .init(states: [InteractiveState.pressed], value: .color(.surfaceDefaultSolidDefaultActive)),
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultSolidDefaultHover))
        ])
        return appearance
    }
    
    var negative: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultNegative), values: [
            .init(states: [InteractiveState.pressed], value: .color(.surfaceDefaultNegativeActive)),
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultNegativeHover))
        ])
        appearance.iconColor = StatefulFillStyle(defaultValue: .color(.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.spinnerColor = StatefulFillStyle(defaultValue: .color(.surfaceOnDarkSolidDefault), values: [
            .init(states: [InteractiveState.pressed], value: .color(.surfaceOnDarkSolidDefaultActive)),
            .init(states: [InteractiveState.hovered], value: .color(.surfaceOnDarkSolidDefaultHover))
        ])
        return appearance
    }
    
    var secondary: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultTransparentSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.surfaceDefaultTransparentSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultTransparentSecondaryHover))
        ])
        appearance.iconColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.spinnerColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultSolidDefault), values: [
            .init(states: [InteractiveState.pressed], value: .color(.surfaceDefaultSolidDefaultActive)),
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultSolidDefaultHover))
        ])
        return appearance
    }
    
    var warning: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultWarning), values: [
            .init(states: [InteractiveState.pressed], value: .color(.surfaceDefaultWarningActive)),
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultWarningHover))
        ])
        appearance.iconColor = StatefulFillStyle(defaultValue: .color(.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.spinnerColor = StatefulFillStyle(defaultValue: .color(.surfaceOnDarkSolidDefault), values: [
            .init(states: [InteractiveState.pressed], value: .color(.surfaceOnDarkSolidDefaultActive)),
            .init(states: [InteractiveState.hovered], value: .color(.surfaceOnDarkSolidDefaultHover))
        ])
        return appearance
    }
    
}

