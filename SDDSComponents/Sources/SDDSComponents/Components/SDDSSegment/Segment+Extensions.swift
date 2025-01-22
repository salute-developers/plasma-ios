import Foundation

public extension SegmentAppearance {
    func size(_ size: SegmentSizeConfiguration) -> SegmentAppearance {
        return SegmentAppearance(
            size: size,
            itemShapeStyle: self.itemShapeStyle,
            itemSize: self.itemSize,
            layoutMode: self.layoutMode,
            backgroundColor: self.backgroundColor
        )
    }
}
