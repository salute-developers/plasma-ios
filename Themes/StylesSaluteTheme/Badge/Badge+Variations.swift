import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<Badge, BadgeAppearance, BadgeVariation.L> {
    
    var pilled: ComponentAppearanceVariation<Badge, BadgeAppearance> {
        var size =  BadgeAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var dark: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var light: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "light",
            appearance: appearance.light
        )
    }
    var negative: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<BadgeAppearance> {
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
                self.dark,
                self.light,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
}

public extension GeneralAppearanceVariation<Badge, BadgeAppearance, BadgeVariation.M> {
    
    var pilled: ComponentAppearanceVariation<Badge, BadgeAppearance> {
        var size =  BadgeAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var dark: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var light: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "light",
            appearance: appearance.light
        )
    }
    var negative: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<BadgeAppearance> {
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
                self.dark,
                self.light,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
}

public extension GeneralAppearanceVariation<Badge, BadgeAppearance, BadgeVariation.S> {
    
    var pilled: ComponentAppearanceVariation<Badge, BadgeAppearance> {
        var size =  BadgeAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var dark: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var light: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "light",
            appearance: appearance.light
        )
    }
    var negative: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<BadgeAppearance> {
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
                self.dark,
                self.light,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
}

public extension GeneralAppearanceVariation<Badge, BadgeAppearance, BadgeVariation.Xs> {
    
    var pilled: ComponentAppearanceVariation<Badge, BadgeAppearance> {
        var size =  BadgeAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var dark: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var light: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "light",
            appearance: appearance.light
        )
    }
    var negative: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<BadgeAppearance> {
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
                self.dark,
                self.light,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
}

public extension ComponentAppearanceVariation<Badge, BadgeAppearance> {
    var `default`: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var dark: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var light: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "light",
            appearance: appearance.light
        )
    }
    var negative: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<BadgeAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<BadgeAppearance> {
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
                self.dark,
                self.light,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension BadgeAppearance {
    
    var `default`: BadgeAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidDefault
        appearance.endContentColor = ColorToken.textInversePrimary
        appearance.labelColor = ColorToken.textInversePrimary
        appearance.startContentColor = ColorToken.textInversePrimary
        return appearance
    }
    
    var accent: BadgeAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultAccentMain
        appearance.endContentColor = ColorToken.textOnDarkPrimary
        appearance.labelColor = ColorToken.textOnDarkPrimary
        appearance.startContentColor = ColorToken.textOnDarkPrimary
        return appearance
    }
    
    var dark: BadgeAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceOnLightSolidDefault
        appearance.endContentColor = ColorToken.textOnDarkPrimary
        appearance.labelColor = ColorToken.textOnDarkPrimary
        appearance.startContentColor = ColorToken.textOnDarkPrimary
        return appearance
    }
    
    var light: BadgeAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceOnDarkSolidDefault
        appearance.endContentColor = ColorToken.textOnLightPrimary
        appearance.labelColor = ColorToken.textOnLightPrimary
        appearance.startContentColor = ColorToken.textOnLightPrimary
        return appearance
    }
    
    var negative: BadgeAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultNegative
        appearance.endContentColor = ColorToken.textOnDarkPrimary
        appearance.labelColor = ColorToken.textOnDarkPrimary
        appearance.startContentColor = ColorToken.textOnDarkPrimary
        return appearance
    }
    
    var positive: BadgeAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultPositive
        appearance.endContentColor = ColorToken.textOnDarkPrimary
        appearance.labelColor = ColorToken.textOnDarkPrimary
        appearance.startContentColor = ColorToken.textOnDarkPrimary
        return appearance
    }
    
    var warning: BadgeAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultWarning
        appearance.endContentColor = ColorToken.textOnDarkPrimary
        appearance.labelColor = ColorToken.textOnDarkPrimary
        appearance.startContentColor = ColorToken.textOnDarkPrimary
        return appearance
    }
    
}
