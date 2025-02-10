import Foundation
import SDDSComponents

public struct ChipGroup {
    public static var dense: ComponentAppearanceVariation<ChipGroup, ChipGroupAppearance> {
        var appearance = ChipGroupAppearance()
        appearance.size = SDDSChipGroupSize()
        appearance.gap = .dense
        
        return .init(
            name: "dense",
            appearance: appearance
        )
    }
    
    public static var wide: ComponentAppearanceVariation<ChipGroup, ChipGroupAppearance> {
        var appearance = ChipGroupAppearance()
        appearance.size = SDDSChipGroupSize()
        appearance.gap = .wide
        
        return .init(
            name: "wide",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ChipGroupAppearance>] = [
        dense,
        wide
    ].map {
        Variation(
            originalVariation: $0,
            styles: [.init(name: $0.name, appearance: $0.appearance)],
            name: $0.name,
            appearance: $0.appearance
        )
    }
}
