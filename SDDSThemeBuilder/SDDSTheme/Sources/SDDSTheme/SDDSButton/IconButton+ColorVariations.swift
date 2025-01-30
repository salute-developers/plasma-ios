/* This file is code generated. */

// MARK: - Colors
import Foundation
import SDDSComponents
import SDDSThemeCore

public extension ComponentAppearanceVariation<IconButton, ButtonAppearance> {
    var accent: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: IconButton.accent.appearance)
        )
    }
    var black: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: IconButton.black.appearance)
        )
    }
    var clear: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: IconButton.clear.appearance)
        )
    }
    var dark: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: IconButton.dark.appearance)
        )
    }
    var `default`: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: IconButton.`default`.appearance)
        )
    }
    var negative: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: IconButton.negative.appearance)
        )
    }
    var positive: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: IconButton.positive.appearance)
        )
    }
    var secondary: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: IconButton.secondary.appearance)
        )
    }
    var warning: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: IconButton.warning.appearance)
        )
    }
    var white: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: IconButton.white.appearance)
        )
    }
}

public extension IconButton {
    static var accent: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        .init(
            name: "accent",
            appearance: ButtonAppearance(
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleColor: ButtonColor(
                    defaultColor: .clearColor,
                    highlightedColor: .clearColor,
                    hoveredColor: .clearColor
                ),
                iconColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                spinnerColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceDefaultAccent,
                    highlightedColor: .surfaceDefaultAccentActive,
                    hoveredColor: .surfaceDefaultAccentHover
                ),
                disabledAlpha: 0.4,
                loadingAlpha: 0
            )
        )
    }
    static var black: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        .init(
            name: "black",
            appearance: ButtonAppearance(
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleColor: ButtonColor(
                    defaultColor: .clearColor,
                    highlightedColor: .clearColor,
                    hoveredColor: .clearColor
                ),
                iconColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                spinnerColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceOnLightSolidDefault,
                    highlightedColor: .surfaceOnLightSolidDefaultActive,
                    hoveredColor: .surfaceOnLightSolidDefaultHover
                ),
                disabledAlpha: 0.4,
                loadingAlpha: 0
            )
        )
    }
    static var clear: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        .init(
            name: "clear",
            appearance: ButtonAppearance(
                titleColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textDefaultPrimaryActive,
                    hoveredColor: .textDefaultPrimaryHover
                ),
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
                    highlightedColor: .surfaceDefaultClearActive,
                    hoveredColor: .surfaceDefaultClearHover
                ),
                disabledAlpha: 0.4,
                loadingAlpha: 0
            )
        )
    }
    static var dark: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        .init(
            name: "dark",
            appearance: ButtonAppearance(
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleColor: ButtonColor(
                    defaultColor: .clearColor,
                    highlightedColor: .clearColor,
                    hoveredColor: .clearColor
                ),
                iconColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                spinnerColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceOnLightTransparentDeep,
                    highlightedColor: .surfaceOnLightTransparentDeepActive,
                    hoveredColor: .surfaceOnLightTransparentDeepHover
                ),
                disabledAlpha: 0.4,
                loadingAlpha: 0
            )
        )
    }
    static var `default`: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        .init(
            name: "default",
            appearance: ButtonAppearance(
                titleColor: ButtonColor(
                    defaultColor: .textInversePrimary,
                    highlightedColor: .textInversePrimaryActive,
                    hoveredColor: .textInversePrimaryHover
                ),
                subtitleColor: ButtonColor(
                    defaultColor: .clearColor,
                    highlightedColor: .clearColor,
                    hoveredColor: .clearColor
                ),
                iconColor: ButtonColor(
                    defaultColor: .textInversePrimary,
                    highlightedColor: .textInversePrimaryActive,
                    hoveredColor: .textInversePrimaryHover
                ),
                spinnerColor: ButtonColor(
                    defaultColor: .textInversePrimary,
                    highlightedColor: .textInversePrimaryActive,
                    hoveredColor: .textInversePrimaryHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceDefaultSolidDefault,
                    highlightedColor: .surfaceDefaultSolidDefaultActive,
                    hoveredColor: .surfaceDefaultSolidDefaultHover
                ),
                disabledAlpha: 0.4,
                loadingAlpha: 0
            )
        )
    }
    static var negative: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        .init(
            name: "negative",
            appearance: ButtonAppearance(
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleColor: ButtonColor(
                    defaultColor: .clearColor,
                    highlightedColor: .clearColor,
                    hoveredColor: .clearColor
                ),
                iconColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                spinnerColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceDefaultNegative,
                    highlightedColor: .surfaceDefaultNegativeActive,
                    hoveredColor: .surfaceDefaultNegativeHover
                ),
                disabledAlpha: 0.4,
                loadingAlpha: 0
            )
        )
    }
    static var positive: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        .init(
            name: "positive",
            appearance: ButtonAppearance(
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleColor: ButtonColor(
                    defaultColor: .clearColor,
                    highlightedColor: .clearColor,
                    hoveredColor: .clearColor
                ),
                iconColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                spinnerColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceDefaultPositive,
                    highlightedColor: .surfaceDefaultPositiveActive,
                    hoveredColor: .surfaceDefaultPositiveHover
                ),
                disabledAlpha: 0.4,
                loadingAlpha: 0
            )
        )
    }
    static var secondary: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        .init(
            name: "secondary",
            appearance: ButtonAppearance(
                titleColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textDefaultPrimaryActive,
                    hoveredColor: .textDefaultPrimaryHover
                ),
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
                    defaultColor: .surfaceDefaultTransparentSecondary,
                    highlightedColor: .surfaceDefaultTransparentSecondaryActive,
                    hoveredColor: .surfaceDefaultTransparentSecondaryHover
                ),
                disabledAlpha: 0.4,
                loadingAlpha: 0
            )
        )
    }
    static var warning: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        .init(
            name: "warning",
            appearance: ButtonAppearance(
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleColor: ButtonColor(
                    defaultColor: .clearColor,
                    highlightedColor: .clearColor,
                    hoveredColor: .clearColor
                ),
                iconColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                spinnerColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceDefaultWarning,
                    highlightedColor: .surfaceDefaultWarningActive,
                    hoveredColor: .surfaceDefaultWarningHover
                ),
                disabledAlpha: 0.4,
                loadingAlpha: 0
            )
        )
    }
    static var white: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        .init(
            name: "white",
            appearance: ButtonAppearance(
                titleColor: ButtonColor(
                    defaultColor: .textOnLightPrimary,
                    highlightedColor: .textOnLightPrimaryActive,
                    hoveredColor: .textOnLightPrimaryHover
                ),
                subtitleColor: ButtonColor(
                    defaultColor: .clearColor,
                    highlightedColor: .clearColor,
                    hoveredColor: .clearColor
                ),
                iconColor: ButtonColor(
                    defaultColor: .textOnLightPrimary,
                    highlightedColor: .textOnLightPrimaryActive,
                    hoveredColor: .textOnLightPrimaryHover
                ),
                spinnerColor: ButtonColor(
                    defaultColor: .textOnLightPrimary,
                    highlightedColor: .textOnLightPrimaryActive,
                    hoveredColor: .textOnLightPrimaryHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceOnLightSolidDefault,
                    highlightedColor: .surfaceOnLightSolidDefaultActive,
                    hoveredColor: .surfaceOnLightSolidDefaultHover
                ),
                disabledAlpha: 0.4,
                loadingAlpha: 0
            )
        )
    }
    static var all: [ComponentAppearanceVariation<IconButton, ButtonAppearance>] {
        [
            
            IconButton.accent,
            
            IconButton.black,
            
            IconButton.clear,
            
            IconButton.dark,
            
            IconButton.`default`,
            
            IconButton.negative,
            
            IconButton.positive,
            
            IconButton.secondary,
            
            IconButton.warning,
            
            IconButton.white
            
        ]
    }
}
