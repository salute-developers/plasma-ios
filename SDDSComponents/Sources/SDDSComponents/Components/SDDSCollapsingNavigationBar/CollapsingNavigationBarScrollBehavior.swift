import Foundation
import SwiftUI

/**
 Поведение сворачиваемой навигационной панели при скролле.
 */
public enum CollapsingNavigationBarScrollBehavior {
    /// Бар закреплён: только обновляется contentOffset, высота не меняется.
    case pinned

    /// Бар сразу сворачивается при скролле вверх и сразу появляется при скролле вниз.
    case enterAlways

    /// Бар сворачивается при скролле вверх и разворачивается только когда контент прокручен до верха.
    case exitUntilCollapsed
}
