// MARK: - ButtonAppearance Extension
import Foundation

public extension ButtonAppearance {
    func size(_ size: ButtonSizeConfiguration) -> ButtonAppearance {
        return ButtonAppearance(
            size: size,
            shapeStyle: self.shapeStyle,
            titleTypography: self.titleTypography,
            titleColor: self.titleColor,
            subtitleTypography: self.subtitleTypography,
            subtitleColor: self.subtitleColor,
            iconColor: self.iconColor,
            spinnerColor: self.spinnerColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha,
            loadingAlpha: self.loadingAlpha
        )
    }
    
    func shapeStyle(_ shapeStyle: ButtonShapeStyle) -> ButtonAppearance {
        return ButtonAppearance(
            size: self.size,
            shapeStyle: shapeStyle,
            titleTypography: self.titleTypography,
            titleColor: self.titleColor,
            subtitleTypography: self.subtitleTypography,
            subtitleColor: self.subtitleColor,
            iconColor: self.iconColor,
            spinnerColor: self.spinnerColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha,
            loadingAlpha: self.loadingAlpha
        )
    }
    
    func titleTypography(_ titleTypography: TypographyConfiguration) -> ButtonAppearance {
        return ButtonAppearance(
            size: self.size,
            shapeStyle: self.shapeStyle,
            titleTypography: titleTypography,
            titleColor: self.titleColor,
            subtitleTypography: self.subtitleTypography,
            subtitleColor: self.subtitleColor,
            iconColor: self.iconColor,
            spinnerColor: self.spinnerColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha,
            loadingAlpha: self.loadingAlpha
        )
    }
    
    func titleColor(_ titleColor: ButtonColor) -> ButtonAppearance {
        return ButtonAppearance(
            size: self.size,
            shapeStyle: self.shapeStyle,
            titleTypography: self.titleTypography,
            titleColor: titleColor,
            subtitleTypography: self.subtitleTypography,
            subtitleColor: self.subtitleColor,
            iconColor: self.iconColor,
            spinnerColor: self.spinnerColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha,
            loadingAlpha: self.loadingAlpha
        )
    }
    
    func subtitleTypography(_ subtitleTypography: TypographyConfiguration) -> ButtonAppearance {
        return ButtonAppearance(
            size: self.size,
            shapeStyle: self.shapeStyle,
            titleTypography: self.titleTypography,
            titleColor: self.titleColor,
            subtitleTypography: subtitleTypography,
            subtitleColor: self.subtitleColor,
            iconColor: self.iconColor,
            spinnerColor: self.spinnerColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha,
            loadingAlpha: self.loadingAlpha
        )
    }
    
    func subtitleColor(_ subtitleColor: ButtonColor) -> ButtonAppearance {
        return ButtonAppearance(
            size: self.size,
            shapeStyle: self.shapeStyle,
            titleTypography: self.titleTypography,
            titleColor: self.titleColor,
            subtitleTypography: self.subtitleTypography,
            subtitleColor: subtitleColor,
            iconColor: self.iconColor,
            spinnerColor: self.spinnerColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha,
            loadingAlpha: self.loadingAlpha
        )
    }
    
    func iconColor(_ iconColor: ButtonColor) -> ButtonAppearance {
        return ButtonAppearance(
            size: self.size,
            shapeStyle: self.shapeStyle,
            titleTypography: self.titleTypography,
            titleColor: self.titleColor,
            subtitleTypography: self.subtitleTypography,
            subtitleColor: self.subtitleColor,
            iconColor: iconColor,
            spinnerColor: self.spinnerColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha,
            loadingAlpha: self.loadingAlpha
        )
    }
    
    func spinnerColor(_ spinnerColor: ButtonColor) -> ButtonAppearance {
        return ButtonAppearance(
            size: self.size,
            shapeStyle: self.shapeStyle,
            titleTypography: self.titleTypography,
            titleColor: self.titleColor,
            subtitleTypography: self.subtitleTypography,
            subtitleColor: self.subtitleColor,
            iconColor: self.iconColor,
            spinnerColor: spinnerColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha,
            loadingAlpha: self.loadingAlpha
        )
    }
    
    func backgroundColor(_ backgroundColor: ButtonColor) -> ButtonAppearance {
        return ButtonAppearance(
            size: self.size,
            shapeStyle: self.shapeStyle,
            titleTypography: self.titleTypography,
            titleColor: self.titleColor,
            subtitleTypography: self.subtitleTypography,
            subtitleColor: self.subtitleColor,
            iconColor: self.iconColor,
            spinnerColor: self.spinnerColor,
            backgroundColor: backgroundColor,
            disabledAlpha: self.disabledAlpha,
            loadingAlpha: self.loadingAlpha
        )
    }
    
    func disabledAlpha(_ disabledAlpha: CGFloat) -> ButtonAppearance {
        return ButtonAppearance(
            size: self.size,
            shapeStyle: self.shapeStyle,
            titleTypography: self.titleTypography,
            titleColor: self.titleColor,
            subtitleTypography: self.subtitleTypography,
            subtitleColor: self.subtitleColor,
            iconColor: self.iconColor,
            spinnerColor: self.spinnerColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: disabledAlpha,
            loadingAlpha: self.loadingAlpha
        )
    }
    
    func loadingAlpha(_ loadingAlpha: CGFloat) -> ButtonAppearance {
        return ButtonAppearance(
            size: self.size,
            shapeStyle: self.shapeStyle,
            titleTypography: self.titleTypography,
            titleColor: self.titleColor,
            subtitleTypography: self.subtitleTypography,
            subtitleColor: self.subtitleColor,
            iconColor: self.iconColor,
            spinnerColor: self.spinnerColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha,
            loadingAlpha: loadingAlpha
        )
    }
}
