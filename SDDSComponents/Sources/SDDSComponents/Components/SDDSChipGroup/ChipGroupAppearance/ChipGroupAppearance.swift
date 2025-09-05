import Foundation
import SwiftUI
import SDDSThemeCore

/**
 `ChipGroupAppearance` определяет внешний вид `ChipGroup`

 - Свойства:
    - size: Конфигурация размеров группы чипов.
    - chipAppearance: Внешний вид отдельных чипов в группе (цвета, шрифты, скругления).
    - gap: Отступ между чипами в группе.
 */
public struct ChipGroupAppearance {
    public var size: ChipGroupSizeConfiguration
    public var chipAppearance: ChipAppearance
    public var gap: ChipGroupGap
    public var disabledAlpha: CGFloat
    
    public init(
        size: ChipGroupSizeConfiguration = ZeroChipGroupSize(),
        gap: ChipGroupGap = .dense,
        chipAppearance: ChipAppearance = ChipAppearance(),
        disabledAlpha: CGFloat = 0
    ) {
        self.size = size
        self.gap = gap
        self.chipAppearance = chipAppearance
        self.disabledAlpha = disabledAlpha
    }
}

extension ChipGroupAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: ChipGroupAppearance.self, fallback: ChipGroupAppearance())
    }
}
