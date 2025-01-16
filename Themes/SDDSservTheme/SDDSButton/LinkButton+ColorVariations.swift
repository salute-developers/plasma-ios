/* This file is code generated. */

import Foundation
import SDDSComponents
import SDDSThemeCore

public extension ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
    var accent: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: LinkButton.accent.appearance)
        )
    }
    var `default`: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: LinkButton.`default`.appearance)
        )
    }
    var negative: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: LinkButton.negative.appearance)
        )
    }
    var positive: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: LinkButton.positive.appearance)
        )
    }
    var secondary: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: LinkButton.secondary.appearance)
        )
    }
    var warning: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: LinkButton.warning.appearance)
        )
    }
}

public extension LinkButton {
    static var accent: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        .init(
            name: "accent",
            appearance: ButtonAppearance(
                titleTypography: LinkButton.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultAccent,
                    highlightedColor: .textDefaultAccentActive,
                    hoveredColor: .textDefaultAccentHover
                ),
                subtitleTypography: .default,
                subtitleColor: ButtonColor(
                    defaultColor: .clearColor,
                    highlightedColor: .clearColor,
                    hoveredColor: .clearColor
                ),
                iconColor: ButtonColor(
                    defaultColor: .textDefaultAccent,
                    highlightedColor: .textDefaultAccentActive,
                    hoveredColor: .textDefaultAccentHover
                ),
                spinnerColor: ButtonColor(
                    defaultColor: .textDefaultAccent,
                    highlightedColor: .textDefaultAccentActive,
                    hoveredColor: .textDefaultAccentHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceDefaultClear,
                    highlightedColor: .clearColor,
                    hoveredColor: .clearColor
                ),
                disabledAlpha: 0.4,
                loadingAlpha: 0.06
            )
        )
    }
    static var `default`: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        .init(
            name: "default",
            appearance: ButtonAppearance(
                titleTypography: LinkButton.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textDefaultPrimaryActive,
                    hoveredColor: .textDefaultPrimaryHover
                ),
                subtitleTypography: .default,
                subtitleColor: ButtonColor(
                    defaultColor: .clearColor,
                    highlightedColor: .clearColor,
                    hoveredColor: .clearColor
                ),
                iconColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textDefaultPrimaryActive,
                    hoveredColor: .textDefaultPrimaryHover
                ),
                spinnerColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textDefaultPrimaryActive,
                    hoveredColor: .textDefaultPrimaryHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceDefaultClear,
                    highlightedColor: .clearColor,
                    hoveredColor: .clearColor
                ),
                disabledAlpha: 0.4,
                loadingAlpha: 0.06
            )
        )
    }
    static var negative: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        .init(
            name: "negative",
            appearance: ButtonAppearance(
                titleTypography: LinkButton.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultNegative,
                    highlightedColor: .textDefaultNegativeActive,
                    hoveredColor: .textDefaultNegativeHover
                ),
                subtitleTypography: .default,
                subtitleColor: ButtonColor(
                    defaultColor: .clearColor,
                    highlightedColor: .clearColor,
                    hoveredColor: .clearColor
                ),
                iconColor: ButtonColor(
                    defaultColor: .textDefaultNegative,
                    highlightedColor: .textDefaultNegativeActive,
                    hoveredColor: .textDefaultNegativeHover
                ),
                spinnerColor: ButtonColor(
                    defaultColor: .textDefaultNegative,
                    highlightedColor: .textDefaultNegativeActive,
                    hoveredColor: .textDefaultNegativeHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceDefaultClear,
                    highlightedColor: .clearColor,
                    hoveredColor: .clearColor
                ),
                disabledAlpha: 0.4,
                loadingAlpha: 0.06
            )
        )
    }
    static var positive: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        .init(
            name: "positive",
            appearance: ButtonAppearance(
                titleTypography: LinkButton.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultPositive,
                    highlightedColor: .textDefaultPositiveActive,
                    hoveredColor: .textDefaultPositiveHover
                ),
                subtitleTypography: .default,
                subtitleColor: ButtonColor(
                    defaultColor: .clearColor,
                    highlightedColor: .clearColor,
                    hoveredColor: .clearColor
                ),
                iconColor: ButtonColor(
                    defaultColor: .textDefaultPositive,
                    highlightedColor: .textDefaultPositiveActive,
                    hoveredColor: .textDefaultPositiveHover
                ),
                spinnerColor: ButtonColor(
                    defaultColor: .textDefaultPositive,
                    highlightedColor: .textDefaultPositiveActive,
                    hoveredColor: .textDefaultPositiveHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceDefaultClear,
                    highlightedColor: .clearColor,
                    hoveredColor: .clearColor
                ),
                disabledAlpha: 0.4,
                loadingAlpha: 0.06
            )
        )
    }
    static var secondary: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        .init(
            name: "secondary",
            appearance: ButtonAppearance(
                titleTypography: LinkButton.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultSecondary,
                    highlightedColor: .textDefaultSecondaryActive,
                    hoveredColor: .textDefaultSecondaryHover
                ),
                subtitleTypography: .default,
                subtitleColor: ButtonColor(
                    defaultColor: .clearColor,
                    highlightedColor: .clearColor,
                    hoveredColor: .clearColor
                ),
                iconColor: ButtonColor(
                    defaultColor: .textDefaultSecondary,
                    highlightedColor: .textDefaultSecondaryActive,
                    hoveredColor: .textDefaultSecondaryHover
                ),
                spinnerColor: ButtonColor(
                    defaultColor: .textDefaultSecondary,
                    highlightedColor: .textDefaultSecondaryActive,
                    hoveredColor: .textDefaultSecondaryHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceDefaultClear,
                    highlightedColor: .clearColor,
                    hoveredColor: .clearColor
                ),
                disabledAlpha: 0.4,
                loadingAlpha: 0.06
            )
        )
    }
    static var warning: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        .init(
            name: "warning",
            appearance: ButtonAppearance(
                titleTypography: LinkButton.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultWarning,
                    highlightedColor: .textDefaultWarningActive,
                    hoveredColor: .textDefaultWarningHover
                ),
                subtitleTypography: .default,
                subtitleColor: ButtonColor(
                    defaultColor: .clearColor,
                    highlightedColor: .clearColor,
                    hoveredColor: .clearColor
                ),
                iconColor: ButtonColor(
                    defaultColor: .textDefaultWarning,
                    highlightedColor: .textDefaultWarningActive,
                    hoveredColor: .textDefaultWarningHover
                ),
                spinnerColor: ButtonColor(
                    defaultColor: .textDefaultWarning,
                    highlightedColor: .textDefaultWarningActive,
                    hoveredColor: .textDefaultWarningHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceDefaultClear,
                    highlightedColor: .clearColor,
                    hoveredColor: .clearColor
                ),
                disabledAlpha: 0.4,
                loadingAlpha: 0.06
            )
        )
    }
    static var all: [ComponentAppearanceVariation<LinkButton, ButtonAppearance>] {
        [
            
            LinkButton.accent,
            
            LinkButton.`default`,
            
            LinkButton.negative,
            
            LinkButton.positive,
            
            LinkButton.secondary,
            
            LinkButton.warning
            
        ]
    }
}
