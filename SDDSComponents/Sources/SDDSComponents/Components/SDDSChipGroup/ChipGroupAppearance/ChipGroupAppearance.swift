import Foundation
import SwiftUI

/**
 `ChipGroupAppearance` определяет внешний вид `ChipGroup`

 - Свойства:
    - size: Конфигурация размеров группы чипов.
 */
public struct ChipGroupAppearance: EnvironmentKey {
    public static let defaultValue: Self = .init()
    
    public var size: ChipGroupSizeConfiguration
    public var gap: ChipGroupGap
    
    public init(size: ChipGroupSizeConfiguration = ZeroChipGroupSize(), gap: ChipGroupGap = .dense) {
        self.size = size
        self.gap = gap
    }
}
