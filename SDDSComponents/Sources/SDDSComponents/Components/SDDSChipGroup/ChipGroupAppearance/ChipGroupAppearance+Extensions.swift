import Foundation

public extension ChipGroupAppearance {
    func size(_ size: ChipGroupSizeConfiguration) -> ChipGroupAppearance {
        return ChipGroupAppearance(
            size: size,
            gap: self.gap
        )
    }
    
    func gap(_ gap: ChipGroupGap) -> ChipGroupAppearance {
        return ChipGroupAppearance(
            size: self.size,
            gap: gap
        )
    }
}
