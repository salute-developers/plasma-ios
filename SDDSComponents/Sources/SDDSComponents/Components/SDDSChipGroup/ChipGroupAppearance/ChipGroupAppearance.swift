import Foundation

/**
 `ChipGroupAppearance` определяет внешний вид `ChipGroup`

 - Свойства:
    - size: Конфигурация размеров группы чипов.
 */
public struct ChipGroupAppearance {
    public let size: ChipGroupSizeConfiguration
    
    public init(size: ChipGroupSizeConfiguration = ZeroChipGroupSize()) {
        self.size = size
    }
}
