import Foundation
import SDDSComponents

//// MARK: - Size
public extension AppearanceVariation<ChipGroupAppearance> {
    var dense: Self {
        .init(
            appearance: appearance
                .gap(.dense)
        )
    }
    
    var wide: Self {
        .init(
            appearance: appearance
                .gap(.wide)
        )
    }
}

public extension SDDSChipGroup {
    static var dense: AppearanceVariation<ChipGroupAppearance> {
        return AppearanceVariation(appearance: ChipGroupAppearance()).dense
    }
    
    static var wide: AppearanceVariation<ChipGroupAppearance> {
        return AppearanceVariation(appearance: ChipGroupAppearance()).wide
    }
}
