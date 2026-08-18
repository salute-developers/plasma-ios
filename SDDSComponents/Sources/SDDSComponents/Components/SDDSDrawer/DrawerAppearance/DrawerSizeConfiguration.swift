import Foundation
import SwiftUI
import SDDSApiInfo
@_exported import SDDSThemeCore

/**
 `DrawerSizeConfiguration` определяет размеры и отступы компонента Drawer.
 */
public protocol DrawerSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var paddingStart: CGFloat { get }
    var paddingEnd: CGFloat { get }
    var paddingTop: CGFloat { get }
    var paddingBottom: CGFloat { get }
    var closeIconHeaderPadding: CGFloat { get }
    var closeIconOffsetX: CGFloat { get }
    var closeIconOffsetY: CGFloat { get }
    @ApiType(.iconSize)
    @ApiName("closeIcon")
    var closeIconSize: CGFloat { get }
    var closeIconPlacement: DrawerCloseIconPlacement { get }
}

/**
 Базовая реализация `DrawerSizeConfiguration` с нулевыми значениями.
 */
public struct ZeroDrawerSize: DrawerSizeConfiguration {
    public var paddingStart: CGFloat = 0
    public var paddingEnd: CGFloat = 0
    public var paddingTop: CGFloat = 0
    public var paddingBottom: CGFloat = 0
    public var closeIconHeaderPadding: CGFloat = 0
    public var closeIconOffsetX: CGFloat = 0
    public var closeIconOffsetY: CGFloat = 0
    public var closeIconSize: CGFloat = 0
    public var closeIconPlacement: DrawerCloseIconPlacement = .none
    
    public var debugDescription: String {
        return "ZeroDrawerSize"
    }
    
    public init() {}
}

