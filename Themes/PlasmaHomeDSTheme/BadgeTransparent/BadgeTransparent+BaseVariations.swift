import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct BadgeTransparent {
    public static var l: GeneralAppearanceVariation<BadgeTransparent, BadgeAppearance, BadgeTransparentVariation.L> {
        var appearance = BadgeAppearance.base
        appearance.size = BadgeTransparentSize.l
        appearance.labelTypography = BadgeTransparentTypography(oneSize: Typographies.bodySNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<BadgeTransparent, BadgeAppearance, BadgeTransparentVariation.M> {
        var appearance = BadgeAppearance.base
        appearance.size = BadgeTransparentSize.m
        appearance.labelTypography = BadgeTransparentTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<BadgeTransparent, BadgeAppearance, BadgeTransparentVariation.S> {
        var appearance = BadgeAppearance.base
        appearance.size = BadgeTransparentSize.s
        appearance.labelTypography = BadgeTransparentTypography(oneSize: Typographies.bodyXxsNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<BadgeTransparent, BadgeAppearance, BadgeTransparentVariation.Xs> {
        var appearance = BadgeAppearance.base
        appearance.size = BadgeTransparentSize.xs
        appearance.labelTypography = BadgeTransparentTypography(oneSize: Typographies.bodyXxsNormal.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<BadgeAppearance>] = [
        BadgeTransparent.l.variation,
        BadgeTransparent.l.pilled.variation,
        BadgeTransparent.m.variation,
        BadgeTransparent.m.pilled.variation,
        BadgeTransparent.s.variation,
        BadgeTransparent.s.pilled.variation,
        BadgeTransparent.xs.variation,
        BadgeTransparent.xs.pilled.variation,
    ]
}

public struct BadgeTransparentVariation {
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
