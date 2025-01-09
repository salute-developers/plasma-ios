import Foundation

public extension SegmentItemAppearance {
    func applyColorVariation(variation: SegmentItemAppearance) -> SegmentItemAppearance {
        SegmentItemAppearance(
            size: size,
            shapeStyle: shapeStyle,
            titleTypography: titleTypography,
            titleColor: variation.titleColor,
            subtitleTypography: subtitleTypography,
            subtitleColor: variation.subtitleColor,
            iconColor: variation.iconColor,
            backgroundColor: variation.backgroundColor,
            disabledAlpha: variation.disabledAlpha
        )
    }
}


