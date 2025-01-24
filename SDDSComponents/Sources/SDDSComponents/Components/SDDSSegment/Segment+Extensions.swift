import Foundation

public extension SegmentAppearance {
    func size(_ size: SegmentSizeConfiguration) -> SegmentAppearance {
        return SegmentAppearance(
            size: size,
            layoutOrientation: self.layoutOrientation,
            backgroundColor: self.backgroundColor,
            segmentItemAppearance: self.segmentItemAppearance,
            StrechMode: self.StrechMode
        )
    }

    func layoutOrientation(_ layoutOrientation: SegmentLayoutOrientation) -> SegmentAppearance {
        return SegmentAppearance(
            size: self.size,
            layoutOrientation: layoutOrientation,
            backgroundColor: self.backgroundColor,
            segmentItemAppearance: self.segmentItemAppearance,
            StrechMode: self.StrechMode
        )
    }

    func backgroundColor(_ backgroundColor: ButtonColor) -> SegmentAppearance {
        return SegmentAppearance(
            size: self.size,
            layoutOrientation: self.layoutOrientation,
            backgroundColor: backgroundColor,
            segmentItemAppearance: self.segmentItemAppearance,
            StrechMode: self.StrechMode
        )
    }

    func segmentItemAppearance(_ segmentItemAppearance: SegmentItemAppearance) -> SegmentAppearance {
        return SegmentAppearance(
            size: self.size,
            layoutOrientation: self.layoutOrientation,
            backgroundColor: self.backgroundColor,
            segmentItemAppearance: segmentItemAppearance,
            StrechMode: self.StrechMode
        )
    }

    func strechMode(_ StrechMode: StrechMode) -> SegmentAppearance {
        return SegmentAppearance(
            size: self.size,
            layoutOrientation: self.layoutOrientation,
            backgroundColor: self.backgroundColor,
            segmentItemAppearance: self.segmentItemAppearance,
            StrechMode: StrechMode
        )
    }
}
