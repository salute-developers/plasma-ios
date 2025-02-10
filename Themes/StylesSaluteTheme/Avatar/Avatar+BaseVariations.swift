import Foundation
import SDDSComponents
import SDDSThemeCore

public struct Avatar {
    public static var xxl: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
        var appearance = AvatarAppearance.base
        appearance.size = SDDSAvatarSize.extraExtraLarge
        appearance.textTypography = AvatarTypography.title
        return .init(
            name: "xxl",
            appearance: appearance
        )
    }
    
    public static var l: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
        var appearance = AvatarAppearance.base
        appearance.size = SDDSAvatarSize.large
        appearance.textTypography = AvatarTypography.title
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    public static var m: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
        var appearance = AvatarAppearance.base
        appearance.size = SDDSAvatarSize.medium
        appearance.textTypography = AvatarTypography.title
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static var s: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
        var appearance = AvatarAppearance.base
        appearance.size = SDDSAvatarSize.small
        appearance.textTypography = AvatarTypography.title
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static var scallable: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
        var appearance = AvatarAppearance.base
        appearance.size = SDDSAvatarSize.scalable(height: 24)
        appearance.textTypography = AvatarTypography.title
        return .init(
            name: "scallable",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<AvatarAppearance>] = [xxl, l, m, s, scallable].map { $0.variation }
}

extension AvatarAppearance {
    static var base: AvatarAppearance {
        .init(
            textFillStyle: .gradient(Gradients.textDefaultAccentGradient),
            backgroundFillStyle: .gradient(Gradients.surfaceDefaultAccentGradient),
            backgroundOpacity: 0.2,
            onlineStatusColor: Colors.textDefaultAccent,
            offlineStatusColor: Colors.surfaceDefaultPositive,
            textTypography: AvatarTypography.title
        )
    }
}
