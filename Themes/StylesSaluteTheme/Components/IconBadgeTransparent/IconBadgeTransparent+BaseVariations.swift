import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct IconBadgeTransparent {
    public static var l: GeneralAppearanceVariation<IconBadgeTransparent, BadgeAppearance, IconBadgeTransparentVariation.L> {
        var appearance = BadgeAppearance.base
        appearance.size = IconBadgeTransparentSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<IconBadgeTransparent, BadgeAppearance, IconBadgeTransparentVariation.M> {
        var appearance = BadgeAppearance.base
        appearance.size = IconBadgeTransparentSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<IconBadgeTransparent, BadgeAppearance, IconBadgeTransparentVariation.S> {
        var appearance = BadgeAppearance.base
        appearance.size = IconBadgeTransparentSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<IconBadgeTransparent, BadgeAppearance, IconBadgeTransparentVariation.Xs> {
        var appearance = BadgeAppearance.base
        appearance.size = IconBadgeTransparentSize.xs

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<BadgeAppearance>] = [
        IconBadgeTransparent.l.variation,
        IconBadgeTransparent.l.pilled.variation,
        IconBadgeTransparent.m.variation,
        IconBadgeTransparent.m.pilled.variation,
        IconBadgeTransparent.s.variation,
        IconBadgeTransparent.s.pilled.variation,
        IconBadgeTransparent.xs.variation,
        IconBadgeTransparent.xs.pilled.variation,
    ]
}

public struct IconBadgeTransparentVariation {
    public struct L {}
    public struct LPilled {}
    public struct M {}
    public struct MPilled {}
    public struct S {}
    public struct SPilled {}
    public struct Xs {}
    public struct XsPilled {}
}

private extension BadgeAppearance {
    static var base: BadgeAppearance {
        var appearance = BadgeAppearance()
        return appearance
    }
}
