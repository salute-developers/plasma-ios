// MARK: - Size
import Foundation
import SDDSComponents
import SDDSThemeCore

// MARK: - Size
public extension AppearanceVariation<AvatarAppearance> {
    var extraExtraLarge: Self {
        .init(
            appearance: appearance
                .size(SDDSAvatarSize.extraExtraLarge)
                .textTypography(AvatarTypography.title)
        )
    }
    
    var large: Self {
        .init(
            appearance: appearance
                .size(SDDSAvatarSize.large)
                .textTypography(AvatarTypography.title)
        )
    }
    
    var medium: Self {
        .init(
            appearance: appearance
                .size(SDDSAvatarSize.medium)
                .textTypography(AvatarTypography.title)
        )
    }
    
    var small: Self {
        .init(
            appearance: appearance
                .size(SDDSAvatarSize.small)
                .textTypography(AvatarTypography.title)
        )
    }
    
    func scallable(height: CGFloat) -> Self {
        .init(
            appearance: appearance
                .size(SDDSAvatarSize.scalable(height: height))
                .textTypography(AvatarTypography.title)
        )
    }
}

public extension SDDSAvatar {
    static var extraExtraLarge: AppearanceVariation<AvatarAppearance> {
        return AppearanceVariation(appearance: AvatarAppearance()).extraExtraLarge
    }
    
    static var large: AppearanceVariation<AvatarAppearance> {
        return AppearanceVariation(appearance: AvatarAppearance()).large
    }
    
    static var medium: AppearanceVariation<AvatarAppearance> {
        return AppearanceVariation(appearance: AvatarAppearance()).medium
    }
    
    static var small: AppearanceVariation<AvatarAppearance> {
        return AppearanceVariation(appearance: AvatarAppearance()).small
    }
    
    static func scallable(height: CGFloat) -> AppearanceVariation<AvatarAppearance> {
        return AppearanceVariation(appearance: AvatarAppearance()).scallable(height: height)
    }
}
