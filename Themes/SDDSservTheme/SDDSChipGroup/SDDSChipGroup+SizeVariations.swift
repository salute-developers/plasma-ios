import Foundation
import SDDSComponents

//// MARK: - Size
public extension AppearanceVariation<ChipGroupAppearance> {
    var large: Self {
        .init(
            appearance: appearance
                .size(SDDSChipGroupSize.large)
        )
    }
    
    var medium: Self {
        .init(
            appearance: appearance
                .size(SDDSChipGroupSize.medium)
        )
    }
    
    var small: Self {
        .init(
            appearance: appearance
                .size(SDDSChipGroupSize.small)
        )
    }
    
    var extraSmall: Self {
        .init(
            appearance: appearance
                .size(SDDSChipGroupSize.extraSmall)
        )
    }
}

public extension SDDSChipGroup {
    static var large: AppearanceVariation<ChipGroupAppearance> {
        return AppearanceVariation(appearance: ChipGroupAppearance()).large
    }
    
    static var medium: AppearanceVariation<ChipGroupAppearance> {
        return AppearanceVariation(appearance: ChipGroupAppearance()).medium
    }
    
    static var small: AppearanceVariation<ChipGroupAppearance> {
        return AppearanceVariation(appearance: ChipGroupAppearance()).small
    }
    
    static var extraSmall: AppearanceVariation<ChipGroupAppearance> {
        return AppearanceVariation(appearance: ChipGroupAppearance()).extraSmall
    }
}
