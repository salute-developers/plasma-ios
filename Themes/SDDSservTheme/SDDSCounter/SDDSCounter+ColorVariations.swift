import Foundation
import SDDSComponents
import SDDSThemeCore

public extension AppearanceVariation<CounterAppearance> {
    var black: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSCounter.black.appearance)
        )
    }
    var negative: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSCounter.negative.appearance)
        )
    }
    
    var warning: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSCounter.warning.appearance)
        )
    }
    
    var positive: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSCounter.positive.appearance)
        )
    }
    
    var accent: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSCounter.accent.appearance)
        )
    }
    
    var white: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSCounter.white.appearance)
        )
    }
    
    var `default`: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSCounter.default.appearance)
        )
    }
}

public extension SDDSCounter {
    static var black: AppearanceVariation<CounterAppearance> {
        .init(
            name: "black",
            appearance: .init(
                textTypography: SDDSCounter.textTypography,
                textColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceOnLightSolidDefault,
                    highlightedColor: .surfaceOnLightSolidDefaultActive,
                    hoveredColor: .surfaceOnLightSolidDefaultHover
                )
            )
        )
    }
    static var negative: AppearanceVariation<CounterAppearance> {
        .init(
            name: "negative",
            appearance: .init(
                textTypography: SDDSCounter.textTypography,
                textColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceDefaultNegative,
                    highlightedColor: .surfaceDefaultNegativeActive,
                    hoveredColor: .surfaceDefaultNegativeHover
                )
            )
        )
    }
    static var warning: AppearanceVariation<CounterAppearance> {
        .init(
            name: "warning",
            appearance: .init(
                textTypography: SDDSCounter.textTypography,
                textColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceDefaultWarning,
                    highlightedColor: .surfaceDefaultWarningActive,
                    hoveredColor: .surfaceDefaultWarningHover
                )
            )
        )
    }
    static var positive: AppearanceVariation<CounterAppearance> {
        .init(
            name: "positive",
            appearance: .init(
                textTypography: SDDSCounter.textTypography,
                textColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceDefaultPositive,
                    highlightedColor: .surfaceDefaultPositiveActive,
                    hoveredColor: .surfaceDefaultPositiveHover
                )
            )
        )
    }
    static var accent: AppearanceVariation<CounterAppearance> {
        .init(
            name: "accent",
            appearance: .init(
                textTypography: SDDSCounter.textTypography,
                textColor: ButtonColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceDefaultAccent,
                    highlightedColor: .surfaceDefaultAccentActive,
                    hoveredColor: .surfaceDefaultAccentHover
                )
            )
        )
    }
    static var white: AppearanceVariation<CounterAppearance> {
        .init(
            name: "white",
            appearance: .init(
                textTypography: SDDSCounter.textTypography,
                textColor: ButtonColor(
                    defaultColor: .textOnLightPrimary,
                    highlightedColor: .textOnLightPrimaryActive,
                    hoveredColor: .textOnLightPrimaryActive
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .backgroundLightPrimary,
                    highlightedColor: .backgroundLightPrimary,
                    hoveredColor: .backgroundLightPrimary
                )
            )
        )
    }
    static var `default`: AppearanceVariation<CounterAppearance> {
        .init(
            name: "default",
            appearance: .init(
                textTypography: SDDSCounter.textTypography,
                textColor: ButtonColor(
                    defaultColor: .textInversePrimary,
                    highlightedColor: .textInversePrimaryActive,
                    hoveredColor: .textInversePrimaryHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceDefaultSolidDefault,
                    highlightedColor: .surfaceDefaultSolidDefaultActive,
                    hoveredColor: .surfaceDefaultSolidDefaultHover
                )
            )
        )
    }
    static var all: [AppearanceVariation<CounterAppearance>] {
        [
            SDDSCounter.black,
            
            SDDSCounter.negative,
            
            SDDSCounter.warning,
            
            SDDSCounter.positive,
            
            SDDSCounter.accent,
            
            SDDSCounter.white,
            
            SDDSCounter.default
        ]
    }
}

