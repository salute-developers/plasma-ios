import Foundation
import SDDSApiInfo
import SwiftUI
@_exported import SDDSThemeCore

/**
 `DrawerCloseIconPlacement` определяет варианты размещения иконки закрытия в Drawer.
 */
public enum DrawerCloseIconPlacement {
    case inner
    @ApiDefault
    case none
    case outer
}
