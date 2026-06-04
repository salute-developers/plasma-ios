import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<EmbeddedChip, ChipAppearance, EmbeddedChipVariation.L> {
    
    var l: ComponentAppearanceVariation<EmbeddedChip, ChipAppearance> {
        var size =  EmbeddedChipAnySize(size: appearance.size)
        size.buttonImageSize = CGSize(width:24.0, height:24.0)
        size.contentEndPadding = CGFloat(8.0)
        size.contentStartPadding = CGFloat(8.0)
        size.cornerRadius = ShapeToken.roundM.cornerRadius-4.0
        size.height = CGFloat(44.0)
        size.iconImageSize = CGSize(width:24.0, height:24.0)
        size.leadingInset = CGFloat(14.0)
        size.trailingInset = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
        appearance.titleTypography = EmbeddedChipTypography(l: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "l",
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

public extension GeneralAppearanceVariation<EmbeddedChip, ChipAppearance, EmbeddedChipVariation.M> {
    
    var m: ComponentAppearanceVariation<EmbeddedChip, ChipAppearance> {
        var size =  EmbeddedChipAnySize(size: appearance.size)
        size.buttonImageSize = CGSize(width:24.0, height:24.0)
        size.contentEndPadding = CGFloat(6.0)
        size.contentStartPadding = CGFloat(6.0)
        size.cornerRadius = ShapeToken.roundM.cornerRadius-6.0
        size.height = CGFloat(36.0)
        size.iconImageSize = CGSize(width:24.0, height:24.0)
        size.leadingInset = CGFloat(12.0)
        size.trailingInset = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
        appearance.titleTypography = EmbeddedChipTypography(m: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
    
        return .init(
            name: "m",
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

public extension GeneralAppearanceVariation<EmbeddedChip, ChipAppearance, EmbeddedChipVariation.S> {
    
    var s: ComponentAppearanceVariation<EmbeddedChip, ChipAppearance> {
        var size =  EmbeddedChipAnySize(size: appearance.size)
        size.buttonImageSize = CGSize(width:16.0, height:16.0)
        size.contentEndPadding = CGFloat(4.0)
        size.contentStartPadding = CGFloat(4.0)
        size.cornerRadius = ShapeToken.roundM.cornerRadius-8.0
        size.height = CGFloat(28.0)
        size.iconImageSize = CGSize(width:16.0, height:16.0)
        size.leadingInset = CGFloat(10.0)
        size.trailingInset = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
        appearance.titleTypography = EmbeddedChipTypography(s: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<EmbeddedChip, ChipAppearance, EmbeddedChipVariation.Xl> {
    
    var xl: ComponentAppearanceVariation<EmbeddedChip, ChipAppearance> {
        var size =  EmbeddedChipAnySize(size: appearance.size)
        size.buttonImageSize = CGSize(width:24.0, height:24.0)
        size.contentEndPadding = CGFloat(6.0)
        size.contentStartPadding = CGFloat(6.0)
        size.cornerRadius = ShapeToken.roundM.cornerRadius-2.0
        size.height = CGFloat(52.0)
        size.iconImageSize = CGSize(width:24.0, height:24.0)
        size.leadingInset = CGFloat(16.0)
        size.trailingInset = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
        appearance.titleTypography = EmbeddedChipTypography(xl: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "xl",
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

public extension GeneralAppearanceVariation<EmbeddedChip, ChipAppearance, EmbeddedChipVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<EmbeddedChip, ChipAppearance> {
        var size =  EmbeddedChipAnySize(size: appearance.size)
        size.buttonImageSize = CGSize(width:12.0, height:12.0)
        size.contentEndPadding = CGFloat(2.0)
        size.contentStartPadding = CGFloat(2.0)
        size.cornerRadius = ShapeToken.roundS.cornerRadius-6.0
        size.height = CGFloat(20.0)
        size.iconImageSize = CGSize(width:12.0, height:12.0)
        size.leadingInset = CGFloat(6.0)
        size.trailingInset = CGFloat(6.0)

        var appearance = appearance
        appearance.size = size
        appearance.titleTypography = EmbeddedChipTypography(xs: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
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


public extension ComponentAppearanceVariation<EmbeddedChip, ChipAppearance> {
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
        appearance.backgroundColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceDefaultSolidDefault), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceDefaultSolidDefaultActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceDefaultSolidDefaultHover))
        ])
        appearance.buttonTintColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textInverseSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textInverseSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textInverseSecondaryHover))
        ])
        appearance.imageTintColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textInversePrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textInversePrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textInversePrimaryHover))
        ])
        appearance.titleColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textInversePrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textInversePrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textInversePrimaryHover))
        ])
        return appearance
    }
    
    var accent: ChipAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceDefaultAccent), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceDefaultAccentActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceDefaultAccentHover))
        ])
        appearance.buttonTintColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkSecondaryHover))
        ])
        appearance.imageTintColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkPrimaryHover))
        ])
        appearance.titleColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkPrimaryHover))
        ])
        return appearance
    }
    
    var negative: ChipAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceDefaultNegative), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceDefaultNegativeActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceDefaultNegativeHover))
        ])
        appearance.buttonTintColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkSecondaryHover))
        ])
        appearance.imageTintColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkPrimaryHover))
        ])
        appearance.titleColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkPrimaryHover))
        ])
        return appearance
    }
    
    var positive: ChipAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceDefaultPositive), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceDefaultPositiveActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceDefaultPositiveHover))
        ])
        appearance.buttonTintColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkSecondaryHover))
        ])
        appearance.imageTintColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkPrimaryHover))
        ])
        appearance.titleColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkPrimaryHover))
        ])
        return appearance
    }
    
    var secondary: ChipAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceDefaultTransparentSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceDefaultTransparentSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceDefaultTransparentSecondaryHover))
        ])
        appearance.buttonTintColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textDefaultSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textDefaultSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textDefaultSecondaryHover))
        ])
        appearance.imageTintColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textDefaultPrimaryHover))
        ])
        appearance.titleColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textDefaultPrimaryHover))
        ])
        return appearance
    }
    
    var warning: ChipAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceDefaultWarning), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.surfaceDefaultWarningActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.surfaceDefaultWarningHover))
        ])
        appearance.buttonTintColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkSecondary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkSecondaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkSecondaryHover))
        ])
        appearance.imageTintColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkPrimaryHover))
        ])
        appearance.titleColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(ColorToken.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(ColorToken.textOnDarkPrimaryHover))
        ])
        return appearance
    }
    
}
