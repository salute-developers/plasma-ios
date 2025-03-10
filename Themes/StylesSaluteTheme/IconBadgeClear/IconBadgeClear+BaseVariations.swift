import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public struct IconBadgeClear {
    public static var l: GeneralAppearanceVariation<IconBadgeClear, BadgeAppearance, IconBadgeClearVariation.L> {
        var appearance = BadgeAppearance.base
        appearance.size = IconBadgeClearSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<IconBadgeClear, BadgeAppearance, IconBadgeClearVariation.M> {
        var appearance = BadgeAppearance.base
        appearance.size = IconBadgeClearSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<IconBadgeClear, BadgeAppearance, IconBadgeClearVariation.S> {
        var appearance = BadgeAppearance.base
        appearance.size = IconBadgeClearSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<IconBadgeClear, BadgeAppearance, IconBadgeClearVariation.Xs> {
        var appearance = BadgeAppearance.base
        appearance.size = IconBadgeClearSize.xs

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<BadgeAppearance>] = [
        IconBadgeClear.l.variation,
        IconBadgeClear.l.pilled.variation,
        IconBadgeClear.m.variation,
        IconBadgeClear.m.pilled.variation,
        IconBadgeClear.s.variation,
        IconBadgeClear.s.pilled.variation,
        IconBadgeClear.xs.variation,
        IconBadgeClear.xs.pilled.variation,
    ]
}

public struct IconBadgeClearVariation {
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
        appearance.backgroundColor = ColorToken.surfaceDefaultClear
        return appearance
    }
}
