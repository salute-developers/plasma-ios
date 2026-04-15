import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<Avatar, AvatarAppearance, AvatarVariation.L> {
    
    var l: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
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
    
    var m: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
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
    
    var s: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
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

public extension GeneralAppearanceVariation<Avatar, AvatarAppearance, AvatarVariation.Xxl> {
    
    var xxl: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
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
