import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public struct BadgeClear {
    public static var l: GeneralAppearanceVariation<BadgeClear, BadgeAppearance, BadgeClearVariation.L> {
        var appearance = BadgeAppearance.base
        appearance.size = BadgeClearSize.l
        appearance.labelTypography = BadgeClearTypography(oneSize: Typographies.bodySNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<BadgeClear, BadgeAppearance, BadgeClearVariation.M> {
        var appearance = BadgeAppearance.base
        appearance.size = BadgeClearSize.m
        appearance.labelTypography = BadgeClearTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<BadgeClear, BadgeAppearance, BadgeClearVariation.S> {
        var appearance = BadgeAppearance.base
        appearance.size = BadgeClearSize.s
        appearance.labelTypography = BadgeClearTypography(oneSize: Typographies.bodyXxsNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<BadgeClear, BadgeAppearance, BadgeClearVariation.Xs> {
        var appearance = BadgeAppearance.base
        appearance.size = BadgeClearSize.xs
        appearance.labelTypography = BadgeClearTypography(oneSize: Typographies.bodyXxsNormal.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<BadgeAppearance>] = [
        BadgeClear.l.variation,
        BadgeClear.l.pilled.variation,
        BadgeClear.m.variation,
        BadgeClear.m.pilled.variation,
        BadgeClear.s.variation,
        BadgeClear.s.pilled.variation,
        BadgeClear.xs.variation,
        BadgeClear.xs.pilled.variation,
    ]
}

public struct BadgeClearVariation {
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
