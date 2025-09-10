import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore



public extension ComponentAppearanceVariation<CircularProgressBar, CircularProgressBarAppearance> {
    var `default`: AppearanceVariation<CircularProgressBarAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<CircularProgressBarAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var gradient: AppearanceVariation<CircularProgressBarAppearance> {
        return .init(
            name: "gradient",
            appearance: appearance.gradient
        )
    }
    var info: AppearanceVariation<CircularProgressBarAppearance> {
        return .init(
            name: "info",
            appearance: appearance.info
        )
    }
    var negative: AppearanceVariation<CircularProgressBarAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<CircularProgressBarAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<CircularProgressBarAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<CircularProgressBarAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.gradient,
                self.info,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension CircularProgressBarAppearance {
    
    var `default`: CircularProgressBarAppearance {
        var appearance = self
        appearance.indicatorColor = .color(.surfaceDefaultSolidDefault)
        return appearance
    }
    
    var accent: CircularProgressBarAppearance {
        var appearance = self
        appearance.indicatorColor = .color(.surfaceDefaultAccent)
        return appearance
    }
    
    var gradient: CircularProgressBarAppearance {
        var appearance = self
        appearance.indicatorColor = .gradient(GradientToken.surfaceDefaultAccentGradient)
        return appearance
    }
    
    var info: CircularProgressBarAppearance {
        var appearance = self
        appearance.indicatorColor = .color(.surfaceDefaultInfo)
        return appearance
    }
    
    var negative: CircularProgressBarAppearance {
        var appearance = self
        appearance.indicatorColor = .color(.surfaceDefaultNegative)
        return appearance
    }
    
    var positive: CircularProgressBarAppearance {
        var appearance = self
        appearance.indicatorColor = .color(.surfaceDefaultPositive)
        return appearance
    }
    
    var secondary: CircularProgressBarAppearance {
        var appearance = self
        appearance.indicatorColor = .color(.surfaceDefaultTransparentTertiary)
        return appearance
    }
    
    var warning: CircularProgressBarAppearance {
        var appearance = self
        appearance.indicatorColor = .color(.surfaceDefaultWarning)
        return appearance
    }
    
}
