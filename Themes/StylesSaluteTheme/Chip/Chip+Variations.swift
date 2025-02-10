import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.L> {
    
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
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.secondary
            ],
            name: name,
            appearance: appearance
        )
    }
}

public extension GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.M> {
    
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
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.secondary
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
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.secondary
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
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.secondary
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
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.secondary
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension ChipAppearance {
    
    var `default`: ChipAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultSolidDefault, highlightedColor: ColorToken.surfaceDefaultSolidDefaultActive, hoveredColor: ColorToken.surfaceDefaultSolidDefaultHover)
        appearance.buttonTintColor = ButtonColor(defaultColor: ColorToken.textInversePrimary, highlightedColor: ColorToken.textInversePrimaryActive, hoveredColor: ColorToken.textInversePrimaryHover)
        appearance.imageTintColor = ButtonColor(defaultColor: ColorToken.textInversePrimary, highlightedColor: ColorToken.textInversePrimaryActive, hoveredColor: ColorToken.textInversePrimaryHover)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textInversePrimary, highlightedColor: ColorToken.textInversePrimaryActive, hoveredColor: ColorToken.textInversePrimaryHover)
        return appearance
    }
    
    var accent: ChipAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultAccent, highlightedColor: ColorToken.surfaceDefaultAccentActive, hoveredColor: ColorToken.surfaceDefaultAccentHover)
        appearance.buttonTintColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover)
        appearance.imageTintColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover)
        return appearance
    }
    
    var secondary: ChipAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultTransparentSecondary, highlightedColor: ColorToken.surfaceDefaultTransparentSecondaryActive, hoveredColor: ColorToken.surfaceDefaultTransparentSecondaryHover)
        appearance.buttonTintColor = ButtonColor(defaultColor: ColorToken.textOnLightSecondary, highlightedColor: ColorToken.textOnLightSecondaryActive, hoveredColor: ColorToken.textOnLightSecondaryHover)
        appearance.imageTintColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover)
        return appearance
    }
}
