import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.L> {
    
    var l: GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.L> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.height = CGFloat(56.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 16.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
        size.spinnerSize = CGSize(width:22.0, height:22.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.pathDrawer = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var black: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
        )
    }
    var clear: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "clear",
            appearance: appearance.clear
        )
    }
    var dark: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var white: AppearanceVariation<ButtonAppearance> {
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
                self.clear,
                self.dark,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
                self.white,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.LPilled> {
    
    var pilled: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.pathDrawer = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var black: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
        )
    }
    var clear: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "clear",
            appearance: appearance.clear
        )
    }
    var dark: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var white: AppearanceVariation<ButtonAppearance> {
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
                self.clear,
                self.dark,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
                self.white,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.M> {
    
    var m: GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.M> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.height = CGFloat(48.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 12.0, bottom: 0.0, trailing: 12.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.spinnerSize = CGSize(width:22.0, height:22.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.pathDrawer = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var black: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
        )
    }
    var clear: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "clear",
            appearance: appearance.clear
        )
    }
    var dark: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var white: AppearanceVariation<ButtonAppearance> {
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
                self.clear,
                self.dark,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
                self.white,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.MPilled> {
    
    var pilled: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.pathDrawer = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var black: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
        )
    }
    var clear: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "clear",
            appearance: appearance.clear
        )
    }
    var dark: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var white: AppearanceVariation<ButtonAppearance> {
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
                self.clear,
                self.dark,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
                self.white,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.S> {
    
    var pilled: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.pathDrawer = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.pilled",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.S> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.height = CGFloat(40.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 8.0, bottom: 0.0, trailing: 8.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
        size.spinnerSize = CGSize(width:22.0, height:22.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var black: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
        )
    }
    var clear: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "clear",
            appearance: appearance.clear
        )
    }
    var dark: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var white: AppearanceVariation<ButtonAppearance> {
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
                self.clear,
                self.dark,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
                self.white,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.SPilled> {
    
    var pilled: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.pathDrawer = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var black: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
        )
    }
    var clear: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "clear",
            appearance: appearance.clear
        )
    }
    var dark: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var white: AppearanceVariation<ButtonAppearance> {
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
                self.clear,
                self.dark,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
                self.white,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.Xl> {
    
    var pilled: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.pathDrawer = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xl.pilled",
            appearance: appearance
        )
    }
    
    var xl: GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.Xl> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.height = CGFloat(64.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer
        size.spinnerSize = CGSize(width:24.0, height:24.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var black: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
        )
    }
    var clear: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "clear",
            appearance: appearance.clear
        )
    }
    var dark: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var white: AppearanceVariation<ButtonAppearance> {
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
                self.clear,
                self.dark,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
                self.white,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.XlPilled> {
    
    var pilled: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.pathDrawer = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xl.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var black: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
        )
    }
    var clear: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "clear",
            appearance: appearance.clear
        )
    }
    var dark: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var white: AppearanceVariation<ButtonAppearance> {
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
                self.clear,
                self.dark,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
                self.white,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.Xs> {
    
    var pilled: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.pathDrawer = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.pilled",
            appearance: appearance
        )
    }
    
    var xs: GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.Xs> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.height = CGFloat(32.0)
        size.iconSize = CGSize(width:16.0, height:16.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 8.0, bottom: 0.0, trailing: 8.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
        size.spinnerSize = CGSize(width:16.0, height:16.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var black: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
        )
    }
    var clear: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "clear",
            appearance: appearance.clear
        )
    }
    var dark: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var white: AppearanceVariation<ButtonAppearance> {
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
                self.clear,
                self.dark,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
                self.white,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.XsPilled> {
    
    var pilled: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.pathDrawer = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var black: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
        )
    }
    var clear: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "clear",
            appearance: appearance.clear
        )
    }
    var dark: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var white: AppearanceVariation<ButtonAppearance> {
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
                self.clear,
                self.dark,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
                self.white,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.Xxs> {
    
    var pilled: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.pathDrawer = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xxs.pilled",
            appearance: appearance
        )
    }
    
    var xxs: GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.Xxs> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.height = CGFloat(24.0)
        size.iconSize = CGSize(width:12.0, height:12.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 6.0, bottom: 0.0, trailing: 6.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
        size.spinnerSize = CGSize(width:12.0, height:12.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xxs",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var black: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
        )
    }
    var clear: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "clear",
            appearance: appearance.clear
        )
    }
    var dark: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var white: AppearanceVariation<ButtonAppearance> {
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
                self.clear,
                self.dark,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
                self.white,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.XxsPilled> {
    
    var pilled: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var size =  IconButtonAnySize(size: appearance.size)
        size.pathDrawer = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xxs.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var black: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
        )
    }
    var clear: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "clear",
            appearance: appearance.clear
        )
    }
    var dark: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var white: AppearanceVariation<ButtonAppearance> {
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
                self.clear,
                self.dark,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
                self.white,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<IconButton, ButtonAppearance> {
    var `default`: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var black: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "black",
            appearance: appearance.black
        )
    }
    var clear: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "clear",
            appearance: appearance.clear
        )
    }
    var dark: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "dark",
            appearance: appearance.dark
        )
    }
    var negative: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var secondary: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var warning: AppearanceVariation<ButtonAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var white: AppearanceVariation<ButtonAppearance> {
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
                self.clear,
                self.dark,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
                self.white,
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension ButtonAppearance {
    
    var `default`: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultSolidDefault, highlightedColor: ColorToken.surfaceDefaultSolidDefaultActive, hoveredColor: ColorToken.surfaceDefaultSolidDefaultHover, selectedColor: .clearColor)
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textInversePrimary, highlightedColor: ColorToken.textInversePrimaryActive, hoveredColor: ColorToken.textInversePrimaryHover, selectedColor: .clearColor)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textInversePrimary, highlightedColor: ColorToken.textInversePrimaryActive, hoveredColor: ColorToken.textInversePrimaryHover, selectedColor: .clearColor)
        return appearance
    }
    
    var accent: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultAccent, highlightedColor: ColorToken.surfaceDefaultAccentActive, hoveredColor: ColorToken.surfaceDefaultAccentHover, selectedColor: .clearColor)
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        return appearance
    }
    
    var black: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceOnLightSolidDefault, highlightedColor: ColorToken.surfaceOnLightSolidDefaultActive, hoveredColor: ColorToken.surfaceOnLightSolidDefaultHover, selectedColor: .clearColor)
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        return appearance
    }
    
    var clear: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultTransparentSecondaryActive, hoveredColor: ColorToken.surfaceDefaultTransparentSecondaryHover, selectedColor: .clearColor)
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: .clearColor)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: .clearColor)
        return appearance
    }
    
    var dark: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceOnLightTransparentDeep, highlightedColor: ColorToken.surfaceOnLightTransparentDeepActive, hoveredColor: ColorToken.surfaceOnLightTransparentDeepHover, selectedColor: .clearColor)
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        return appearance
    }
    
    var negative: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultNegative, highlightedColor: ColorToken.surfaceDefaultNegativeActive, hoveredColor: ColorToken.surfaceDefaultNegativeHover, selectedColor: .clearColor)
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        return appearance
    }
    
    var positive: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultPositive, highlightedColor: ColorToken.surfaceDefaultPositiveActive, hoveredColor: ColorToken.surfaceDefaultPositiveHover, selectedColor: .clearColor)
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        return appearance
    }
    
    var secondary: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultTransparentSecondary, highlightedColor: ColorToken.surfaceDefaultTransparentSecondaryActive, hoveredColor: ColorToken.surfaceDefaultTransparentSecondaryHover, selectedColor: .clearColor)
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: .clearColor)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: .clearColor)
        return appearance
    }
    
    var warning: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultWarning, highlightedColor: ColorToken.surfaceDefaultWarningActive, hoveredColor: ColorToken.surfaceDefaultWarningHover, selectedColor: .clearColor)
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimaryActive, hoveredColor: ColorToken.textOnDarkPrimaryHover, selectedColor: .clearColor)
        return appearance
    }
    
    var white: ButtonAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceOnDarkSolidDefault, highlightedColor: ColorToken.surfaceOnDarkSolidDefaultActive, hoveredColor: ColorToken.surfaceOnDarkSolidDefaultHover, selectedColor: .clearColor)
        appearance.iconColor = ButtonColor(defaultColor: ColorToken.textOnLightPrimary, highlightedColor: ColorToken.textOnLightPrimaryActive, hoveredColor: ColorToken.textOnLightPrimaryHover, selectedColor: .clearColor)
        appearance.spinnerColor = ButtonColor(defaultColor: ColorToken.textOnLightPrimary, highlightedColor: ColorToken.textOnLightPrimaryActive, hoveredColor: ColorToken.textOnLightPrimaryHover, selectedColor: .clearColor)
        return appearance
    }
    
}
