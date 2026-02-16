import Foundation
import SwiftUI

/**
 Объект состояния для управления и наблюдения за состоянием сворачиваемой навигационной панели.
 Состояние обновляется реализацией scroll behavior при скролле контента.

 - `heightOffsetLimit` — лимит в пикселях, до которого бар может сворачиваться (обычно отрицательное).
 - `heightOffset` — текущее смещение высоты (между heightOffsetLimit и 0).
 - `contentOffset` — накопленное смещение прокрученного контента.
 - `collapsedFraction` — доля свёрнутости: 0 = полностью развёрнут, 1 = полностью свёрнут.
 */
public final class CollapsingNavigationBarState: ObservableObject {
    /// Лимит смещения высоты в пикселях (бар сворачивается до этого значения).
    @Published public var heightOffsetLimit: CGFloat

    /// Текущее смещение высоты бара (между heightOffsetLimit и 0). Присваивайте значения в этом диапазоне.
    @Published public var heightOffset: CGFloat

    /// Накопленное смещение прокрученного контента.
    @Published public var contentOffset: CGFloat

    /// Доля свёрнутости: 0 = развёрнут, 1 = свёрнут.
    public var collapsedFraction: CGFloat {
        guard heightOffsetLimit != 0 else { return 0 }
        return heightOffset / heightOffsetLimit
    }

    public init(
        heightOffsetLimit: CGFloat = -.greatestFiniteMagnitude,
        heightOffset: CGFloat = 0,
        contentOffset: CGFloat = 0
    ) {
        self.heightOffsetLimit = heightOffsetLimit
        self.heightOffset = heightOffset
        self.contentOffset = contentOffset
    }
}
