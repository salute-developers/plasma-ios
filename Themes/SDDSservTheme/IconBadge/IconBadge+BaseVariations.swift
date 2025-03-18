import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct IconBadge {
    public static var l: GeneralAppearanceVariation<IconBadge, BadgeAppearance, IconBadgeVariation.L> {
        var appearance = BadgeAppearance.base
        appearance.size = IconBadgeSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<IconBadge, BadgeAppearance, IconBadgeVariation.M> {
        var appearance = BadgeAppearance.base
        appearance.size = IconBadgeSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<IconBadge, BadgeAppearance, IconBadgeVariation.S> {
        var appearance = BadgeAppearance.base
        appearance.size = IconBadgeSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<IconBadge, BadgeAppearance, IconBadgeVariation.Xs> {
        var appearance = BadgeAppearance.base
        appearance.size = IconBadgeSize.xs

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<BadgeAppearance>] = [
        IconBadge.l.variation,
        IconBadge.l.pilled.variation,
        IconBadge.m.variation,
        IconBadge.m.pilled.variation,
        IconBadge.s.variation,
        IconBadge.s.pilled.variation,
        IconBadge.xs.variation,
        IconBadge.xs.pilled.variation,
    ]
}

public struct IconBadgeVariation {
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
