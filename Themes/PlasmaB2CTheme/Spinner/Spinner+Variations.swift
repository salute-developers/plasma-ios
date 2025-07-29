import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore



public extension ComponentAppearanceVariation<Spinner, SpinnerAppearance> {
    var `default`: AppearanceVariation<SpinnerAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<SpinnerAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var info: AppearanceVariation<SpinnerAppearance> {
        return .init(
            name: "info",
            appearance: appearance.info
        )
    }
    var negative: AppearanceVariation<SpinnerAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<SpinnerAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<SpinnerAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<SpinnerAppearance> {
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

private extension SpinnerAppearance {
    
    var `default`: SpinnerAppearance {
        var appearance = self
        appearance.endColor = ColorToken.surfaceDefaultTransparentPrimary
        appearance.startColor = ColorToken.surfaceDefaultSolidDefault
        return appearance
    }
    
    var accent: SpinnerAppearance {
        var appearance = self
        appearance.endColor = ColorToken.surfaceDefaultTransparentAccent
        appearance.startColor = ColorToken.surfaceDefaultAccent
        return appearance
    }
    
    var info: SpinnerAppearance {
        var appearance = self
        appearance.endColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.startColor = ColorToken.surfaceDefaultInfo
        return appearance
    }
    
    var negative: SpinnerAppearance {
        var appearance = self
        appearance.endColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.startColor = ColorToken.surfaceDefaultNegative
        return appearance
    }
    
    var positive: SpinnerAppearance {
        var appearance = self
        appearance.endColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.startColor = ColorToken.surfaceDefaultPositive
        return appearance
    }
    
    var secondary: SpinnerAppearance {
        var appearance = self
        appearance.endColor = ColorToken.surfaceDefaultTransparentPrimary.withOpacity(0.32)
        appearance.startColor = ColorToken.surfaceDefaultSolidDefault.withOpacity(0.32)
        return appearance
    }
    
    var warning: SpinnerAppearance {
        var appearance = self
        appearance.endColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.startColor = ColorToken.surfaceDefaultWarning
        return appearance
    }
    
}
