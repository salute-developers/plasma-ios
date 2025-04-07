import Foundation
@_exported import SDDSThemeCore

public struct SelectionControlColor {
    public let defaultColor: ColorToken
    public let checkedColor: ColorToken
    
    public init(
        defaultColor: ColorToken = .clearColor,
        checkedColor: ColorToken = .clearColor
    ) {
        self.defaultColor = defaultColor
        self.checkedColor = checkedColor
    }
}
