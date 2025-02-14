import Foundation
import SwiftUI

/**
 `SegmentAppearance` определяет стили сегмента, включая размеры, форму, цвета и другие параметры.

 - Properties:
    - size: Конфигурация размеров сегмента, определяемая `SegmentSizeConfiguration`.
    - backgroundColor: Цвет фона сегмента для различных состояний, определяемый `ButtonColor`.
    - segmentItemAppearance: Внешний вид элементов сегмента, определяемый `SegmentItemAppearance`.

 - Methods:
    - init: Инициализирует стили сегмента с заданными параметрами.
 */
public struct SegmentAppearance: EnvironmentKey {
    public static let defaultValue: Self = .init()
    /**
     Конфигурация размеров сегмента, определяемая `SegmentSizeConfiguration`.
     */
    public let size: SegmentSizeConfiguration

    /**
     Цвет фона сегмента для различных состояний, определяемый `ButtonColor`.
     */
    public let hasBackground: Bool
    
    public let backgroundColor: ButtonColor?
    
    public let stretch: Bool

    /**
     Внешний вид элементов сегмента, определяемый `SegmentItemAppearance`.
     */
    public let segmentItemAppearance: SegmentItemAppearance

    public let disabledAlpha: CGFloat

    /**
     Инициализатор для создания стилистической конфигурации сегмента.

     - Parameters:
        - size: Конфигурация размеров сегмента.
        - backgroundColor: Цвет фона сегмента для различных состояний.
        - segmentItemAppearance: Внешний вид элементов сегмента.
     */
    public init(
        size: SegmentSizeConfiguration = SegmentZeroSize(),
        stretch: Bool = false,
        hasBackground: Bool = true,
        backgroundColor: ButtonColor? = ButtonColor(),
        segmentItemAppearance: SegmentItemAppearance = SegmentItemAppearance(),
        disabledAlpha: CGFloat = 0
    ) {
        self.size = size
        self.stretch = stretch
        self.hasBackground = hasBackground
        self.backgroundColor = backgroundColor
        self.segmentItemAppearance = segmentItemAppearance
        self.disabledAlpha = disabledAlpha
    }
}
