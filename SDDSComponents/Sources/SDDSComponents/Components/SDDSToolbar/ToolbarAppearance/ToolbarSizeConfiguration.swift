import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `ToolbarSizeConfiguration` определяет размеры и отступы компонента Toolbar.
 */
public protocol ToolbarSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var paddingStart: CGFloat { get }
    var paddingEnd: CGFloat { get }
    var paddingTop: CGFloat { get }
    var paddingBottom: CGFloat { get }
    var shape: PathDrawer { get }
    var slotPadding: CGFloat { get }
    var dividerMargin: CGFloat { get }
    var orientation: TabsOrientation { get }
}

/**
 Базовая реализация `ToolbarSizeConfiguration`.
 */
public struct ToolbarSize: ToolbarSizeConfiguration {
    public let paddingStart: CGFloat
    public let paddingEnd: CGFloat
    public let paddingTop: CGFloat
    public let paddingBottom: CGFloat
    public let shape: PathDrawer
    public let slotPadding: CGFloat
    public let dividerMargin: CGFloat
    public let orientation: TabsOrientation
    
    public init(
        paddingStart: CGFloat = 0,
        paddingEnd: CGFloat = 0,
        paddingTop: CGFloat = 0,
        paddingBottom: CGFloat = 0,
        shape: PathDrawer = DefaultPathDrawer(),
        slotPadding: CGFloat = 0,
        dividerMargin: CGFloat = 0,
        orientation: TabsOrientation = .horizontal
    ) {
        self.paddingStart = paddingStart
        self.paddingEnd = paddingEnd
        self.paddingTop = paddingTop
        self.paddingBottom = paddingBottom
        self.shape = shape
        self.slotPadding = slotPadding
        self.dividerMargin = dividerMargin
        self.orientation = orientation
    }
    
    public var debugDescription: String {
        "ToolbarSize"
    }
}
