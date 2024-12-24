// MARK: - Size
import Foundation
import SDDSComponents
import SDDSThemeCore

// MARK: - Size
public extension AppearanceVariation<ChipAppearance> {
    var large: Self {
        .init(
            appearance: appearance
                .size(SDDSChipSize.large(.default(12)))
                .titleTypography(AvatarTypography.title)
        )
    }
    
    var medium: Self {
        .init(
            appearance: appearance
                .size(SDDSChipSize.medium(.default(10)))
                .titleTypography(AvatarTypography.title)
        )
    }
    
    var small: Self {
        .init(
            appearance: appearance
                .size(SDDSChipSize.small(.default(8)))
                .titleTypography(AvatarTypography.title)
        )
    }
    
    var extraSmall: Self {
        .init(
            appearance: appearance
                .size(SDDSChipSize.extraSmall(.default(6)))
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


