import Foundation
import SDDSApiInfo

/// Определяет размещение обязательного индикатора.
public enum TextFieldRequiredPlacement: String, CaseIterable {
    @ApiName("required-start")
    case left
    @ApiName("required-end")
    case right
    case none
}
