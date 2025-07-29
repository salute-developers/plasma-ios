import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Avatar {
    public static var l: GeneralAppearanceVariation<Avatar, AvatarAppearance, AvatarVariation.L> {
        var appearance = AvatarAppearance.base
        appearance.size = AvatarSize.l
        appearance.badgeAppearance = Badge.s.pilled.accent.appearance
        appearance.counterAppearance = Counter.s.negative.appearance
        appearance.indicatorAppearance = Indicator.m.appearance
        appearance.textTypography = AvatarTypography(oneSize: Typographies.headerH4Bold.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<Avatar, AvatarAppearance, AvatarVariation.M> {
        var appearance = AvatarAppearance.base
        appearance.size = AvatarSize.m
        appearance.badgeAppearance = Badge.xs.pilled.accent.appearance
        appearance.counterAppearance = Counter.xs.negative.appearance
        appearance.indicatorAppearance = Indicator.m.appearance
        appearance.textTypography = AvatarTypography(oneSize: Typographies.bodySBold.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<Avatar, AvatarAppearance, AvatarVariation.S> {
        var appearance = AvatarAppearance.base
        appearance.size = AvatarSize.s
        appearance.counterAppearance = Counter.xxs.negative.appearance
        appearance.indicatorAppearance = Indicator.s.appearance
        appearance.textTypography = AvatarTypography(oneSize: Typographies.bodyXxsBold.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xxl: GeneralAppearanceVariation<Avatar, AvatarAppearance, AvatarVariation.Xxl> {
        var appearance = AvatarAppearance.base
        appearance.size = AvatarSize.xxl
        appearance.badgeAppearance = Badge.l.pilled.accent.appearance
        appearance.counterAppearance = Counter.l.negative.appearance
        appearance.indicatorAppearance = Indicator.l.appearance
        appearance.textTypography = AvatarTypography(oneSize: Typographies.headerH2Bold.typography).asContainer

        return .init(
            name: "xxl",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<AvatarAppearance>] = [
        Avatar.l.variation,
        Avatar.l.pilled.variation,
        Avatar.m.variation,
        Avatar.m.pilled.variation,
        Avatar.s.variation,
        Avatar.s.pilled.variation,
        Avatar.xxl.variation,
        Avatar.xxl.pilled.variation,
    ]
}

public struct AvatarVariation {
    public struct L {}
    public struct LPilled {}
    public struct M {}
    public struct MPilled {}
    public struct S {}
    public struct SPilled {}
    public struct Xxl {}
    public struct XxlPilled {}
}

private extension AvatarAppearance {
    static var base: AvatarAppearance {
        var appearance = AvatarAppearance()
        appearance.backgroundFillStyle = .gradient(Gradients.surfaceDefaultAccentGradient)
        appearance.backgroundOpacity = CGFloat(0.2)
        appearance.offlineStatusColor = ColorToken.surfaceOnLightSolidTertiary
        appearance.onlineStatusColor = ColorToken.surfaceDefaultPositive
        appearance.textFillStyle = .gradient(Gradients.textDefaultAccentGradient)
        return appearance
    }
}
