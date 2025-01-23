import Foundation

public extension SegmentAppearance {
    func applyColorVariation(variation: SegmentAppearance) -> SegmentAppearance {
        SegmentAppearance(
            size: size,
            shapeStyle: shapeStyle,
            layoutMode: layoutMode,
            backgroundColor: variation.backgroundColor
        )
    }
}
