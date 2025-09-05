import Foundation
import SwiftUI
import SDDSThemeCore

public protocol PopoverSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var offset: CGFloat { get }
    var pathDrawer: PathDrawer { get }
    var tailHeight: CGFloat { get }
    var tailWidth: CGFloat { get }
    var tailPadding: CGFloat { get }
    var width: CGFloat { get }
}

public struct DefaultPopoverSize: PopoverSizeConfiguration {
    public var offset: CGFloat = 0
    public var pathDrawer: PathDrawer = CornerRadiusDrawer(cornerRadius: 16)
    public var tailHeight: CGFloat = 8
    public var tailWidth: CGFloat = 20
    public var tailPadding: CGFloat = 20
    public var width: CGFloat = 182
    
    public var debugDescription: String {
        "DefaultPopoverSize"
    }
}

public struct ZeroPopoverSize: PopoverSizeConfiguration {
    public var offset: CGFloat = 0
    public var pathDrawer: PathDrawer = DefaultPathDrawer()
    public var tailHeight: CGFloat = 0
    public var tailWidth: CGFloat = 0
    public var tailPadding: CGFloat = 0
    public var width: CGFloat = 0
    
    public var debugDescription: String {
        "ZeroPopoverSize"
    }
    
    public init() {}
}
