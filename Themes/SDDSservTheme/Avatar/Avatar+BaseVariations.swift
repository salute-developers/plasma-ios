import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Avatar {
    public static var l: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
        var appearance = AvatarAppearance.base
        appearance.size = AvatarSize.l
        appearance.backgroundFillStyle = .color(.clearColor)
        appearance.badgeAppearance = Badge.s.pilled.accent.appearance
        appearance.counterAppearance = Counter.s.negative.appearance
        appearance.indicatorAppearance = Indicator.m.appearance
        appearance.textFillStyle = .color(.clearColor)
        appearance.textTypography = AvatarTypography(oneSize: Typographies.headerH4Bold.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
        var appearance = AvatarAppearance.base
        appearance.size = AvatarSize.m
        appearance.backgroundFillStyle = .color(.clearColor)
        appearance.badgeAppearance = Badge.xs.pilled.accent.appearance
        appearance.counterAppearance = Counter.xs.negative.appearance
        appearance.indicatorAppearance = Indicator.m.appearance
        appearance.textFillStyle = .color(.clearColor)
        appearance.textTypography = AvatarTypography(oneSize: Typographies.bodySBold.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
        var appearance = AvatarAppearance.base
        appearance.size = AvatarSize.s
        appearance.backgroundFillStyle = .color(.clearColor)
        appearance.counterAppearance = Counter.xxs.negative.appearance
        appearance.indicatorAppearance = Indicator.s.appearance
        appearance.textFillStyle = .color(.clearColor)
        appearance.textTypography = AvatarTypography(oneSize: Typographies.bodyXxsBold.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xxl: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
        var appearance = AvatarAppearance.base
        appearance.size = AvatarSize.xxl
        appearance.backgroundFillStyle = .color(.clearColor)
        appearance.badgeAppearance = Badge.l.pilled.accent.appearance
        appearance.counterAppearance = Counter.l.negative.appearance
        appearance.indicatorAppearance = Indicator.l.appearance
        appearance.textFillStyle = .color(.clearColor)
        appearance.textTypography = AvatarTypography(oneSize: Typographies.headerH2Bold.typography).asContainer

        return .init(
            name: "xxl",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<AvatarAppearance>] = [
        Avatar.l.variation,
        Avatar.m.variation,
        Avatar.s.variation,
        Avatar.xxl.variation,
    ]
}

public struct AvatarVariation {
    public struct L {}
    public struct M {}
    public struct S {}
    public struct Xxl {}
}

private extension AvatarAppearance {
    static var base: AvatarAppearance {
        var appearance = AvatarAppearance()
        appearance.backgroundFillStyle = .gradient(Gradients.surfaceDefaultAccentGradient)
        appearance.offlineStatusColor = ColorToken.surfaceOnLightSolidTertiary
        appearance.onlineStatusColor = ColorToken.surfaceDefaultPositive
        appearance.textFillStyle = .gradient(Gradients.textDefaultAccentGradient)
        return appearance
    }
}
