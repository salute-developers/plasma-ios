import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<Spinner, SpinnerAppearance, SpinnerVariation.L> {
    
    var l: ComponentAppearanceVariation<Spinner, SpinnerAppearance> {
        var size =  SpinnerAnySize(size: appearance.size)
        size.angle = CGFloat(0)
        size.padding = CGFloat(4.0)
        size.size = CGFloat(56.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<Spinner, SpinnerAppearance, SpinnerVariation.M> {
    
    var m: ComponentAppearanceVariation<Spinner, SpinnerAppearance> {
        var size =  SpinnerAnySize(size: appearance.size)
        size.angle = CGFloat(0)
        size.padding = CGFloat(4.0)
        size.size = CGFloat(48.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<Spinner, SpinnerAppearance, SpinnerVariation.S> {
    
    var s: ComponentAppearanceVariation<Spinner, SpinnerAppearance> {
        var size =  SpinnerAnySize(size: appearance.size)
        size.angle = CGFloat(0)
        size.padding = CGFloat(3.0)
        size.size = CGFloat(36.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<Spinner, SpinnerAppearance, SpinnerVariation.Scalable> {
    
    var scalable: ComponentAppearanceVariation<Spinner, SpinnerAppearance> {
        var size =  SpinnerAnySize(size: appearance.size)
        size.angle = CGFloat(0)
        size.padding = CGFloat(0.0)
        size.size = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "scalable",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<Spinner, SpinnerAppearance, SpinnerVariation.Xl> {
    
    var xl: ComponentAppearanceVariation<Spinner, SpinnerAppearance> {
        var size =  SpinnerAnySize(size: appearance.size)
        size.angle = CGFloat(0)
        size.padding = CGFloat(6.0)
        size.size = CGFloat(88.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<Spinner, SpinnerAppearance, SpinnerVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<Spinner, SpinnerAppearance> {
        var size =  SpinnerAnySize(size: appearance.size)
        size.angle = CGFloat(0)
        size.padding = CGFloat(2.0)
        size.size = CGFloat(24.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<Spinner, SpinnerAppearance, SpinnerVariation.Xxl> {
    
    var xxl: ComponentAppearanceVariation<Spinner, SpinnerAppearance> {
        var size =  SpinnerAnySize(size: appearance.size)
        size.angle = CGFloat(0)
        size.padding = CGFloat(8.0)
        size.size = CGFloat(128.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xxl",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<Spinner, SpinnerAppearance, SpinnerVariation.Xxs> {
    
    var xxs: ComponentAppearanceVariation<Spinner, SpinnerAppearance> {
        var size =  SpinnerAnySize(size: appearance.size)
        size.angle = CGFloat(0)
        size.padding = CGFloat(1.0)
        size.size = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xxs",
            appearance: appearance
        )
    }
    
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
