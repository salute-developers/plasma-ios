import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore



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
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultSolidDefault, highlightedColor: ColorToken.surfaceDefaultSolidDefaultActive, hoveredColor: ColorToken.surfaceDefaultSolidDefaultHover, selectedColor: .clearColor)
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textInversePrimary, highlightedColor: ColorToken.textInversePrimaryActive, hoveredColor: ColorToken.textInversePrimaryHover, selectedColor: .clearColor)
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textInversePrimary, highlightedColor: ColorToken.textInversePrimaryActive, hoveredColor: ColorToken.textInversePrimaryHover, selectedColor: .clearColor)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textInverseSecondary, highlightedColor: ColorToken.textInverseSecondaryActive, hoveredColor: ColorToken.textInverseSecondaryHover, selectedColor: .clearColor)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textInversePrimary, highlightedColor: ColorToken.textInversePrimaryActive, hoveredColor: ColorToken.textInversePrimaryHover, selectedColor: .clearColor)
        return appearance
    }
    
    var accent: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultAccent, highlightedColor: ColorToken.surfaceDefaultAccentActive, hoveredColor: ColorToken.surfaceDefaultAccentHover, selectedColor: .clearColor)
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textOnDarkSecondary, highlightedColor: ColorToken.textOnDarkSecondaryActive, hoveredColor: ColorToken.textOnDarkSecondaryHover, selectedColor: .clearColor)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        return appearance
    }
    
    var black: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceOnLightSolidDefault, highlightedColor: ColorToken.surfaceOnLightSolidDefaultActive, hoveredColor: ColorToken.surfaceOnLightSolidDefaultHover, selectedColor: .clearColor)
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textOnDarkSecondary, highlightedColor: ColorToken.textOnDarkSecondaryActive, hoveredColor: ColorToken.textOnDarkSecondaryHover, selectedColor: .clearColor)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        return appearance
    }
    
    var clear: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultTransparentSecondaryActive, hoveredColor: ColorToken.surfaceDefaultTransparentSecondaryHover, selectedColor: .clearColor)
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: .clearColor)
        appearance.loadingAlpha = CGFloat(0.06)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: .clearColor)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondaryActive, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: .clearColor)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: .clearColor)
        return appearance
    }
    
    var dark: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceOnLightTransparentDeep, highlightedColor: ColorToken.surfaceOnLightTransparentDeepActive, hoveredColor: ColorToken.surfaceOnLightTransparentDeepHover, selectedColor: .clearColor)
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textOnDarkSecondary, highlightedColor: ColorToken.textOnDarkSecondaryActive, hoveredColor: ColorToken.textOnDarkSecondaryHover, selectedColor: .clearColor)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        return appearance
    }
    
    var negative: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultNegative, highlightedColor: ColorToken.surfaceDefaultNegativeActive, hoveredColor: ColorToken.surfaceDefaultNegativeHover, selectedColor: .clearColor)
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textOnDarkSecondary, highlightedColor: ColorToken.textOnDarkSecondaryActive, hoveredColor: ColorToken.textOnDarkSecondaryHover, selectedColor: .clearColor)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        return appearance
    }
    
    var positive: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultPositive, highlightedColor: ColorToken.surfaceDefaultPositiveActive, hoveredColor: ColorToken.surfaceDefaultPositiveHover, selectedColor: .clearColor)
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textOnDarkSecondary, highlightedColor: ColorToken.textOnDarkSecondaryActive, hoveredColor: ColorToken.textOnDarkSecondaryHover, selectedColor: .clearColor)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        return appearance
    }
    
    var secondary: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultTransparentSecondary, highlightedColor: ColorToken.surfaceDefaultTransparentSecondaryActive, hoveredColor: ColorToken.surfaceDefaultTransparentSecondaryHover, selectedColor: .clearColor)
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: .clearColor)
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: .clearColor)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondaryActive, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: .clearColor)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: .clearColor)
        return appearance
    }
    
    var warning: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultWarning, highlightedColor: ColorToken.surfaceDefaultWarningActive, hoveredColor: ColorToken.surfaceDefaultWarningHover, selectedColor: .clearColor)
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textOnDarkSecondary, highlightedColor: ColorToken.textOnDarkSecondaryActive, hoveredColor: ColorToken.textOnDarkSecondaryHover, selectedColor: .clearColor)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        return appearance
    }
    
    var white: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceOnDarkSolidDefault, highlightedColor: ColorToken.surfaceOnDarkSolidDefaultActive, hoveredColor: ColorToken.surfaceOnDarkSolidDefaultHover, selectedColor: .clearColor)
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textOnLightPrimary, highlightedColor: ColorToken.textOnLightPrimaryActive, hoveredColor: ColorToken.textOnLightPrimaryHover, selectedColor: .clearColor)
        appearance.loadingAlpha = CGFloat(0.0)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textOnLightPrimary, highlightedColor: ColorToken.textOnLightPrimaryActive, hoveredColor: ColorToken.textOnLightPrimaryHover, selectedColor: .clearColor)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textOnLightSecondary, highlightedColor: ColorToken.textOnLightSecondaryActive, hoveredColor: ColorToken.textOnLightSecondaryHover, selectedColor: .clearColor)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textOnLightPrimary, highlightedColor: ColorToken.textOnLightPrimaryActive, hoveredColor: ColorToken.textOnLightPrimaryHover, selectedColor: .clearColor)
        return appearance
    }
    
}
