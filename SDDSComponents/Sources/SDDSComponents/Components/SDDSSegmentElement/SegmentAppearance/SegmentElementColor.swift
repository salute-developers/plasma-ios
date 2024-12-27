import Foundation
@_exported import SDDSThemeCore

public struct SegmentElementColor {
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
    
    public init(defaultColor: ColorToken = .clearColor, highlightedColor: ColorToken = .clearColor, hoveredColor: ColorToken = .clearColor) {
        self.defaultColor = defaultColor
        self.highlightedColor = highlightedColor
        self.hoveredColor = hoveredColor
    }
}
