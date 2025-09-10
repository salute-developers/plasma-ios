import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<CircularProgressBar, CircularProgressBarAppearance, CircularProgressBarVariation.L> {
    
    var l: ComponentAppearanceVariation<CircularProgressBar, CircularProgressBarAppearance> {
        var size =  CircularProgressBarAnySize(size: appearance.size)
        size.height = CGFloat(56.0)
        size.progressThickness = CGFloat(2.0)
        size.trackThickness = CGFloat(2.0)
        size.width = CGFloat(56.0)

        var appearance = appearance
        appearance.size = size
        appearance.valueEnabled = Bool(false)
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<CircularProgressBar, CircularProgressBarAppearance, CircularProgressBarVariation.M> {
    
    var m: ComponentAppearanceVariation<CircularProgressBar, CircularProgressBarAppearance> {
        var size =  CircularProgressBarAnySize(size: appearance.size)
        size.height = CGFloat(48.0)
        size.progressThickness = CGFloat(2.0)
        size.trackThickness = CGFloat(2.0)
        size.width = CGFloat(48.0)

        var appearance = appearance
        appearance.size = size
        appearance.valueEnabled = Bool(false)
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<CircularProgressBar, CircularProgressBarAppearance, CircularProgressBarVariation.S> {
    
    var s: ComponentAppearanceVariation<CircularProgressBar, CircularProgressBarAppearance> {
        var size =  CircularProgressBarAnySize(size: appearance.size)
        size.height = CGFloat(36.0)
        size.progressThickness = CGFloat(2.0)
        size.trackThickness = CGFloat(2.0)
        size.width = CGFloat(36.0)

        var appearance = appearance
        appearance.size = size
        appearance.valueEnabled = Bool(false)
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<CircularProgressBar, CircularProgressBarAppearance, CircularProgressBarVariation.Xl> {
    
    var xl: ComponentAppearanceVariation<CircularProgressBar, CircularProgressBarAppearance> {
        var size =  CircularProgressBarAnySize(size: appearance.size)
        size.height = CGFloat(88.0)
        size.progressThickness = CGFloat(4.0)
        size.trackThickness = CGFloat(4.0)
        size.width = CGFloat(88.0)

        var appearance = appearance
        appearance.size = size
        appearance.valueTypography = CircularProgressBarTypography(xl: AdaptiveTypographyToken.headerH5Bold.typography).asContainer
    
        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<CircularProgressBar, CircularProgressBarAppearance, CircularProgressBarVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<CircularProgressBar, CircularProgressBarAppearance> {
        var size =  CircularProgressBarAnySize(size: appearance.size)
        size.height = CGFloat(24.0)
        size.progressThickness = CGFloat(2.0)
        size.trackThickness = CGFloat(2.0)
        size.width = CGFloat(24.0)

        var appearance = appearance
        appearance.size = size
        appearance.valueEnabled = Bool(false)
    
        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<CircularProgressBar, CircularProgressBarAppearance, CircularProgressBarVariation.Xxl> {
    
    var xxl: ComponentAppearanceVariation<CircularProgressBar, CircularProgressBarAppearance> {
        var size =  CircularProgressBarAnySize(size: appearance.size)
        size.height = CGFloat(128.0)
        size.progressThickness = CGFloat(4.0)
        size.trackThickness = CGFloat(4.0)
        size.width = CGFloat(128.0)

        var appearance = appearance
        appearance.size = size
        appearance.valueTypography = CircularProgressBarTypography(xxl: AdaptiveTypographyToken.headerH2Bold.typography).asContainer
    
        return .init(
            name: "xxl",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<CircularProgressBar, CircularProgressBarAppearance, CircularProgressBarVariation.Xxs> {
    
    var xxs: ComponentAppearanceVariation<CircularProgressBar, CircularProgressBarAppearance> {
        var size =  CircularProgressBarAnySize(size: appearance.size)
        size.height = CGFloat(16.0)
        size.progressThickness = CGFloat(2.0)
        size.trackThickness = CGFloat(2.0)
        size.width = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
        appearance.valueEnabled = Bool(false)
    
        return .init(
            name: "xxs",
            appearance: appearance
        )
    }
    
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
