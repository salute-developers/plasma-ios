import Foundation

/**
 `ChipGroupAppearance` определяет внешний вид `ChipGroup`

 - Свойства:
    - size: Конфигурация размеров группы чипов.
 */
public struct ChipGroupAppearance {
    public let size: ChipGroupSizeConfiguration
    public let gap: ChipGroupGap
    
    public init(size: ChipGroupSizeConfiguration = ZeroChipGroupSize(), gap: ChipGroupGap = .dense) {
        self.size = size
        self.gap = gap
    }
}
