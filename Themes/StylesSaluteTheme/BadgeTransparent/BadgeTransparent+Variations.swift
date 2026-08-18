import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<BadgeTransparent, BadgeAppearance, BadgeTransparentVariation.L> {
    
    var l: GeneralAppearanceVariation<BadgeTransparent, BadgeAppearance, BadgeTransparentVariation.L> {
        var size =  BadgeTransparentAnySize(size: appearance.size)
        size.cornerRadius = ShapeToken.roundS.cornerRadius
        size.endContentPadding = CGFloat(4.0)
        size.endContentSize = CGSize(width:16.0, height:16.0)
        size.endPadding = CGFloat(11.0)
        size.height = CGFloat(28.0)
        size.startContentPadding = CGFloat(4.0)
        size.startContentSize = CGSize(width:16.0, height:16.0)
        size.startPadding = CGFloat(11.0)

        var appearance = appearance
        appearance.size = size
        appearance.labelTypography = BadgeTransparentTypography(l: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<BadgeTransparent, BadgeAppearance> {
        var size =  BadgeTransparentAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<BadgeTransparent, BadgeAppearance, BadgeTransparentVariation.LPilled> {
    
    var pilled: ComponentAppearanceVariation<BadgeTransparent, BadgeAppearance> {
        var size =  BadgeTransparentAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<BadgeTransparent, BadgeAppearance, BadgeTransparentVariation.M> {
    
    var m: GeneralAppearanceVariation<BadgeTransparent, BadgeAppearance, BadgeTransparentVariation.M> {
        var size =  BadgeTransparentAnySize(size: appearance.size)
        size.cornerRadius = ShapeToken.roundXs.cornerRadius
        size.endContentPadding = CGFloat(3.0)
        size.endContentSize = CGSize(width:12.0, height:12.0)
        size.endPadding = CGFloat(9.0)
        size.height = CGFloat(24.0)
        size.startContentPadding = CGFloat(3.0)
        size.startContentSize = CGSize(width:12.0, height:12.0)
        size.startPadding = CGFloat(9.0)

        var appearance = appearance
        appearance.size = size
        appearance.labelTypography = BadgeTransparentTypography(m: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<BadgeTransparent, BadgeAppearance> {
        var size =  BadgeTransparentAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<BadgeTransparent, BadgeAppearance, BadgeTransparentVariation.MPilled> {
    
    var pilled: ComponentAppearanceVariation<BadgeTransparent, BadgeAppearance> {
        var size =  BadgeTransparentAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<BadgeTransparent, BadgeAppearance, BadgeTransparentVariation.S> {
    
    var pilled: ComponentAppearanceVariation<BadgeTransparent, BadgeAppearance> {
        var size =  BadgeTransparentAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.pilled",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<BadgeTransparent, BadgeAppearance, BadgeTransparentVariation.S> {
        var size =  BadgeTransparentAnySize(size: appearance.size)
        size.cornerRadius = ShapeToken.roundXs.cornerRadius
        size.endContentPadding = CGFloat(2.0)
        size.endContentSize = CGSize(width:12.0, height:12.0)
        size.endPadding = CGFloat(7.0)
        size.height = CGFloat(20.0)
        size.startContentPadding = CGFloat(2.0)
        size.startContentSize = CGSize(width:12.0, height:12.0)
        size.startPadding = CGFloat(7.0)

        var appearance = appearance
        appearance.size = size
        appearance.labelTypography = BadgeTransparentTypography(s: AdaptiveTypographyToken.bodyXxsNormal.typography).asContainer
    
        return .init(
            name: "s",
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

public extension GeneralAppearanceVariation<BadgeTransparent, BadgeAppearance, BadgeTransparentVariation.SPilled> {
    
    var pilled: ComponentAppearanceVariation<BadgeTransparent, BadgeAppearance> {
        var size =  BadgeTransparentAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<BadgeTransparent, BadgeAppearance, BadgeTransparentVariation.Xs> {
    
    var pilled: ComponentAppearanceVariation<BadgeTransparent, BadgeAppearance> {
        var size =  BadgeTransparentAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.pilled",
            appearance: appearance
        )
    }
    
    var xs: GeneralAppearanceVariation<BadgeTransparent, BadgeAppearance, BadgeTransparentVariation.Xs> {
        var size =  BadgeTransparentAnySize(size: appearance.size)
        size.cornerRadius = ShapeToken.roundXxs.cornerRadius
        size.endContentPadding = CGFloat(2.0)
        size.endContentSize = CGSize(width:10.0, height:10.0)
        size.endPadding = CGFloat(4.0)
        size.height = CGFloat(16.0)
        size.startContentPadding = CGFloat(2.0)
        size.startContentSize = CGSize(width:10.0, height:10.0)
        size.startPadding = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.labelTypography = BadgeTransparentTypography(xs: AdaptiveTypographyToken.bodyXxsNormal.typography).asContainer
    
        return .init(
            name: "xs",
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

public extension GeneralAppearanceVariation<BadgeTransparent, BadgeAppearance, BadgeTransparentVariation.XsPilled> {
    
    var pilled: ComponentAppearanceVariation<BadgeTransparent, BadgeAppearance> {
        var size =  BadgeTransparentAnySize(size: appearance.size)
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


public extension ComponentAppearanceVariation<BadgeTransparent, BadgeAppearance> {
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
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultTransparentSecondary), values: [])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [])
        appearance.labelColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [])
        return appearance
    }
    
    var accent: BadgeAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultTransparentAccentMain), values: [])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultAccentMain), values: [])
        appearance.labelColor = StatefulFillStyle(defaultValue: .color(.textDefaultAccentMain), values: [])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultAccentMain), values: [])
        return appearance
    }
    
    var dark: BadgeAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceOnLightTransparentDeep), values: [])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textOnDarkPrimary), values: [])
        appearance.labelColor = StatefulFillStyle(defaultValue: .color(.textOnDarkPrimary), values: [])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textOnDarkPrimary), values: [])
        return appearance
    }
    
    var light: BadgeAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceOnDarkTransparentSecondary), values: [])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textOnDarkPrimary), values: [])
        appearance.labelColor = StatefulFillStyle(defaultValue: .color(.textOnDarkPrimary), values: [])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textOnDarkPrimary), values: [])
        return appearance
    }
    
    var negative: BadgeAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultTransparentNegative), values: [])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultNegative), values: [])
        appearance.labelColor = StatefulFillStyle(defaultValue: .color(.textDefaultNegative), values: [])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultNegative), values: [])
        return appearance
    }
    
    var positive: BadgeAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultTransparentPositive), values: [])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPositive), values: [])
        appearance.labelColor = StatefulFillStyle(defaultValue: .color(.textDefaultPositive), values: [])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPositive), values: [])
        return appearance
    }
    
    var warning: BadgeAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultTransparentWarning), values: [])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultWarning), values: [])
        appearance.labelColor = StatefulFillStyle(defaultValue: .color(.textDefaultWarning), values: [])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultWarning), values: [])
        return appearance
    }
    
}

