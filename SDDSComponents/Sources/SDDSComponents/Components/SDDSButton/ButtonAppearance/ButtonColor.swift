import Foundation
@_exported import SDDSThemeCore

/**
 `ButtonColor` определяет цвета кнопки для различных состояний.

 - Properties:
    - defaultColor: Цвет для стандартного состояния кнопки.
    - highlightedColor: Цвет для состояния, когда кнопка нажата.
    - hoveredColor: Цвет для состояния, когда кнопка находится под курсором.
 */
public struct ButtonColor: Hashable {
    /**
     Цвет для стандартного состояния кнопки.
     */
    public let defaultColor: ColorToken
    
    /**
     Цвет для состояния, когда кнопка нажата.
     */
    public let highlightedColor: ColorToken
    
    /**
     Цвет для состояния, когда кнопка находится под курсором.
     */
    public let hoveredColor: ColorToken
    
    /**
     Цвет, используемый для кнопки, когда она находится в выбранном состоянии.
     Этот цвет применяется к кнопке, когда она выбрана в контейнере элементов.
     */
    public let selectedColor: ColorToken
    
    /**
     Инициализатор для создания `ButtonColor`.
     
     - Parameters:
        - defaultColor: Цвет для стандартного состояния.
        - highlightedColor: Цвет для состояния нажатия.
        - hoveredColor: Цвет для состояния наведения.
        - selectedColor: Цвет для  в выбранном состоянии
     
     */
    public init(
        defaultColor: ColorToken = .clearColor,
        highlightedColor: ColorToken = .clearColor,
        hoveredColor: ColorToken = .clearColor,
        selectedColor: ColorToken = .clearColor
    ) {
        self.defaultColor = defaultColor
        self.highlightedColor = highlightedColor
        self.hoveredColor = hoveredColor
        self.selectedColor = selectedColor
    }
    
    public static func == (lhs: ButtonColor, rhs: ButtonColor) -> Bool {
        lhs.defaultColor == rhs.defaultColor &&
        lhs.highlightedColor == rhs.highlightedColor &&
        lhs.hoveredColor == rhs.hoveredColor &&
        lhs.selectedColor == rhs.selectedColor
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(defaultColor)
        hasher.combine(highlightedColor)
        hasher.combine(hoveredColor)
        hasher.combine(selectedColor)
    }
}
