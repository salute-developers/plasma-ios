import Foundation
import SwiftUI
import SDDSThemeCore

/**
 `SegmentAppearance` определяет стили сегмента, включая размеры, форму, цвета и другие параметры.

 - Properties:
    - size: Конфигурация размеров сегмента, определяемая `SegmentSizeConfiguration`.
    - backgroundColor: Цвет фона сегмента для различных состояний, определяемый `ButtonColor`.
    - segmentItemAppearance: Внешний вид элементов сегмента, определяемый `SegmentItemAppearance`.

 - Methods:
    - init: Инициализирует стили сегмента с заданными параметрами.
 */
public struct SegmentAppearance {
    public var size: SegmentSizeConfiguration
    public var backgroundColor: ButtonColor?
    public var segmentItemAppearance: SegmentItemAppearance
    @available(*, deprecated, message: "Don't use it, public method will be removed")
    public var disabledAlpha: CGFloat

    /**
     Инициализатор для создания стилистической конфигурации сегмента.

     - Parameters:
        - size: Конфигурация размеров сегмента.
        - backgroundColor: Цвет фона сегмента для различных состояний.
        - segmentItemAppearance: Внешний вид элементов сегмента.
     */
    @available(*, deprecated, message: "Don't use it, public method will be removed")
    public init(
        size: SegmentSizeConfiguration = SegmentZeroSize(),
        backgroundColor: ButtonColor? = ButtonColor(),
        segmentItemAppearance: SegmentItemAppearance = SegmentItemAppearance(),
        disabledAlpha: CGFloat = 0
    ) {
        self.size = size
        self.backgroundColor = backgroundColor
        self.segmentItemAppearance = segmentItemAppearance
        self.disabledAlpha = disabledAlpha
    }
    
    public init(
        size: SegmentSizeConfiguration = SegmentZeroSize(),
        backgroundColor: ButtonColor? = ButtonColor(),
        segmentItemAppearance: SegmentItemAppearance = SegmentItemAppearance()
    ) {
        self.size = size
        self.backgroundColor = backgroundColor
        self.segmentItemAppearance = segmentItemAppearance
        self.disabledAlpha = 0
    }
}

extension SegmentAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: SegmentAppearance.self, fallback: SegmentAppearance())
    }
}
