import Foundation

public struct SegmentAppearance {
    public let size: SegmentSizeConfiguration
    public let shapeStyle: ComponentShapeStyle
    public let layoutMode: SegmentLayoutMode
    public let backgroundColor: ButtonColor
    
    public init(
        size: SegmentSizeConfiguration = SegmentDefaultSize(),
        shapeStyle: ComponentShapeStyle = .cornered,
        layoutMode: SegmentLayoutMode = .horizontal,
        backgroundColor: ButtonColor = ButtonColor()
    ) {
        self.size = size
        self.shapeStyle = shapeStyle
        self.layoutMode = layoutMode
        self.backgroundColor = backgroundColor
    }
}
