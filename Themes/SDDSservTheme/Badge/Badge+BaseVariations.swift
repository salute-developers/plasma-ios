import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public struct Badge {
    public static var l: GeneralAppearanceVariation<Badge, BadgeAppearance, BadgeVariation.L> {
        var appearance = BadgeAppearance.base
        appearance.size = BadgeSize.l
        appearance.labelTypography = BadgeTypography(oneSize: Typographies.bodySNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<Badge, BadgeAppearance, BadgeVariation.M> {
        var appearance = BadgeAppearance.base
        appearance.size = BadgeSize.m
        appearance.labelTypography = BadgeTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<Badge, BadgeAppearance, BadgeVariation.S> {
        var appearance = BadgeAppearance.base
        appearance.size = BadgeSize.s
        appearance.labelTypography = BadgeTypography(oneSize: Typographies.bodyXxsNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<Badge, BadgeAppearance, BadgeVariation.Xs> {
        var appearance = BadgeAppearance.base
        appearance.size = BadgeSize.xs
        appearance.labelTypography = BadgeTypography(oneSize: Typographies.bodyXxsNormal.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<BadgeAppearance>] = [
        Badge.l.variation,
        Badge.l.pilled.variation,
        Badge.m.variation,
        Badge.m.pilled.variation,
        Badge.s.variation,
        Badge.s.pilled.variation,
        Badge.xs.variation,
        Badge.xs.pilled.variation,
    ]
}

public struct BadgeVariation {
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
