import Foundation

public extension SegmentAppearance {
    func applyColorVariation(variation: SegmentAppearance) -> SegmentAppearance {
        SegmentAppearance(
            size: size,
            shapeStyle: shapeStyle,
            layoutOrientation: layoutOrientation,
            backgroundColor: variation.backgroundColor
        )
    }
}
