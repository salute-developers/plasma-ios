import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<Indicator, IndicatorAppearance, IndicatorVariation.L> {
    
    var l: ComponentAppearanceVariation<Indicator, IndicatorAppearance> {
        var size =  IndicatorAnySize(size: appearance.size)
        size.height = CGFloat(12.0)
        size.width = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var black: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
        )
    }
    var dark: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var inactive: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "inactive",
            appearance: appearance.inactive
        )
    }
    var negative: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var white: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "white",
            appearance: appearance.white
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.black,
                self.dark,
                self.inactive,
                self.negative,
                self.positive,
                self.warning,
                self.white,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Indicator, IndicatorAppearance, IndicatorVariation.M> {
    
    var m: ComponentAppearanceVariation<Indicator, IndicatorAppearance> {
        var size =  IndicatorAnySize(size: appearance.size)
        size.height = CGFloat(8.0)
        size.width = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var black: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
        )
    }
    var dark: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var inactive: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "inactive",
            appearance: appearance.inactive
        )
    }
    var negative: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var white: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "white",
            appearance: appearance.white
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.black,
                self.dark,
                self.inactive,
                self.negative,
                self.positive,
                self.warning,
                self.white,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Indicator, IndicatorAppearance, IndicatorVariation.S> {
    
    var s: ComponentAppearanceVariation<Indicator, IndicatorAppearance> {
        var size =  IndicatorAnySize(size: appearance.size)
        size.height = CGFloat(6.0)
        size.width = CGFloat(6.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var black: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
        )
    }
    var dark: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var inactive: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "inactive",
            appearance: appearance.inactive
        )
    }
    var negative: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var white: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "white",
            appearance: appearance.white
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.black,
                self.dark,
                self.inactive,
                self.negative,
                self.positive,
                self.warning,
                self.white,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<Indicator, IndicatorAppearance> {
    var `default`: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var black: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
        )
    }
    var dark: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var inactive: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "inactive",
            appearance: appearance.inactive
        )
    }
    var negative: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var white: AppearanceVariation<IndicatorAppearance> {
        return .init(
            name: "white",
            appearance: appearance.white
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.black,
                self.dark,
                self.inactive,
                self.negative,
                self.positive,
                self.warning,
                self.white,
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension IndicatorAppearance {
    
    var `default`: IndicatorAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidDefault
        return appearance
    }
    
    var accent: IndicatorAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultAccentMain
        return appearance
    }
    
    var black: IndicatorAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceOnLightSolidDefault
        return appearance
    }
    
    var dark: IndicatorAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceOnLightTransparentDeep
        return appearance
    }
    
    var inactive: IndicatorAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidTertiary
        return appearance
    }
    
    var negative: IndicatorAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultNegative
        return appearance
    }
    
    var positive: IndicatorAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultPositive
        return appearance
    }
    
    var warning: IndicatorAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultWarning
        return appearance
    }
    
    var white: IndicatorAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceOnDarkSolidDefault
        return appearance
    }
    
}
