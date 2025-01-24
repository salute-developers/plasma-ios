import Foundation

/**
 `SegmentAppearance` определяет стили сегмента, включая размеры, форму, цвета и другие параметры.

 - Properties:
    - size: Конфигурация размеров сегмента, определяемая `SegmentSizeConfiguration`.
    - shapeStyle: Стиль формы сегмента (например, закругленная или овальная), определяемый `ComponentShapeStyle`.
    - layoutOrientation: Ориентация сегмента (горизонтальная или вертикальная), определяемая `SegmentLayoutOrientation`.
    - backgroundColor: Цвет фона сегмента для различных состояний, определяемый `ButtonColor`.
    - segmentItemAppearance: Внешний вид элементов сегмента, определяемый `SegmentItemAppearance`.
    - stretchMode: Режим растяжения элементов в контейнере, определяемый `StretchMode`.

 - Methods:
    - init: Инициализирует стили сегмента с заданными параметрами.
 */
public struct SegmentAppearance {

    /**
     Конфигурация размеров сегмента, определяемая `SegmentSizeConfiguration`.
     */
    public let size: SegmentSizeConfiguration

    /**
     Стиль формы сегмента (например, закругленная или овальная), определяемый `ComponentShapeStyle`.
     */
    public let shapeStyle: ComponentShapeStyle

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
     Режим растяжения элементов в контейнере, определяемый `StretchMode`.
     */
    public let stretchMode: StretchMode

    /**
     Инициализатор для создания стилистической конфигурации сегмента.

     - Parameters:
        - size: Конфигурация размеров сегмента.
        - shapeStyle: Стиль формы сегмента.
        - layoutOrientation: Ориентация сегмента.
        - backgroundColor: Цвет фона сегмента для различных состояний.
        - segmentItemAppearance: Внешний вид элементов сегмента.
        - stretchMode: Режим растяжения элементов в контейнере.
     */
    public init(
        size: SegmentSizeConfiguration = SegmentDefaultSize(),
        shapeStyle: ComponentShapeStyle = .cornered,
        layoutOrientation: SegmentLayoutOrientation = .horizontal,
        backgroundColor: ButtonColor = ButtonColor(),
        segmentItemAppearance: SegmentItemAppearance = SegmentItemAppearance(),
        stretchMode: StretchMode = .fixed
    ) {
        self.size = size
        self.shapeStyle = shapeStyle
        self.layoutOrientation = layoutOrientation
        self.backgroundColor = backgroundColor
        self.segmentItemAppearance = segmentItemAppearance
        self.stretchMode = stretchMode
    }
}
