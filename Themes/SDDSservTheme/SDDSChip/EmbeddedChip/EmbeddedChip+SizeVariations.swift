import Foundation
import SDDSComponents
import SDDSThemeCore


// MARK: - Size
public extension ComponentAppearanceVariation<EmbeddedChip, ChipAppearance> {
    var l: Self {
        .init(
            appearance: appearance
                .size(EmbeddedChipSize.l)
                .titleTypography(EmbeddedChipTypography.title)
        )
    }
    
    var m: Self {
        .init(
            appearance: appearance
                .size(EmbeddedChipSize.m)
                .titleTypography(EmbeddedChipTypography.title)
        )
    }
    
    var s: Self {
        .init(
            appearance: appearance
                .size(EmbeddedChipSize.s)
                .titleTypography(EmbeddedChipTypography.title)
        )
    }
    
    var xs: Self {
        .init(
            appearance: appearance
                .size(EmbeddedChipSize.xs)
                .titleTypography(EmbeddedChipTypography.title)
        )
    }
}

public extension EmbeddedChip {
    static var l: ComponentAppearanceVariation<EmbeddedChip, ChipAppearance> {
        return ComponentAppearanceVariation(appearance: ChipAppearance()).l
    }
    
    static var m: ComponentAppearanceVariation<EmbeddedChip, ChipAppearance> {
        return ComponentAppearanceVariation(appearance: ChipAppearance()).m
    }
    
    static var s: ComponentAppearanceVariation<EmbeddedChip, ChipAppearance> {
        return ComponentAppearanceVariation(appearance: ChipAppearance()).s
    }
    
    static var xs: ComponentAppearanceVariation<EmbeddedChip, ChipAppearance> {
        return ComponentAppearanceVariation(appearance: ChipAppearance()).xs
    }
}
