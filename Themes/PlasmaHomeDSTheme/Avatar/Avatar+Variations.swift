import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<Avatar, AvatarAppearance, AvatarVariation.L> {
    
    var l: GeneralAppearanceVariation<Avatar, AvatarAppearance, AvatarVariation.L> {
        var size =  AvatarAnySize(size: appearance.size)
        size.avatarSize = CGSize(width:48.0, height:48.0)
        size.extraOffset = CGPoint(x:2.0, y:2.0)
        size.statusInsets = EdgeInsets(top: 0.0, leading: 0.0, bottom: 3.0, trailing: 1.0)

        var appearance = appearance
        appearance.size = size
        appearance.badgeAppearance = Badge.s.pilled.accent.appearance
        appearance.counterAppearance = Counter.s.negative.appearance
        appearance.indicatorAppearance = Indicator.m.appearance
        appearance.textTypography = AvatarTypography(l: AdaptiveTypographyToken.headerH4Bold.typography).asContainer
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
        var size =  AvatarAnySize(size: appearance.size)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.statusInsets = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.pilled",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Avatar, AvatarAppearance, AvatarVariation.LPilled> {
    
    var pilled: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
        var size =  AvatarAnySize(size: appearance.size)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.statusInsets = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.pilled",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Avatar, AvatarAppearance, AvatarVariation.M> {
    
    var m: GeneralAppearanceVariation<Avatar, AvatarAppearance, AvatarVariation.M> {
        var size =  AvatarAnySize(size: appearance.size)
        size.avatarSize = CGSize(width:36.0, height:36.0)
        size.extraOffset = CGPoint(x:2.0, y:2.0)
        size.statusInsets = EdgeInsets(top: 0.0, leading: 0.0, bottom: 2.0, trailing: 0.0)

        var appearance = appearance
        appearance.size = size
        appearance.badgeAppearance = Badge.xs.pilled.accent.appearance
        appearance.counterAppearance = Counter.xs.negative.appearance
        appearance.indicatorAppearance = Indicator.m.appearance
        appearance.textTypography = AvatarTypography(m: AdaptiveTypographyToken.bodySBold.typography).asContainer
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
        var size =  AvatarAnySize(size: appearance.size)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
        size.statusInsets = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.pilled",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Avatar, AvatarAppearance, AvatarVariation.MPilled> {
    
    var pilled: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
        var size =  AvatarAnySize(size: appearance.size)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
        size.statusInsets = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.pilled",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Avatar, AvatarAppearance, AvatarVariation.S> {
    
    var pilled: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
        var size =  AvatarAnySize(size: appearance.size)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
        size.statusInsets = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.pilled",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<Avatar, AvatarAppearance, AvatarVariation.S> {
        var size =  AvatarAnySize(size: appearance.size)
        size.avatarSize = CGSize(width:24.0, height:24.0)
        size.extraOffset = CGPoint(x:1.0, y:1.0)
        size.statusInsets = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)

        var appearance = appearance
        appearance.size = size
        appearance.counterAppearance = Counter.xxs.negative.appearance
        appearance.indicatorAppearance = Indicator.s.appearance
        appearance.textTypography = AvatarTypography(s: AdaptiveTypographyToken.bodyXxsBold.typography).asContainer
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Avatar, AvatarAppearance, AvatarVariation.SPilled> {
    
    var pilled: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
        var size =  AvatarAnySize(size: appearance.size)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
        size.statusInsets = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.pilled",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Avatar, AvatarAppearance, AvatarVariation.Xxl> {
    
    var pilled: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
        var size =  AvatarAnySize(size: appearance.size)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXl.cornerRadius-2.0) as PathDrawer
        size.statusInsets = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xxl.pilled",
            appearance: appearance
        )
    }
    
    var xxl: GeneralAppearanceVariation<Avatar, AvatarAppearance, AvatarVariation.Xxl> {
        var size =  AvatarAnySize(size: appearance.size)
        size.avatarSize = CGSize(width:88.0, height:88.0)
        size.extraOffset = CGPoint(x:0.0, y:0.0)
        size.statusInsets = EdgeInsets(top: 0.0, leading: 0.0, bottom: 7.0, trailing: 1.0)

        var appearance = appearance
        appearance.size = size
        appearance.badgeAppearance = Badge.l.pilled.accent.appearance
        appearance.counterAppearance = Counter.l.negative.appearance
        appearance.indicatorAppearance = Indicator.l.appearance
        appearance.textTypography = AvatarTypography(xxl: AdaptiveTypographyToken.headerH2Bold.typography).asContainer
    
        return .init(
            name: "xxl",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Avatar, AvatarAppearance, AvatarVariation.XxlPilled> {
    
    var pilled: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
        var size =  AvatarAnySize(size: appearance.size)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXl.cornerRadius-2.0) as PathDrawer
        size.statusInsets = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xxl.pilled",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<Avatar, AvatarAppearance> {
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension AvatarAppearance {
    
}
