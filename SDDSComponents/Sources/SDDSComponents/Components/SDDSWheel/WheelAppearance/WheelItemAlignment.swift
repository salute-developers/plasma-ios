import Foundation
import SDDSApiInfo
import SwiftUI
@_exported import SDDSThemeCore

/**
 `WheelItemAlignment` определяет варианты выравнивания элементов Wheel.
 */
public enum WheelItemAlignment {
    @ApiDefault
    case start
    case center
    case end
    case mixed
}
