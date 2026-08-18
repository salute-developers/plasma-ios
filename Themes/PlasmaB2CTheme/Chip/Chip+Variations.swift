import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.L> {
    
    var l: GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.L> {
        var size =  ChipAnySize(size: appearance.size)
        size.buttonImageSize = CGSize(width:24.0, height:24.0)
        size.contentEndPadding = CGFloat(8.0)
        size.contentStartPadding = CGFloat(8.0)
        size.cornerRadius = ShapeToken.roundM.cornerRadius
        size.height = CGFloat(48.0)
        size.iconImageSize = CGSize(width:24.0, height:24.0)
        size.leadingInset = CGFloat(16.0)
        size.trailingInset = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
        appearance.titleTypography = ChipTypography(l: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<Chip, ChipAppearance> {
        var size =  ChipAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var negative: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ChipAppearance> {
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

public extension GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.LPilled> {
    
    var pilled: ComponentAppearanceVariation<Chip, ChipAppearance> {
        var size =  ChipAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var negative: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ChipAppearance> {
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

public extension GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.M> {
    
    var m: GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.M> {
        var size =  ChipAnySize(size: appearance.size)
        size.buttonImageSize = CGSize(width:24.0, height:24.0)
        size.contentEndPadding = CGFloat(6.0)
        size.contentStartPadding = CGFloat(6.0)
        size.cornerRadius = ShapeToken.roundM.cornerRadius-2.0
        size.height = CGFloat(40.0)
        size.iconImageSize = CGSize(width:24.0, height:24.0)
        size.leadingInset = CGFloat(14.0)
        size.trailingInset = CGFloat(14.0)

        var appearance = appearance
        appearance.size = size
        appearance.titleTypography = ChipTypography(m: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<Chip, ChipAppearance> {
        var size =  ChipAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var negative: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ChipAppearance> {
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

public extension GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.MPilled> {
    
    var pilled: ComponentAppearanceVariation<Chip, ChipAppearance> {
        var size =  ChipAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var negative: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ChipAppearance> {
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

public extension GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.S> {
    
    var pilled: ComponentAppearanceVariation<Chip, ChipAppearance> {
        var size =  ChipAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.pilled",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.S> {
        var size =  ChipAnySize(size: appearance.size)
        size.buttonImageSize = CGSize(width:16.0, height:16.0)
        size.contentEndPadding = CGFloat(4.0)
        size.contentStartPadding = CGFloat(4.0)
        size.cornerRadius = ShapeToken.roundS.cornerRadius
        size.height = CGFloat(32.0)
        size.iconImageSize = CGSize(width:16.0, height:16.0)
        size.leadingInset = CGFloat(12.0)
        size.trailingInset = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
        appearance.titleTypography = ChipTypography(s: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var negative: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ChipAppearance> {
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

public extension GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.SPilled> {
    
    var pilled: ComponentAppearanceVariation<Chip, ChipAppearance> {
        var size =  ChipAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var negative: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ChipAppearance> {
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

public extension GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.Xs> {
    
    var pilled: ComponentAppearanceVariation<Chip, ChipAppearance> {
        var size =  ChipAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.pilled",
            appearance: appearance
        )
    }
    
    var xs: GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.Xs> {
        var size =  ChipAnySize(size: appearance.size)
        size.buttonImageSize = CGSize(width:12.0, height:12.0)
        size.contentEndPadding = CGFloat(2.0)
        size.contentStartPadding = CGFloat(2.0)
        size.cornerRadius = ShapeToken.roundXs.cornerRadius
        size.height = CGFloat(24.0)
        size.iconImageSize = CGSize(width:12.0, height:12.0)
        size.leadingInset = CGFloat(10.0)
        size.trailingInset = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
        appearance.titleTypography = ChipTypography(xs: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var negative: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ChipAppearance> {
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

public extension GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.XsPilled> {
    
    var pilled: ComponentAppearanceVariation<Chip, ChipAppearance> {
        var size =  ChipAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var negative: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ChipAppearance> {
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


public extension ComponentAppearanceVariation<Chip, ChipAppearance> {
    var `default`: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var negative: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ChipAppearance> {
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

private extension ChipAppearance {
    
    var `default`: ChipAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultSolidDefault), values: [
            .init(states: [InteractiveState.pressed], value: .color(.surfaceDefaultSolidDefaultActive)),
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultSolidDefaultHover))
        ])
        appearance.buttonTintColor = StatefulFillStyle(defaultValue: .color(.textInverseSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textInverseSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textInverseSecondaryHover))
        ])
        appearance.imageTintColor = StatefulFillStyle(defaultValue: .color(.textInversePrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textInversePrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        return appearance
    }
    
    var accent: ChipAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultAccent), values: [
            .init(states: [InteractiveState.pressed], value: .color(.surfaceDefaultAccentActive)),
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultAccentHover))
        ])
        appearance.buttonTintColor = StatefulFillStyle(defaultValue: .color(.textOnDarkSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textOnDarkSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textOnDarkSecondaryHover))
        ])
        appearance.imageTintColor = StatefulFillStyle(defaultValue: .color(.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        return appearance
    }
    
    var negative: ChipAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultNegative), values: [
            .init(states: [InteractiveState.pressed], value: .color(.surfaceDefaultNegativeActive)),
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultNegativeHover))
        ])
        appearance.buttonTintColor = StatefulFillStyle(defaultValue: .color(.textOnDarkSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textOnDarkSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textOnDarkSecondaryHover))
        ])
        appearance.imageTintColor = StatefulFillStyle(defaultValue: .color(.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        return appearance
    }
    
    var positive: ChipAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultPositive), values: [
            .init(states: [InteractiveState.pressed], value: .color(.surfaceDefaultPositiveActive)),
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultPositiveHover))
        ])
        appearance.buttonTintColor = StatefulFillStyle(defaultValue: .color(.textOnDarkSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textOnDarkSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textOnDarkSecondaryHover))
        ])
        appearance.imageTintColor = StatefulFillStyle(defaultValue: .color(.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        return appearance
    }
    
    var secondary: ChipAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultTransparentSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.surfaceDefaultTransparentSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultTransparentSecondaryHover))
        ])
        appearance.buttonTintColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover))
        ])
        appearance.imageTintColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        return appearance
    }
    
    var warning: ChipAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultWarning), values: [
            .init(states: [InteractiveState.pressed], value: .color(.surfaceDefaultWarningActive)),
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultWarningHover))
        ])
        appearance.buttonTintColor = StatefulFillStyle(defaultValue: .color(.textOnDarkSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textOnDarkSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textOnDarkSecondaryHover))
        ])
        appearance.imageTintColor = StatefulFillStyle(defaultValue: .color(.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        return appearance
    }
    
}

