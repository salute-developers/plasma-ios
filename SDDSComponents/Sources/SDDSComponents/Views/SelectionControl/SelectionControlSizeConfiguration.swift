import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public protocol SelectionControlSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var height: CGFloat { get }
    var width: CGFloat { get }
    var horizontalGap: CGFloat { get }
    var verticalGap: CGFloat { get }
    var togglePathDrawer: PathDrawer { get }
    var lineWidth: CGFloat { get }
    var toggleCheckedIconWidth: CGFloat { get }
    var toggleCheckedIconHeight: CGFloat { get }
    var toggleIndeterminateIconWidth: CGFloat { get }
    var toggleIndeterminateIconHeight: CGFloat { get }
    var togglePaddings: CGFloat { get }
}

public struct ZeroSelectionControlSize: SelectionControlSizeConfiguration {
    public var height: CGFloat { 0 }
    public var width: CGFloat { 0 }
    public var toggleCheckedIconWidth: CGFloat { 0 }
    public var toggleCheckedIconHeight: CGFloat { 0 }
    public var toggleIndeterminateIconWidth: CGFloat { 0 }
    public var toggleIndeterminateIconHeight: CGFloat { 0 }
    public var horizontalGap: CGFloat { 0 }
    public var verticalGap: CGFloat { 0 }
    public var togglePathDrawer: PathDrawer = DefaultPathDrawer()
    public var lineWidth: CGFloat { 0 }
    public var togglePaddings: CGFloat { 0 }
    
    public var debugDescription: String { "ZeroSelectionControlSize " }
    
    public init() {}
}
