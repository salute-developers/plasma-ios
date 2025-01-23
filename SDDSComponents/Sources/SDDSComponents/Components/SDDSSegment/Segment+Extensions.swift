import Foundation

public extension SegmentAppearance {
    func size(_ size: SegmentSizeConfiguration) -> SegmentAppearance {
        return SegmentAppearance(
            size: size,
            shapeStyle: self.shapeStyle,
            layoutOrientation: self.layoutOrientation,
            backgroundColor: self.backgroundColor
        )
    }
    
    func shapeStyle(_ shapeStyle: ComponentShapeStyle) -> SegmentAppearance {
        return SegmentAppearance(
            size: self.size,
            shapeStyle: shapeStyle,
            layoutOrientation: self.layoutOrientation,
            backgroundColor: self.backgroundColor
        )
    }
    
    func layoutOrientation(_ layoutOrientation: SegmentLayoutOrientation) -> SegmentAppearance {
        return SegmentAppearance(
            size: self.size,
            shapeStyle: self.shapeStyle,
            layoutOrientation: layoutOrientation,
            backgroundColor: self.backgroundColor
        )
    }
}
