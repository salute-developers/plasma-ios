import Foundation
import SDDSComponents
import SDDSThemeCore

public extension ButtonAppearanceVariation<SDDSSegmentElement> {
    var accent: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSSegmentElement.accent.appearance)
        )
    }
    var black: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSSegmentElement.black.appearance)
        )
    }
    var clear: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSSegmentElement.clear.appearance)
        )
    }
    var dark: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSSegmentElement.dark.appearance)
        )
    }
    var `default`: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSSegmentElement.default.appearance)
        )
    }
    var negative: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSSegmentElement.negative.appearance)
        )
    }
    var positive: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSSegmentElement.positive.appearance)
        )
    }
    var white: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSSegmentElement.white.appearance)
        )
    }
}

public extension SDDSSegmentElement {
    static var accent: ButtonAppearanceVariation<SDDSSegmentElement> {
        .init(
            name: "accent",
            appearance: ButtonAppearance(
                titleTypography: SDDSSegmentElement.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleTypography: SDDSSegmentElement.subtitleTypography,
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
    static var black: ButtonAppearanceVariation<SDDSSegmentElement> {
        .init(
            name: "black",
            appearance: ButtonAppearance(
                titleTypography: SDDSSegmentElement.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleTypography: SDDSSegmentElement.subtitleTypography,
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
    static var clear: ButtonAppearanceVariation<SDDSSegmentElement> {
        .init(
            name: "clear",
            appearance: ButtonAppearance(
                titleTypography: SDDSSegmentElement.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textDefaultPrimaryActive,
                    hoveredColor: .textDefaultPrimaryHover
                ),
                subtitleTypography: SDDSSegmentElement.subtitleTypography,
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
    static var dark: ButtonAppearanceVariation<SDDSSegmentElement> {
        .init(
            name: "dark",
            appearance: ButtonAppearance(
                titleTypography: SDDSSegmentElement.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleTypography: SDDSSegmentElement.subtitleTypography,
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
    static var `default`: ButtonAppearanceVariation<SDDSSegmentElement> {
        .init(
            name: "default",
            appearance: ButtonAppearance(
                titleTypography: SDDSSegmentElement.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textInversePrimary,
                    highlightedColor: .textInversePrimaryActive,
                    hoveredColor: .textInversePrimaryHover
                ),
                subtitleTypography: SDDSSegmentElement.subtitleTypography,
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
    static var negative: ButtonAppearanceVariation<SDDSSegmentElement> {
        .init(
            name: "negative",
            appearance: ButtonAppearance(
                titleTypography: SDDSSegmentElement.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleTypography: SDDSSegmentElement.subtitleTypography,
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
    static var positive: ButtonAppearanceVariation<SDDSSegmentElement> {
        .init(
            name: "positive",
            appearance: ButtonAppearance(
                titleTypography: SDDSSegmentElement.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleTypography: SDDSSegmentElement.subtitleTypography,
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
    static var secondary: ButtonAppearanceVariation<SDDSSegmentElement> {
        .init(
            name: "secondary",
            appearance: ButtonAppearance(
                titleTypography: SDDSSegmentElement.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textDefaultPrimaryActive,
                    hoveredColor: .textDefaultPrimaryHover
                ),
                subtitleTypography: SDDSSegmentElement.subtitleTypography,
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
    static var warning: ButtonAppearanceVariation<SDDSSegmentElement> {
        .init(
            name: "warning",
            appearance: ButtonAppearance(
                titleTypography: SDDSSegmentElement.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleTypography: SDDSSegmentElement.subtitleTypography,
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
    static var white: ButtonAppearanceVariation<SDDSSegmentElement> {
        .init(
            name: "white",
            appearance: ButtonAppearance(
                titleTypography: SDDSSegmentElement.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textOnLightPrimary,
                    highlightedColor: .textOnLightPrimaryActive,
                    hoveredColor: .textOnLightPrimaryHover
                ),
                subtitleTypography: SDDSSegmentElement.subtitleTypography,
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

    static var all: [ButtonAppearanceVariation<SDDSSegmentElement>] {
        [
            
            SDDSSegmentElement.accent,
            
            SDDSSegmentElement.black,
            
            SDDSSegmentElement.clear,
            
            SDDSSegmentElement.dark,
            
            SDDSSegmentElement.`default`,
            
            SDDSSegmentElement.negative,
            
            SDDSSegmentElement.positive,
            
            SDDSSegmentElement.secondary,
            
            SDDSSegmentElement.warning,
            
            SDDSSegmentElement.white
            
        ]
    }
}
