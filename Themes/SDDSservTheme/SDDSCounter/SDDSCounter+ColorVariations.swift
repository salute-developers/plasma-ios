import Foundation
import SDDSComponents
import SDDSThemeCore

public struct CounterAppearanceVariation: Hashable {
    public let name: String
    public let appearance: CounterAppearance
    
    public init(name: String = "", appearance: CounterAppearance = CounterAppearance()) {
        self.name = name
        self.appearance = appearance
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    public static func == (lhs: CounterAppearanceVariation, rhs: CounterAppearanceVariation) -> Bool {
        return lhs.name == rhs.name
    }
}

public extension CounterAppearanceVariation {
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
    static var black: CounterAppearanceVariation {
        .init(
            name: "black",
            appearance: CounterAppearance(
                dataTypography: SDDSCounter.dataTypography,
                dataColor: CounterColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                backgroundColor: CounterColor(
                    defaultColor: .surfaceOnLightSolidDefault,
                    highlightedColor: .surfaceOnLightSolidDefaultActive,
                    hoveredColor: .surfaceOnLightSolidDefaultHover
                ),
                disabledAlpha: 0.4,
                loadingAlpha: 0
            )
        )
    }
    static var negative: CounterAppearanceVariation {
        .init(
            name: "negative",
            appearance: CounterAppearance(
                dataTypography: SDDSCounter.dataTypography,
                dataColor: CounterColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                backgroundColor: CounterColor(
                    defaultColor: .surfaceDefaultNegative,
                    highlightedColor: .surfaceDefaultNegativeActive,
                    hoveredColor: .surfaceDefaultNegativeHover
                ),
                disabledAlpha: 0.4,
                loadingAlpha: 0
            )
        )
    }
    static var warning: CounterAppearanceVariation {
        .init(
            name: "warning",
            appearance: CounterAppearance(
                dataTypography: SDDSCounter.dataTypography,
                dataColor: CounterColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                backgroundColor: CounterColor(
                    defaultColor: .surfaceDefaultWarning,
                    highlightedColor: .surfaceDefaultWarningActive,
                    hoveredColor: .surfaceDefaultWarningHover
                ),
                disabledAlpha: 0.4,
                loadingAlpha: 0
            )
        )
    }
    static var positive: CounterAppearanceVariation {
        .init(
            name: "positive",
            appearance: CounterAppearance(
                dataTypography: SDDSCounter.dataTypography,
                dataColor: CounterColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                backgroundColor: CounterColor(
                    defaultColor: .surfaceDefaultPositive,
                    highlightedColor: .surfaceDefaultPositiveActive,
                    hoveredColor: .surfaceDefaultPositiveHover
                ),
                disabledAlpha: 0.4,
                loadingAlpha: 0
            )
        )
    }
    static var accent: CounterAppearanceVariation {
        .init(
            name: "accent",
            appearance: CounterAppearance(
                dataTypography: SDDSCounter.dataTypography,
                dataColor: CounterColor(
                    defaultColor: .textOnDarkPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover
                ),
                backgroundColor: CounterColor(
                    defaultColor: .surfaceDefaultAccent,
                    highlightedColor: .surfaceDefaultAccentActive,
                    hoveredColor: .surfaceDefaultAccentHover
                ),
                disabledAlpha: 0.4,
                loadingAlpha: 0
            )
        )
    }
    static var white: CounterAppearanceVariation {
        .init(
            name: "white",
            appearance: CounterAppearance(
                dataTypography: SDDSCounter.dataTypography,
                dataColor: CounterColor(
                    defaultColor: .textOnLightPrimary,
                    highlightedColor: .textOnLightPrimaryActive,
                    hoveredColor: .textOnLightPrimaryActive
                ),
                backgroundColor: CounterColor(
                    defaultColor: .backgroundLightPrimary,
                    highlightedColor: .backgroundLightPrimary,
                    hoveredColor: .backgroundLightPrimary
                ),
                disabledAlpha: 0.4,
                loadingAlpha: 0
            )
        )
    }
    static var `default`: CounterAppearanceVariation {
        .init(
            name: "default",
            appearance: CounterAppearance(
                dataTypography: SDDSCounter.dataTypography,
                dataColor: CounterColor(
                    defaultColor: .textInversePrimary,
                    highlightedColor: .textInversePrimaryActive,
                    hoveredColor: .textInversePrimaryHover
                ),
                backgroundColor: CounterColor(
                    defaultColor: .surfaceDefaultSolidDefault,
                    highlightedColor: .surfaceDefaultSolidDefaultActive,
                    hoveredColor: .surfaceDefaultSolidDefaultHover
                ),
                disabledAlpha: 0.4,
                loadingAlpha: 0
            )
        )
    }
    static var all: [CounterAppearanceVariation] {
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

