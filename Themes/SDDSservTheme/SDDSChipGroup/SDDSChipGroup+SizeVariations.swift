import Foundation
import SDDSComponents

public extension AppearanceVariation<ChipGroupAppearance> {
    var dense: Self {
        .init(
            appearance: appearance
                .size(SDDSChipGroupSize())
                .gap(.dense)
        )
    }
    
    var wide: Self {
        .init(
            appearance: appearance
                .size(SDDSChipGroupSize())
                .gap(.wide)
        )
    }
}

public extension SDDSChipGroup {
    static var dense: AppearanceVariation<ChipGroupAppearance> {
        return AppearanceVariation(
            name: "dense",
            appearance: .init(size: SDDSChipGroupSize(), gap: .dense)
        )
    }
    
    static var wide: AppearanceVariation<ChipGroupAppearance> {
        return AppearanceVariation(
            name: "wide",
            appearance: .init(size: SDDSChipGroupSize(), gap: .wide)
        )
    }
    
    static var all: [AppearanceVariation<ChipGroupAppearance>] {
        [
            SDDSChipGroup.dense,
            SDDSChipGroup.wide
        ]
    }
}
