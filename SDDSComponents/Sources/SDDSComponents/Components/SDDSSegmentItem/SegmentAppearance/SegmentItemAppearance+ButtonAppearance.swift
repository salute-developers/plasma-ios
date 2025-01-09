import Foundation

extension SegmentItemAppearance {
    var buttonAppearance: ButtonAppearance {
        .init(
            size: self.size,
            shapeStyle: self.shapeStyle,
            titleTypography: self.titleTypography,
            titleColor: self.titleColor,
            subtitleTypography: self.subtitleTypography,
            subtitleColor: self.subtitleColor,
            iconColor: self.iconColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha
        )
    }
}
