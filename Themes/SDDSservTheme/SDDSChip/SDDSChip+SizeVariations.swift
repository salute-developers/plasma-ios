import Foundation
import SDDSComponents
import SDDSThemeCore

// MARK: - Size
public extension AppearanceVariation<ChipAppearance> {
    var large: Self {
        .init(
            appearance: appearance
                .size(SDDSChipSize.large)
                .titleTypography(ChipTypography.title)
        )
    }
    
    var medium: Self {
        .init(
            appearance: appearance
                .size(SDDSChipSize.medium)
                .titleTypography(ChipTypography.title)
        )
    }
    
    var small: Self {
        .init(
            appearance: appearance
                .size(SDDSChipSize.small)
                .titleTypography(ChipTypography.title)
        )
    }
    
    var extraSmall: Self {
        .init(
            appearance: appearance
                .size(SDDSChipSize.extraSmall)
                .titleTypography(ChipTypography.title)
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


