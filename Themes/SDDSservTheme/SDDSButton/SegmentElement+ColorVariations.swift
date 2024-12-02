import Foundation
import SDDSComponents
import SDDSThemeCore

public extension ButtonAppearanceVariation<SegmentElement> {
    var accent: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SegmentElement.accent.appearance)
        )
    }
    var black: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SegmentElement.black.appearance)
        )
    }
    var clear: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SegmentElement.clear.appearance)
        )
    }
    var dark: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SegmentElement.dark.appearance)
        )
    }
    var `default`: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SegmentElement.default.appearance)
        )
    }
    var negative: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SegmentElement.negative.appearance)
        )
    }
    var positive: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SegmentElement.positive.appearance)
        )
    }
    var white: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SegmentElement.white.appearance)
        )
    }
}

public extension SegmentElement {
    static var accent: ButtonAppearanceVariation<SegmentElement> {
        .init(
            name: "accent",
            appearance: ButtonAppearance(
                titleTypography: SegmentElement.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleTypography: SegmentElement.subtitleTypography,
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
    static var black: ButtonAppearanceVariation<SegmentElement> {
        .init(
            name: "black",
            appearance: ButtonAppearance(
                titleTypography: SegmentElement.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleTypography: SegmentElement.subtitleTypography,
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
    static var clear: ButtonAppearanceVariation<SegmentElement> {
        .init(
            name: "clear",
            appearance: ButtonAppearance(
                titleTypography: SegmentElement.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textDefaultPrimaryActive,
                    hoveredColor: .textDefaultPrimaryHover
                ),
                subtitleTypography: SegmentElement.subtitleTypography,
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
    static var dark: ButtonAppearanceVariation<SegmentElement> {
        .init(
            name: "dark",
            appearance: ButtonAppearance(
                titleTypography: SegmentElement.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleTypography: SegmentElement.subtitleTypography,
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
    static var `default`: ButtonAppearanceVariation<SegmentElement> {
        .init(
            name: "default",
            appearance: ButtonAppearance(
                titleTypography: SegmentElement.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textInversePrimary,
                    highlightedColor: .textInversePrimaryActive,
                    hoveredColor: .textInversePrimaryHover
                ),
                subtitleTypography: SegmentElement.subtitleTypography,
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
    static var negative: ButtonAppearanceVariation<SegmentElement> {
        .init(
            name: "negative",
            appearance: ButtonAppearance(
                titleTypography: SegmentElement.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleTypography: SegmentElement.subtitleTypography,
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
    static var positive: ButtonAppearanceVariation<SegmentElement> {
        .init(
            name: "positive",
            appearance: ButtonAppearance(
                titleTypography: SegmentElement.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleTypography: SegmentElement.subtitleTypography,
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
    static var secondary: ButtonAppearanceVariation<SegmentElement> {
        .init(
            name: "secondary",
            appearance: ButtonAppearance(
                titleTypography: SegmentElement.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textDefaultPrimaryActive,
                    hoveredColor: .textDefaultPrimaryHover
                ),
                subtitleTypography: SegmentElement.subtitleTypography,
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
    static var warning: ButtonAppearanceVariation<SegmentElement> {
        .init(
            name: "warning",
            appearance: ButtonAppearance(
                titleTypography: SegmentElement.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                subtitleTypography: SegmentElement.subtitleTypography,
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
    static var white: ButtonAppearanceVariation<SegmentElement> {
        .init(
            name: "white",
            appearance: ButtonAppearance(
                titleTypography: SegmentElement.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textOnLightPrimary,
                    highlightedColor: .textOnLightPrimaryActive,
                    hoveredColor: .textOnLightPrimaryHover
                ),
                subtitleTypography: SegmentElement.subtitleTypography,
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

    static var all: [ButtonAppearanceVariation<SegmentElement>] {
        [
            
            SegmentElement.accent,
            
            SegmentElement.black,
            
            SegmentElement.clear,
            
            SegmentElement.dark,
            
            SegmentElement.`default`,
            
            SegmentElement.negative,
            
            SegmentElement.positive,
            
            SegmentElement.secondary,
            
            SegmentElement.warning,
            
            SegmentElement.white
            
        ]
    }
}
