// MARK: - Size
import Foundation
import SDDSComponents
import SDDSThemeCore

// MARK: - Size
public extension AppearanceVariation<ChipAppearance> {
    var large: Self {
        .init(
            appearance: appearance
                .size(SDDSChipSize.large)
                .titleTypography(AvatarTypography.title)
        )
    }
    
    var medium: Self {
        .init(
            appearance: appearance
                .size(SDDSChipSize.medium)
                .titleTypography(AvatarTypography.title)
        )
    }
    
    var small: Self {
        .init(
            appearance: appearance
                .size(SDDSChipSize.small)
                .titleTypography(AvatarTypography.title)
        )
    }
    
    var extraSmall: Self {
        .init(
            appearance: appearance
                .size(SDDSChipSize.extraSmall)
                .titleTypography(AvatarTypography.title)
        )
    }
}

public extension SDDSChip {
    static var large: AppearanceVariation<ChipAppearance> {
        return AppearanceVariation(appearance: ChipAppearance()).large
    }
    
    static var medium: AppearanceVariation<ChipAppearance> {
        return AppearanceVariation(appearance: ChipAppearance()).medium
    }
    
    static var small: AppearanceVariation<ChipAppearance> {
        return AppearanceVariation(appearance: ChipAppearance()).small
    }
    
    static var extraSmall: AppearanceVariation<ChipAppearance> {
        return AppearanceVariation(appearance: ChipAppearance()).extraSmall
    }
}


