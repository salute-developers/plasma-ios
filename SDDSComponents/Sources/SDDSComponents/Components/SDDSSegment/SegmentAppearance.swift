import Foundation

public struct SegmentAppearance {
    public let size: SegmentSizeConfiguration
    public let shapeStyle: ComponentShapeStyle
    public let layoutOrientation: SegmentLayoutOrientation
    public let backgroundColor: ButtonColor
    
    public init(
        size: SegmentSizeConfiguration = SegmentDefaultSize(),
        shapeStyle: ComponentShapeStyle = .cornered,
        layoutOrientation: SegmentLayoutOrientation = .horizontal,
        backgroundColor: ButtonColor = ButtonColor()
    ) {
        self.size = size
        self.shapeStyle = shapeStyle
        self.layoutOrientation = layoutOrientation
        self.backgroundColor = backgroundColor
    }
}
