import Foundation

/**
 `SegmentAppearance` определяет стили сегмента, включая размеры, форму, цвета и другие параметры.

 - Properties:
    - size: Конфигурация размеров сегмента, определяемая `SegmentSizeConfiguration`.
    - layoutOrientation: Ориентация сегмента (горизонтальная или вертикальная), определяемая `SegmentLayoutOrientation`.
    - backgroundColor: Цвет фона сегмента для различных состояний, определяемый `ButtonColor`.
    - segmentItemAppearance: Внешний вид элементов сегмента, определяемый `SegmentItemAppearance`.
    - StrechMode: Режим растяжения элементов в контейнере, определяемый `StrechMode`.

 - Methods:
    - init: Инициализирует стили сегмента с заданными параметрами.
 */
public struct SegmentAppearance {

    /**
     Конфигурация размеров сегмента, определяемая `SegmentSizeConfiguration`.
     */
    public let size: SegmentSizeConfiguration

    /**
     Ориентация сегмента (горизонтальная или вертикальная), определяемая `SegmentLayoutOrientation`.
     */
    public let layoutOrientation: SegmentLayoutOrientation

    /**
     Цвет фона сегмента для различных состояний, определяемый `ButtonColor`.
     */
    public let backgroundColor: ButtonColor

    /**
     Внешний вид элементов сегмента, определяемый `SegmentItemAppearance`.
     */
    public let segmentItemAppearance: SegmentItemAppearance

    /**
     Режим растяжения элементов в контейнере, определяемый `StrechMode`.
     */
    public let StrechMode: StrechMode

    /**
     Инициализатор для создания стилистической конфигурации сегмента.

     - Parameters:
        - size: Конфигурация размеров сегмента.
        - layoutOrientation: Ориентация сегмента.
        - backgroundColor: Цвет фона сегмента для различных состояний.
        - segmentItemAppearance: Внешний вид элементов сегмента.
        - StrechMode: Режим растяжения элементов в контейнере.
     */
    public init(
        size: SegmentSizeConfiguration = SegmentDefaultSize(),
        layoutOrientation: SegmentLayoutOrientation = .horizontal,
        backgroundColor: ButtonColor = ButtonColor(),
        segmentItemAppearance: SegmentItemAppearance = SegmentItemAppearance(),
        StrechMode: StrechMode = .fixed
    ) {
        self.size = size
        self.layoutOrientation = layoutOrientation
        self.backgroundColor = backgroundColor
        self.segmentItemAppearance = segmentItemAppearance
        self.StrechMode = StrechMode
    }
}
