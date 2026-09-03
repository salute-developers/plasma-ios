import Foundation
import SwiftUI
import SDDSThemeCore
import SDDSApiInfo

public protocol SegmentSizeConfiguration: SizeConfiguration {
    @available(*, deprecated, message: "Don't use it, public method will be removed")
    @ApiValue("CGFloat(0)", zero: "CGFloat(0)")
    var horizontalHeight: CGFloat { get }
    @available(*, deprecated, message: "Don't use it, public method will be removed")
    @ApiValue("CGFloat(0)", zero: "CGFloat(0)")
    var verticalWidth: CGFloat { get }
    @ApiName("shape")
    var pathDrawer: PathDrawer { get }
    @ApiValue("insetsOrZero(paddingTop, paddingStart, paddingBottom, paddingEnd)")
    var paddings: EdgeInsets { get }
}

public struct SegmentZeroSize: SegmentSizeConfiguration {
    public var horizontalHeight: CGFloat = 0
    public var verticalWidth: CGFloat = 0
    public var pathDrawer: PathDrawer = DefaultPathDrawer()
    public let paddings: EdgeInsets = .init()

    public init() {}
}
