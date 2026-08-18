import Foundation
import SDDSApiInfo

/// Определяет размещение обязательного индикатора.
public enum TextAreaRequiredPlacement: String, CaseIterable {
    @ApiName("required-start")
    case left
    @ApiName("required-end")
    case right
    case none
}
