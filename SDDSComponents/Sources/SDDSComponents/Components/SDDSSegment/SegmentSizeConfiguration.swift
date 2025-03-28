import Foundation
import SwiftUI
import SDDSThemeCore

public protocol SegmentSizeConfiguration: SizeConfiguration {
    @available(*, deprecated, message: "Don't use it, public method will be removed")
    var horizontalHeight: CGFloat { get }
    @available(*, deprecated, message: "Don't use it, public method will be removed")
    var verticalWidth: CGFloat { get }
    var pathDrawer: PathDrawer { get }
    var paddings: EdgeInsets { get }
}

public struct SegmentZeroSize: SegmentSizeConfiguration {
    public var horizontalHeight: CGFloat = 0
    public var verticalWidth: CGFloat = 0
    public var pathDrawer: PathDrawer = DefaultPathDrawer()
    public let paddings: EdgeInsets = .init()
    
    public init() {}
}
