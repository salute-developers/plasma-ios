import Foundation
import SDDSComponents
import SDDSThemeCore
import SDDSServTheme

// MARK: - Size
public extension ComponentAppearanceVariation<EmbeddedChip, ChipAppearance> {
    var large: Self {
        .init(
            appearance: appearance
                .size(EmbeddedChipSize.large)
                .titleTypography(EmbeddedChipTypography.title)
        )
    }
    
    var medium: Self {
        .init(
            appearance: appearance
                .size(EmbeddedChipSize.medium)
                .titleTypography(EmbeddedChipTypography.title)
        )
    }
    
    var small: Self {
        .init(
            appearance: appearance
                .size(EmbeddedChipSize.small)
                .titleTypography(EmbeddedChipTypography.title)
        )
    }
    
    var extraSmall: Self {
        .init(
            appearance: appearance
                .size(EmbeddedChipSize.extraSmall)
                .titleTypography(EmbeddedChipTypography.title)
        )
    }
}

public extension EmbeddedChip {
    static var large: ComponentAppearanceVariation<EmbeddedChip, ChipAppearance> {
        return ComponentAppearanceVariation(appearance: ChipAppearance()).large
    }
    
    static var medium: ComponentAppearanceVariation<EmbeddedChip, ChipAppearance> {
        return ComponentAppearanceVariation(appearance: ChipAppearance()).medium
    }
    
    static var small: ComponentAppearanceVariation<EmbeddedChip, ChipAppearance> {
        return ComponentAppearanceVariation(appearance: ChipAppearance()).small
    }
    
    static var embeddedExtraSmall: ComponentAppearanceVariation<EmbeddedChip, ChipAppearance> {
        return ComponentAppearanceVariation(appearance: ChipAppearance()).extraSmall
    }
}
