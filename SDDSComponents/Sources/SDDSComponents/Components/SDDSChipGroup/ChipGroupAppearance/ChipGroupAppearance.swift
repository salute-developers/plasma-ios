import Foundation
import SwiftUI

/**
 `ChipGroupAppearance` определяет внешний вид `ChipGroup`

 - Свойства:
    - size: Конфигурация размеров группы чипов.
 */
public struct ChipGroupAppearance {
    public var size: ChipGroupSizeConfiguration
    public var gap: ChipGroupGap
    
    public init(size: ChipGroupSizeConfiguration = ZeroChipGroupSize(), gap: ChipGroupGap = .dense) {
        self.size = size
        self.gap = gap
    }
}

extension ChipGroupAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: ChipGroupAppearance.self, fallback: ChipGroupAppearance())
    }
}
