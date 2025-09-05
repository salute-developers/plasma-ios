import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<ProgressBar, ProgressBarAppearance, ProgressBarVariation.Default> {
    
    var `default`: AppearanceVariation<ProgressBarAppearance> {
        var appearance = appearance
        appearance.tintFillStyle = .color(.surfaceDefaultSolidDefault)
        appearance.trackColor = ColorToken.surfaceDefaultTransparentSecondary
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<ProgressBarAppearance> {
        var appearance = appearance
        appearance.tintFillStyle = .color(.surfaceDefaultAccent)
        appearance.trackColor = ColorToken.surfaceDefaultTransparentSecondary
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var gradient: AppearanceVariation<ProgressBarAppearance> {
        var appearance = appearance
        appearance.tintFillStyle = .gradient(GradientToken.surfaceDefaultAccentGradient)
        appearance.trackColor = ColorToken.surfaceDefaultTransparentSecondary
        
        return .init(
            name: "gradient",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<ProgressBarAppearance> {
        var appearance = appearance
        appearance.tintFillStyle = .color(.surfaceDefaultInfo)
        appearance.trackColor = ColorToken.surfaceDefaultTransparentSecondary
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<ProgressBarAppearance> {
        var appearance = appearance
        appearance.tintFillStyle = .color(.surfaceDefaultNegative)
        appearance.trackColor = ColorToken.surfaceDefaultTransparentSecondary
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<ProgressBarAppearance> {
        var appearance = appearance
        appearance.tintFillStyle = .color(.surfaceDefaultPositive)
        appearance.trackColor = ColorToken.surfaceDefaultTransparentSecondary
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<ProgressBarAppearance> {
        var appearance = appearance
        appearance.tintFillStyle = .color(.surfaceDefaultTransparentTertiary)
        appearance.trackColor = ColorToken.surfaceDefaultTransparentSecondary
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<ProgressBarAppearance> {
        var appearance = appearance
        appearance.tintFillStyle = .color(.surfaceDefaultWarning)
        appearance.trackColor = ColorToken.surfaceDefaultTransparentSecondary
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<ProgressBarAppearance> {
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


public extension ComponentAppearanceVariation<ProgressBar, ProgressBarAppearance> {
    var `default`: AppearanceVariation<ProgressBarAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ProgressBarAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var gradient: AppearanceVariation<ProgressBarAppearance> {
        return .init(
            name: "gradient",
            appearance: appearance.gradient
        )
    }
    var info: AppearanceVariation<ProgressBarAppearance> {
        return .init(
            name: "info",
            appearance: appearance.info
        )
    }
    var negative: AppearanceVariation<ProgressBarAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ProgressBarAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ProgressBarAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ProgressBarAppearance> {
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

private extension ProgressBarAppearance {
    
    var `default`: ProgressBarAppearance {
        var appearance = self
        appearance.tintFillStyle = .color(.surfaceDefaultSolidDefault)
        appearance.trackColor = ColorToken.surfaceDefaultTransparentSecondary
        return appearance
    }
    
    var accent: ProgressBarAppearance {
        var appearance = self
        appearance.tintFillStyle = .color(.surfaceDefaultAccent)
        appearance.trackColor = ColorToken.surfaceDefaultTransparentSecondary
        return appearance
    }
    
    var gradient: ProgressBarAppearance {
        var appearance = self
        appearance.tintFillStyle = .gradient(GradientToken.surfaceDefaultAccentGradient)
        appearance.trackColor = ColorToken.surfaceDefaultTransparentSecondary
        return appearance
    }
    
    var info: ProgressBarAppearance {
        var appearance = self
        appearance.tintFillStyle = .color(.surfaceDefaultInfo)
        appearance.trackColor = ColorToken.surfaceDefaultTransparentSecondary
        return appearance
    }
    
    var negative: ProgressBarAppearance {
        var appearance = self
        appearance.tintFillStyle = .color(.surfaceDefaultNegative)
        appearance.trackColor = ColorToken.surfaceDefaultTransparentSecondary
        return appearance
    }
    
    var positive: ProgressBarAppearance {
        var appearance = self
        appearance.tintFillStyle = .color(.surfaceDefaultPositive)
        appearance.trackColor = ColorToken.surfaceDefaultTransparentSecondary
        return appearance
    }
    
    var secondary: ProgressBarAppearance {
        var appearance = self
        appearance.tintFillStyle = .color(.surfaceDefaultTransparentTertiary)
        appearance.trackColor = ColorToken.surfaceDefaultTransparentSecondary
        return appearance
    }
    
    var warning: ProgressBarAppearance {
        var appearance = self
        appearance.tintFillStyle = .color(.surfaceDefaultWarning)
        appearance.trackColor = ColorToken.surfaceDefaultTransparentSecondary
        return appearance
    }
    
}
