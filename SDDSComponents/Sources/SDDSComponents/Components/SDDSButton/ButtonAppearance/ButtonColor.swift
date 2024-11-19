import Foundation
@_exported import SDDSThemeCore

/**
 `ButtonColor` определяет цвета кнопки для различных состояний.

 - Properties:
    - defaultColor: Цвет для стандартного состояния кнопки.
    - highlightedColor: Цвет для состояния, когда кнопка нажата.
    - hoveredColor: Цвет для состояния, когда кнопка находится под курсором.
 */
public struct ButtonColor {
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
     Инициализатор для создания `ButtonColor`.
     
     - Parameters:
        - defaultColor: Цвет для стандартного состояния.
        - highlightedColor: Цвет для состояния нажатия.
        - hoveredColor: Цвет для состояния наведения.
     */
    public init(defaultColor: ColorToken = .clearColor, highlightedColor: ColorToken = .clearColor, hoveredColor: ColorToken = .clearColor) {
        self.defaultColor = defaultColor
        self.highlightedColor = highlightedColor
        self.hoveredColor = hoveredColor
    }
}
