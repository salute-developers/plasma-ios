import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public protocol SelectionControlSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    // sdds:apiName=toggleHeight
    var height: CGFloat { get }
    // sdds:apiName=toggleWidth
    var width: CGFloat { get }
    // sdds:apiName=textPadding
    var horizontalGap: CGFloat { get }
    // sdds:apiName=descriptionPadding
    var verticalGap: CGFloat { get }
    var togglePathDrawer: PathDrawer { get }
    // sdds:apiName=toggleBorderWidth
    var lineWidth: CGFloat { get }
    // sdds:apiName=toggleIconWidth
    var toggleCheckedIconWidth: CGFloat { get }
    // sdds:apiName=toggleIconHeight
    var toggleCheckedIconHeight: CGFloat { get }
    // sdds:apiName=toggleIndeterminateWidth
    var toggleIndeterminateIconWidth: CGFloat { get }
    // sdds:apiName=toggleIndeterminateHeight
    var toggleIndeterminateIconHeight: CGFloat { get }
    // sdds:apiName=togglePadding
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
