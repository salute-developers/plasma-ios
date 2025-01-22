import Foundation

public struct SegmentAppearance {
    public let size: SegmentSizeConfiguration
    public let itemShapeStyle: ComponentShapeStyle
    public let itemSize: ItemSize
    public let layoutMode: SegmentLayoutMode
    public let backgroundColor: ButtonColor
    
    public init(
        size: SegmentSizeConfiguration = SegmentDefaultSize(),
        itemShapeStyle: ComponentShapeStyle = .cornered,
        itemSize: ItemSize = .stretched,
        layoutMode: SegmentLayoutMode = .horizontal,
        backgroundColor: ButtonColor = ButtonColor()
    ) {
        self.size = size
        self.itemShapeStyle = itemShapeStyle
        self.itemSize = itemSize
        self.layoutMode = layoutMode
        self.backgroundColor = backgroundColor
    }
}
