import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


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
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover)
        return appearance
    }
    
    var accent: ButtonAppearance {
        var appearance = self
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultAccent, highlightedColor: ColorToken.textDefaultAccentActive, hoveredColor: ColorToken.textDefaultAccentHover)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textDefaultAccent, highlightedColor: ColorToken.textDefaultAccentActive, hoveredColor: ColorToken.textDefaultAccentHover)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultAccent, highlightedColor: ColorToken.textDefaultAccentActive, hoveredColor: ColorToken.textDefaultAccentHover)
        return appearance
    }
    
    var negative: ButtonAppearance {
        var appearance = self
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultNegative, highlightedColor: ColorToken.textDefaultNegativeActive, hoveredColor: ColorToken.textDefaultNegativeHover)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textDefaultNegative, highlightedColor: ColorToken.textDefaultNegativeActive, hoveredColor: ColorToken.textDefaultNegativeHover)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultNegative, highlightedColor: ColorToken.textDefaultNegativeActive, hoveredColor: ColorToken.textDefaultNegativeHover)
        return appearance
    }
    
    var positive: ButtonAppearance {
        var appearance = self
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultPositive, highlightedColor: ColorToken.textDefaultPositiveActive, hoveredColor: ColorToken.textDefaultPositiveHover)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textDefaultPositive, highlightedColor: ColorToken.textDefaultPositiveActive, hoveredColor: ColorToken.textDefaultPositiveHover)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPositive, highlightedColor: ColorToken.textDefaultPositiveActive, hoveredColor: ColorToken.textDefaultPositiveHover)
        return appearance
    }
    
    var secondary: ButtonAppearance {
        var appearance = self
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondaryActive, hoveredColor: ColorToken.textDefaultSecondaryHover)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondaryActive, hoveredColor: ColorToken.textDefaultSecondaryHover)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondaryActive, hoveredColor: ColorToken.textDefaultSecondaryHover)
        return appearance
    }
    
    var warning: ButtonAppearance {
        var appearance = self
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultWarning, highlightedColor: ColorToken.textDefaultWarningActive, hoveredColor: ColorToken.textDefaultWarningHover)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textDefaultWarning, highlightedColor: ColorToken.textDefaultWarningActive, hoveredColor: ColorToken.textDefaultWarningHover)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultWarning, highlightedColor: ColorToken.textDefaultWarningActive, hoveredColor: ColorToken.textDefaultWarningHover)
        return appearance
    }
    
}
