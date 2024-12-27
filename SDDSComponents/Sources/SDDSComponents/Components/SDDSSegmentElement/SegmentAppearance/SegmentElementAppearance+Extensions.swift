import Foundation

public extension SegmentElementAppearance {
    func size(_ size: SegmentElementSizeConfiguration) -> SegmentElementAppearance {
        return SegmentElementAppearance(
            size: size,
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
    
    func shapeStyle(_ shapeStyle: SegmentElementShapeStyle) -> SegmentElementAppearance {
        return SegmentElementAppearance(
            size: self.size,
            shapeStyle: shapeStyle,
            titleTypography: self.titleTypography,
            titleColor: self.titleColor,
            subtitleTypography: self.subtitleTypography,
            subtitleColor: self.subtitleColor,
            iconColor: self.iconColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha
        )
    }
    
    func titleTypography(_ titleTypography: TypographyConfiguration) -> SegmentElementAppearance {
        return SegmentElementAppearance(
            size: self.size,
            shapeStyle: self.shapeStyle,
            titleTypography: titleTypography,
            titleColor: self.titleColor,
            subtitleTypography: self.subtitleTypography,
            subtitleColor: self.subtitleColor,
            iconColor: self.iconColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha
        )
    }
    
    func titleColor(_ titleColor: SegmentElementColor) -> SegmentElementAppearance {
        return SegmentElementAppearance(
            size: self.size,
            shapeStyle: self.shapeStyle,
            titleTypography: self.titleTypography,
            titleColor: titleColor,
            subtitleTypography: self.subtitleTypography,
            subtitleColor: self.subtitleColor,
            iconColor: self.iconColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha
        )
    }
    
    func subtitleTypography(_ subtitleTypography: TypographyConfiguration) -> SegmentElementAppearance {
        return SegmentElementAppearance(
            size: self.size,
            shapeStyle: self.shapeStyle,
            titleTypography: self.titleTypography,
            titleColor: self.titleColor,
            subtitleTypography: subtitleTypography,
            subtitleColor: self.subtitleColor,
            iconColor: self.iconColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha
        )
    }
    
    func subtitleColor(_ subtitleColor: SegmentElementColor) -> SegmentElementAppearance {
        return SegmentElementAppearance(
            size: self.size,
            shapeStyle: self.shapeStyle,
            titleTypography: self.titleTypography,
            titleColor: self.titleColor,
            subtitleTypography: self.subtitleTypography,
            subtitleColor: subtitleColor,
            iconColor: self.iconColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha
        )
    }
    
    func iconColor(_ iconColor: SegmentElementColor) -> SegmentElementAppearance {
        return SegmentElementAppearance(
            size: self.size,
            shapeStyle: self.shapeStyle,
            titleTypography: self.titleTypography,
            titleColor: self.titleColor,
            subtitleTypography: self.subtitleTypography,
            subtitleColor: self.subtitleColor,
            iconColor: iconColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha
        )
    }
    
    func backgroundColor(_ backgroundColor: SegmentElementColor) -> SegmentElementAppearance {
        return SegmentElementAppearance(
            size: self.size,
            shapeStyle: self.shapeStyle,
            titleTypography: self.titleTypography,
            titleColor: self.titleColor,
            subtitleTypography: self.subtitleTypography,
            subtitleColor: self.subtitleColor,
            iconColor: self.iconColor,
            backgroundColor: backgroundColor,
            disabledAlpha: self.disabledAlpha
        )
    }
    
    func disabledAlpha(_ disabledAlpha: CGFloat) -> SegmentElementAppearance {
        return SegmentElementAppearance(
            size: self.size,
            shapeStyle: self.shapeStyle,
            titleTypography: self.titleTypography,
            titleColor: self.titleColor,
            subtitleTypography: self.subtitleTypography,
            subtitleColor: self.subtitleColor,
            iconColor: self.iconColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: disabledAlpha
        )
    }
    
    func loadingAlpha(_ loadingAlpha: CGFloat) -> SegmentElementAppearance {
        return SegmentElementAppearance(
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
