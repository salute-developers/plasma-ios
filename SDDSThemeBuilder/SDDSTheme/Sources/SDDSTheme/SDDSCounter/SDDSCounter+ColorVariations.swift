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
    static var negative: CounterAppearanceVariation {
        .init(
            name: "negative",
            appearance: CounterAppearance(
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
    static var warning: CounterAppearanceVariation {
        .init(
            name: "warning",
            appearance: CounterAppearance(
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
    static var positive: CounterAppearanceVariation {
        .init(
            name: "positive",
            appearance: CounterAppearance(
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
    static var accent: CounterAppearanceVariation {
        .init(
            name: "accent",
            appearance: CounterAppearance(
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
    static var white: CounterAppearanceVariation {
        .init(
            name: "white",
            appearance: CounterAppearance(
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
    static var `default`: CounterAppearanceVariation {
        .init(
            name: "default",
            appearance: CounterAppearance(
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

