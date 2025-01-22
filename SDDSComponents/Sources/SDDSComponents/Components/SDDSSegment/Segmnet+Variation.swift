import Foundation

public extension SegmentAppearance {
    func applyColorVariation(variation: SegmentAppearance) -> SegmentAppearance {
        SegmentAppearance(
            size: size,
            itemShapeStyle: itemShapeStyle,
            itemSize: itemSize,
            layoutMode: layoutMode,
            backgroundColor: variation.backgroundColor
        )
    }
}
