import Foundation

public extension SegmentElementAppearance {
    func applyColorVariation(variation: SegmentElementAppearance) -> SegmentElementAppearance {
        SegmentElementAppearance(
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


