import Foundation
import SDDSComponents
import SDDSThemeCore

// MARK: - Color
public extension ButtonAppearanceVariation<LinkButton> {
    var `default`: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: LinkButton.default.appearance)
        )
    }

    var secondary: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: LinkButton.secondary.appearance)
        )
    }

    var accent: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: LinkButton.accent.appearance)
        )
    }

    var positive: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: LinkButton.positive.appearance)
        )
    }

    var negative: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: LinkButton.negative.appearance)
        )
    }

    var warning: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: LinkButton.warning.appearance)
        )
    }
}

public extension LinkButton {
    static var `default`: ButtonAppearanceVariation<LinkButton> {
        .init(
            name: "default",
            appearance: ButtonAppearance(
                titleTypography: LinkButton.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textDefaultPrimaryActive,
                    hoveredColor: .textDefaultPrimaryHover
                ),
                subtitleTypography: LinkButton.subtitleTypography,
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

    static var secondary: ButtonAppearanceVariation<LinkButton> {
        .init(
            name: "secondary",
            appearance: ButtonAppearance(
                titleTypography: LinkButton.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultSecondary,
                    highlightedColor: .textDefaultSecondaryActive,
                    hoveredColor: .textDefaultSecondaryHover
                ),
                subtitleTypography: LinkButton.subtitleTypography,
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

    static var accent: ButtonAppearanceVariation<LinkButton> {
        .init(
            name: "accent",
            appearance: ButtonAppearance(
                titleTypography: LinkButton.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultAccent,
                    highlightedColor: .textDefaultAccentActive,
                    hoveredColor: .textDefaultAccentHover
                ),
                subtitleTypography: LinkButton.subtitleTypography,
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

    static var positive: ButtonAppearanceVariation<LinkButton> {
        .init(
            name: "positive",
            appearance: ButtonAppearance(
                titleTypography: LinkButton.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultPositive,
                    highlightedColor: .textDefaultPositiveActive,
                    hoveredColor: .textDefaultPositiveHover
                ),
                subtitleTypography: LinkButton.subtitleTypography,
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

    static var negative: ButtonAppearanceVariation<LinkButton> {
        .init(
            name: "negative",
            appearance: ButtonAppearance(
                titleTypography: LinkButton.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultNegative,
                    highlightedColor: .textDefaultNegativeActive,
                    hoveredColor: .textDefaultNegativeHover
                ),
                subtitleTypography: LinkButton.subtitleTypography,
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

    static var warning: ButtonAppearanceVariation<LinkButton> {
        .init(
            name: "warning",
            appearance: ButtonAppearance(
                titleTypography: LinkButton.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultWarning,
                    highlightedColor: .textDefaultWarningActive,
                    hoveredColor: .textDefaultWarningHover
                ),
                subtitleTypography: LinkButton.subtitleTypography,
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
    
    static var all: [ButtonAppearanceVariation<LinkButton>] {
        [
            LinkButton.default,
            LinkButton.secondary,
            LinkButton.accent,
            LinkButton.positive,
            LinkButton.negative,
            LinkButton.warning
        ]
    }
}
