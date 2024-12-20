import Foundation
import SDDSComponents
import SDDSThemeCore

public extension ButtonAppearanceVariation<BasicButton> {
    var accent: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: BasicButton.accent.appearance)
        )
    }
    var black: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: BasicButton.black.appearance)
        )
    }
    var clear: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: BasicButton.clear.appearance)
        )
    }
    var dark: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: BasicButton.dark.appearance)
        )
    }
    var `default`: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: BasicButton.default.appearance)
        )
    }
    var negative: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: BasicButton.negative.appearance)
        )
    }
    var positive: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: BasicButton.positive.appearance)
        )
    }
    var secondary: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: BasicButton.secondary.appearance)
        )
    }
    var warning: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: BasicButton.warning.appearance)
        )
    }
    var white: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: BasicButton.white.appearance)
        )
    }
}

public extension BasicButton {
    static var accent: ButtonAppearanceVariation<BasicButton> {
        .init(
            name: "accent",
            appearance: ButtonAppearance(
                titleTypography: BasicButton.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleTypography: BasicButton.subtitleTypography,
                subtitleColor: ButtonColor(
                    defaultColor: .textOnDarkSecondary,
                    highlightedColor: .textOnDarkSecondaryActive,
                    hoveredColor: .textOnDarkSecondaryHover
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
    static var black: ButtonAppearanceVariation<BasicButton> {
        .init(
            name: "black",
            appearance: ButtonAppearance(
                titleTypography: BasicButton.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleTypography: BasicButton.subtitleTypography,
                subtitleColor: ButtonColor(
                    defaultColor: .textOnDarkSecondary,
                    highlightedColor: .textOnDarkSecondaryActive,
                    hoveredColor: .textOnDarkSecondaryHover
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
    static var clear: ButtonAppearanceVariation<BasicButton> {
        .init(
            name: "clear",
            appearance: ButtonAppearance(
                titleTypography: BasicButton.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textDefaultPrimaryActive,
                    hoveredColor: .textDefaultPrimaryHover
                ),
                subtitleTypography: BasicButton.subtitleTypography,
                subtitleColor: ButtonColor(
                    defaultColor: .textDefaultSecondary,
                    highlightedColor: .textDefaultSecondaryActive,
                    hoveredColor: .textDefaultSecondaryHover
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
                loadingAlpha: 0.06
            )
        )
    }
    static var dark: ButtonAppearanceVariation<BasicButton> {
        .init(
            name: "dark",
            appearance: ButtonAppearance(
                titleTypography: BasicButton.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleTypography: BasicButton.subtitleTypography,
                subtitleColor: ButtonColor(
                    defaultColor: .textOnDarkSecondary,
                    highlightedColor: .textOnDarkSecondaryActive,
                    hoveredColor: .textOnDarkSecondaryHover
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
    static var `default`: ButtonAppearanceVariation<BasicButton> {
        .init(
            name: "default",
            appearance: ButtonAppearance(
                titleTypography: BasicButton.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textInversePrimary,
                    highlightedColor: .textInversePrimaryActive,
                    hoveredColor: .textInversePrimaryHover
                ),
                subtitleTypography: BasicButton.subtitleTypography,
                subtitleColor: ButtonColor(
                    defaultColor: .textInverseSecondary,
                    highlightedColor: .textInverseSecondaryActive,
                    hoveredColor: .textInverseSecondaryHover
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
    static var negative: ButtonAppearanceVariation<BasicButton> {
        .init(
            name: "negative",
            appearance: ButtonAppearance(
                titleTypography: BasicButton.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleTypography: BasicButton.subtitleTypography,
                subtitleColor: ButtonColor(
                    defaultColor: .textOnDarkSecondary,
                    highlightedColor: .textOnDarkSecondaryActive,
                    hoveredColor: .textOnDarkSecondaryHover
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
    static var positive: ButtonAppearanceVariation<BasicButton> {
        .init(
            name: "positive",
            appearance: ButtonAppearance(
                titleTypography: BasicButton.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleTypography: BasicButton.subtitleTypography,
                subtitleColor: ButtonColor(
                    defaultColor: .textOnDarkSecondary,
                    highlightedColor: .textOnDarkSecondaryActive,
                    hoveredColor: .textOnDarkSecondaryHover
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
    static var secondary: ButtonAppearanceVariation<BasicButton> {
        .init(
            name: "secondary",
            appearance: ButtonAppearance(
                titleTypography: BasicButton.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textDefaultPrimaryActive,
                    hoveredColor: .textDefaultPrimaryHover
                ),
                subtitleTypography: BasicButton.subtitleTypography,
                subtitleColor: ButtonColor(
                    defaultColor: .textDefaultSecondary,
                    highlightedColor: .textDefaultSecondaryActive,
                    hoveredColor: .textDefaultSecondaryHover
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
    static var warning: ButtonAppearanceVariation<BasicButton> {
        .init(
            name: "warning",
            appearance: ButtonAppearance(
                titleTypography: BasicButton.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleTypography: BasicButton.subtitleTypography,
                subtitleColor: ButtonColor(
                    defaultColor: .textOnDarkSecondary,
                    highlightedColor: .textOnDarkSecondaryActive,
                    hoveredColor: .textOnDarkSecondaryHover
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
    static var white: ButtonAppearanceVariation<BasicButton> {
        .init(
            name: "white",
            appearance: ButtonAppearance(
                titleTypography: BasicButton.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textOnLightPrimary,
                    highlightedColor: .textOnLightPrimaryActive,
                    hoveredColor: .textOnLightPrimaryHover
                ),
                subtitleTypography: BasicButton.subtitleTypography,
                subtitleColor: ButtonColor(
                    defaultColor: .textOnLightSecondary,
                    highlightedColor: .textOnLightSecondaryActive,
                    hoveredColor: .textOnLightSecondaryHover
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

    static var all: [ButtonAppearanceVariation<BasicButton>] {
        [
            
            BasicButton.accent,
            
            BasicButton.black,
            
            BasicButton.clear,
            
            BasicButton.dark,
            
            BasicButton.`default`,
            
            BasicButton.negative,
            
            BasicButton.positive,
            
            BasicButton.secondary,
            
            BasicButton.warning,
            
            BasicButton.white
            
        ]
    }
}
