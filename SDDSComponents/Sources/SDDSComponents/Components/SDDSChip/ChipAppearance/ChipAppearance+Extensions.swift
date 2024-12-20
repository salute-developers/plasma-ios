// MARK: - ChipAppearance Extension
import Foundation

public extension ChipAppearance {
    func size(_ size: ChipSizeConfiguration) -> ChipAppearance {
        return ChipAppearance(
            size: size,
            titleColor: self.titleColor,
            titleTypography: self.titleTypography,
            imageTintColor: self.imageTintColor,
            buttonTintColor: self.buttonTintColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha
        )
    }
    
    func titleColor(_ titleColor: ColorToken) -> ChipAppearance {
        return ChipAppearance(
            size: self.size,
            titleColor: titleColor,
            titleTypography: self.titleTypography,
            imageTintColor: self.imageTintColor,
            buttonTintColor: self.buttonTintColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha
        )
    }
    
    func titleTypography(_ titleTypography: TypographyConfiguration) -> ChipAppearance {
        return ChipAppearance(
            size: self.size,
            titleColor: self.titleColor,
            titleTypography: titleTypography,
            imageTintColor: self.imageTintColor,
            buttonTintColor: self.buttonTintColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha
        )
    }
    
    func imageTintColor(_ imageTintColor: ColorToken) -> ChipAppearance {
        return ChipAppearance(
            size: self.size,
            titleColor: self.titleColor,
            titleTypography: self.titleTypography,
            imageTintColor: imageTintColor,
            buttonTintColor: self.buttonTintColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha
        )
    }
    
    func buttonTintColor(_ buttonTintColor: ColorToken) -> ChipAppearance {
        return ChipAppearance(
            size: self.size,
            titleColor: self.titleColor,
            titleTypography: self.titleTypography,
            imageTintColor: self.imageTintColor,
            buttonTintColor: buttonTintColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha
        )
    }
    
    func backgroundColor(_ backgroundColor: ColorToken) -> ChipAppearance {
        return ChipAppearance(
            size: self.size,
            titleColor: self.titleColor,
            titleTypography: self.titleTypography,
            imageTintColor: self.imageTintColor,
            buttonTintColor: self.buttonTintColor,
            backgroundColor: backgroundColor,
            disabledAlpha: self.disabledAlpha
        )
    }
    
    func disabledAlpha(_ disabledAlpha: CGFloat) -> ChipAppearance {
        return ChipAppearance(
            size: self.size,
            titleColor: self.titleColor,
            titleTypography: self.titleTypography,
            imageTintColor: self.imageTintColor,
            buttonTintColor: self.buttonTintColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: disabledAlpha
        )
    }
    
    func applyColorVariation(variation: ChipAppearance) -> ChipAppearance {
        return ChipAppearance(
            size: self.size,
            titleColor: variation.titleColor,
            titleTypography: self.titleTypography,
            imageTintColor: variation.imageTintColor,
            buttonTintColor: variation.buttonTintColor,
            backgroundColor: variation.backgroundColor,
            disabledAlpha: variation.disabledAlpha
        )
    }
}
