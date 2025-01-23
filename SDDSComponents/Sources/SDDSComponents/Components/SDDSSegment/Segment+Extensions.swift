import Foundation

public extension SegmentAppearance {
    func size(_ size: SegmentSizeConfiguration) -> SegmentAppearance {
        return SegmentAppearance(
            size: size,
            shapeStyle: self.shapeStyle,
            layoutMode: self.layoutMode,
            backgroundColor: self.backgroundColor
        )
    }
    
    func shapeStyle(_ shapeStyle: ComponentShapeStyle) -> SegmentAppearance {
        return SegmentAppearance(
            size: self.size,
            shapeStyle: shapeStyle,
            layoutMode: self.layoutMode,
            backgroundColor: self.backgroundColor
        )
    }
}
