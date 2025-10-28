import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<Counter, CounterAppearance, CounterVariation.L> {
    
    var l: ComponentAppearanceVariation<Counter, CounterAppearance> {
        var size =  CounterAnySize(size: appearance.size)
        size.height = CGFloat(28.0)
        size.paddings = EdgeInsets(top: 5.0, leading: 10.0, bottom: 5.0, trailing: 10.0)
        size.width = CGFloat(28.0)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = CounterTypography(l: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var black: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
        )
    }
    var negative: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var white: AppearanceVariation<CounterAppearance> {
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

public extension GeneralAppearanceVariation<Counter, CounterAppearance, CounterVariation.M> {
    
    var m: ComponentAppearanceVariation<Counter, CounterAppearance> {
        var size =  CounterAnySize(size: appearance.size)
        size.height = CGFloat(24.0)
        size.paddings = EdgeInsets(top: 5.0, leading: 8.0, bottom: 5.0, trailing: 8.0)
        size.width = CGFloat(24.0)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = CounterTypography(m: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var black: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
        )
    }
    var negative: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var white: AppearanceVariation<CounterAppearance> {
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

public extension GeneralAppearanceVariation<Counter, CounterAppearance, CounterVariation.S> {
    
    var s: ComponentAppearanceVariation<Counter, CounterAppearance> {
        var size =  CounterAnySize(size: appearance.size)
        size.height = CGFloat(20.0)
        size.paddings = EdgeInsets(top: 4.0, leading: 6.0, bottom: 4.0, trailing: 6.0)
        size.width = CGFloat(20.0)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = CounterTypography(s: AdaptiveTypographyToken.bodyXxsNormal.typography).asContainer
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var black: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
        )
    }
    var negative: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var white: AppearanceVariation<CounterAppearance> {
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

public extension GeneralAppearanceVariation<Counter, CounterAppearance, CounterVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<Counter, CounterAppearance> {
        var size =  CounterAnySize(size: appearance.size)
        size.height = CGFloat(16.0)
        size.paddings = EdgeInsets(top: 1.5, leading: 4.0, bottom: 2.5, trailing: 4.0)
        size.width = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = CounterTypography(xs: AdaptiveTypographyToken.bodyXxsNormal.typography).asContainer
    
        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var black: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
        )
    }
    var negative: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var white: AppearanceVariation<CounterAppearance> {
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

public extension GeneralAppearanceVariation<Counter, CounterAppearance, CounterVariation.Xxs> {
    
    var xxs: ComponentAppearanceVariation<Counter, CounterAppearance> {
        var size =  CounterAnySize(size: appearance.size)
        size.height = CGFloat(12.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 2.0, bottom: 0.0, trailing: 2.0)
        size.width = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = CounterTypography(xxs: AdaptiveTypographyToken.bodyXxsNormal.typography).asContainer
    
        return .init(
            name: "xxs",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var black: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
        )
    }
    var negative: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var white: AppearanceVariation<CounterAppearance> {
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


public extension ComponentAppearanceVariation<Counter, CounterAppearance> {
    var `default`: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var black: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
        )
    }
    var negative: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var white: AppearanceVariation<CounterAppearance> {
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

private extension CounterAppearance {
    
    var `default`: CounterAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultSolidDefault, highlightedColor: ColorToken.surfaceDefaultSolidDefaultActive, hoveredColor: ColorToken.surfaceDefaultSolidDefaultHover, selectedColor: ColorToken.surfaceDefaultSolidDefault)
        appearance.textColor = ButtonColor(defaultColor: ColorToken.textInversePrimary, highlightedColor: ColorToken.textInversePrimaryActive, hoveredColor: ColorToken.textInversePrimaryHover, selectedColor: ColorToken.textInversePrimary)
        return appearance
    }
    
    var accent: CounterAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultAccent, highlightedColor: ColorToken.surfaceDefaultAccentActive, hoveredColor: ColorToken.surfaceDefaultAccentHover, selectedColor: ColorToken.surfaceDefaultAccent)
        appearance.textColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        return appearance
    }
    
    var black: CounterAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceOnLightSolidDefault, highlightedColor: ColorToken.surfaceOnLightSolidDefaultActive, hoveredColor: ColorToken.surfaceOnLightSolidDefaultHover, selectedColor: ColorToken.surfaceOnLightSolidDefault)
        appearance.textColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        return appearance
    }
    
    var negative: CounterAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultNegative, highlightedColor: ColorToken.surfaceDefaultNegativeActive, hoveredColor: ColorToken.surfaceDefaultNegativeHover, selectedColor: ColorToken.surfaceDefaultNegative)
        appearance.textColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        return appearance
    }
    
    var positive: CounterAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultPositive, highlightedColor: ColorToken.surfaceDefaultPositiveActive, hoveredColor: ColorToken.surfaceDefaultPositiveHover, selectedColor: ColorToken.surfaceDefaultPositive)
        appearance.textColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        return appearance
    }
    
    var warning: CounterAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultWarning, highlightedColor: ColorToken.surfaceDefaultWarningActive, hoveredColor: ColorToken.surfaceDefaultWarningHover, selectedColor: ColorToken.surfaceDefaultWarning)
        appearance.textColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        return appearance
    }
    
    var white: CounterAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceOnDarkSolidDefault, highlightedColor: ColorToken.surfaceOnDarkSolidDefaultActive, hoveredColor: ColorToken.surfaceOnDarkSolidDefaultHover, selectedColor: ColorToken.surfaceOnDarkSolidDefault)
        appearance.textColor = ButtonColor(defaultColor: ColorToken.textOnLightPrimary, highlightedColor: ColorToken.textOnLightPrimaryActive, hoveredColor: ColorToken.textOnLightPrimaryHover, selectedColor: ColorToken.textOnLightPrimary)
        return appearance
    }
    
}
