import Foundation
import SDDSComponents
import SDDSThemeCore

public extension ComponentAppearanceVariation<Counter, CounterAppearance> {
    var black: AppearanceVariation<CounterAppearance> {
        var appearance = Counter.black.appearance
        appearance.size = self.appearance.size
        
        return .init(name: "black", appearance: appearance)
    }
    
    var negative: AppearanceVariation<CounterAppearance> {
        var appearance = Counter.negative.appearance
        appearance.size = self.appearance.size
        
        return .init(name: "negative", appearance: appearance)
    }
    
    var warning: AppearanceVariation<CounterAppearance> {
        var appearance = Counter.warning.appearance
        appearance.size = self.appearance.size
        
        return .init(name: "warning", appearance: appearance)
    }
    
    var positive: AppearanceVariation<CounterAppearance> {
        var appearance = Counter.positive.appearance
        appearance.size = self.appearance.size
        
        return .init(name: "positive", appearance: appearance)
    }
    
    var accent: AppearanceVariation<CounterAppearance> {
        var appearance = Counter.accent.appearance
        appearance.size = self.appearance.size
        
        return .init(name: "accent", appearance: appearance)
    }
    
    var white: AppearanceVariation<CounterAppearance> {
        var appearance = Counter.white.appearance
        appearance.size = self.appearance.size
        
        return .init(name: "white", appearance: appearance)
    }
    
    var `default`: AppearanceVariation<CounterAppearance> {
        var appearance = Counter.black.appearance
        appearance.size = self.appearance.size
        
        return .init(name: "default", appearance: appearance)
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.black,
                self.negative,
                self.warning,
                self.positive,
                self.accent,
                self.white
            ],
            name: name,
            appearance: appearance
        )
    }
}

extension Counter {
    static var black: AppearanceVariation<CounterAppearance> {
        .init(
            name: "black",
            appearance: .init(
                textTypography: CounterTypography.textTypography,
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
                textTypography: CounterTypography.textTypography,
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
                textTypography: CounterTypography.textTypography,
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
                textTypography: CounterTypography.textTypography,
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
                textTypography: CounterTypography.textTypography,
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
                textTypography: CounterTypography.textTypography,
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
                textTypography: CounterTypography.textTypography,
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
}
