import Foundation

public extension SegmentAppearance {
    func applyColorVariation(variation: SegmentAppearance) -> SegmentAppearance {
        SegmentAppearance(
            size: size,
            layoutOrientation: layoutOrientation,
            backgroundColor: variation.backgroundColor,
            segmentItemAppearance: segmentItemAppearance,
            StrechMode: StrechMode
        )
    }
}

