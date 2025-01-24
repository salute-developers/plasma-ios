import Foundation

public extension SegmentAppearance {
    func size(_ size: SegmentSizeConfiguration) -> SegmentAppearance {
        return SegmentAppearance(
            size: size,
            shapeStyle: self.shapeStyle,
            layoutOrientation: self.layoutOrientation,
            backgroundColor: self.backgroundColor,
            segmentItemAppearance: self.segmentItemAppearance,
            stretchMode: self.stretchMode
        )
    }
    
    func shapeStyle(_ shapeStyle: ComponentShapeStyle) -> SegmentAppearance {
        return SegmentAppearance(
            size: self.size,
            shapeStyle: shapeStyle,
            layoutOrientation: self.layoutOrientation,
            backgroundColor: self.backgroundColor,
            segmentItemAppearance: self.segmentItemAppearance,
            stretchMode: self.stretchMode
        )
    }
    
    func layoutOrientation(_ layoutOrientation: SegmentLayoutOrientation) -> SegmentAppearance {
        return SegmentAppearance(
            size: self.size,
            shapeStyle: self.shapeStyle,
            layoutOrientation: layoutOrientation,
            backgroundColor: self.backgroundColor,
            segmentItemAppearance: self.segmentItemAppearance,
            stretchMode: self.stretchMode
        )
    }
    
    func backgroundColor(_ backgroundColor: ButtonColor) -> SegmentAppearance {
        return SegmentAppearance(
            size: self.size,
            shapeStyle: self.shapeStyle,
            layoutOrientation: self.layoutOrientation,
            backgroundColor: backgroundColor,
            segmentItemAppearance: self.segmentItemAppearance,
            stretchMode: self.stretchMode
        )
    }
    
    func segmentItemAppearance(_ segmentItemAppearance: SegmentItemAppearance) -> SegmentAppearance {
        return SegmentAppearance(
            size: self.size,
            shapeStyle: self.shapeStyle,
            layoutOrientation: self.layoutOrientation,
            backgroundColor: self.backgroundColor,
            segmentItemAppearance: segmentItemAppearance,
            stretchMode: self.stretchMode
        )
    }
}
