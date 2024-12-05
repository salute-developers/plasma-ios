import Foundation

public extension ButtonAppearance {
    func applyColorVariation(variation: ButtonAppearance) -> ButtonAppearance {
        ButtonAppearance(
            size: size,
            shapeStyle: shapeStyle,
            titleTypography: titleTypography,
            titleColor: variation.titleColor,
            subtitleTypography: subtitleTypography,
            subtitleColor: variation.subtitleColor,
            iconColor: variation.iconColor,
            spinnerColor: variation.spinnerColor,
            backgroundColor: variation.backgroundColor,
            disabledAlpha: variation.disabledAlpha,
            loadingAlpha: variation.loadingAlpha
        )
    }
}
