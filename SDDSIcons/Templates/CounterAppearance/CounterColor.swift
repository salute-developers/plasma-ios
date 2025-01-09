import Foundation
@_exported import SDDSThemeCore

public struct CounterColor {
    public let defaultColor: ColorToken
    public let highlightedColor: ColorToken
    public let hoveredColor: ColorToken
    
    public init(
        defaultColor: ColorToken = .clearColor,
        highlightedColor: ColorToken = .clearColor,
        hoveredColor: ColorToken = .clearColor
    ) {
        self.defaultColor = defaultColor
        self.highlightedColor = highlightedColor
        self.hoveredColor = hoveredColor
    }
}
