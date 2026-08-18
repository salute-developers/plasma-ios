import Foundation
import SwiftUI
import SDDSApiInfo
@_exported import SDDSThemeCore

public protocol SelectionControlSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    @ApiName("toggleHeight")
    var height: CGFloat { get }
    @ApiName("toggleWidth")
    var width: CGFloat { get }
    @ApiName("textPadding")
    var horizontalGap: CGFloat { get }
    @ApiName("descriptionPadding")
    var verticalGap: CGFloat { get }
    @ApiName("shape")
    var togglePathDrawer: PathDrawer { get }
    @ApiName("toggleBorderWidth")
    var lineWidth: CGFloat { get }
    @ApiName("toggleIconWidth", state: .checked)
    var toggleCheckedIconWidth: CGFloat { get }
    @ApiName("toggleIconHeight", state: .checked)
    var toggleCheckedIconHeight: CGFloat { get }
    @ApiName("toggleIconWidth", state: .indeterminate)
    @ApiStateOnly
    var toggleIndeterminateIconWidth: CGFloat { get }
    @ApiName("toggleIconHeight", state: .indeterminate)
    @ApiStateOnly
    var toggleIndeterminateIconHeight: CGFloat { get }
    @ApiName("togglePadding")
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
