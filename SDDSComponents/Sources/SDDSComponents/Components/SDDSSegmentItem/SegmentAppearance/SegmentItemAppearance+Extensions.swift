import Foundation

public extension SegmentItemAppearance {
    func size(_ size: SegmentItemSizeConfiguration) -> SegmentItemAppearance {
        return SegmentItemAppearance(
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
    
    func shapeStyle(_ shapeStyle: ComponentShapeStyle) -> SegmentItemAppearance {
        return SegmentItemAppearance(
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
    
    func titleTypography(_ titleTypography: TypographyConfiguration) -> SegmentItemAppearance {
        return SegmentItemAppearance(
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
    
    func titleColor(_ titleColor: ButtonColor) -> SegmentItemAppearance {
        return SegmentItemAppearance(
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
    
    func subtitleTypography(_ subtitleTypography: TypographyConfiguration) -> SegmentItemAppearance {
        return SegmentItemAppearance(
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
    
    func subtitleColor(_ subtitleColor: ButtonColor) -> SegmentItemAppearance {
        return SegmentItemAppearance(
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
    
    func iconColor(_ iconColor: ButtonColor) -> SegmentItemAppearance {
        return SegmentItemAppearance(
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
    
    func backgroundColor(_ backgroundColor: ButtonColor) -> SegmentItemAppearance {
        return SegmentItemAppearance(
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
    
    func disabledAlpha(_ disabledAlpha: CGFloat) -> SegmentItemAppearance {
        return SegmentItemAppearance(
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
}
