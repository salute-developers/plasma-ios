import Foundation

public protocol SegmentSizeConfiguration: SizeConfiguration {
    var horizontalHeight: CGFloat { get }
    var verticalWidth: CGFloat { get }
    func cornerRadius(style: ComponentShapeStyle) -> CGFloat
    var paddings: CGFloat { get }
}

public struct SegmentZeroSize: SegmentSizeConfiguration {
    public var horizontalHeight: CGFloat = 0
    public var verticalWidth: CGFloat = 0
    public func cornerRadius(style: ComponentShapeStyle) -> CGFloat { 0 }
    public let paddings: CGFloat = 0
    
    public init() {}
}
