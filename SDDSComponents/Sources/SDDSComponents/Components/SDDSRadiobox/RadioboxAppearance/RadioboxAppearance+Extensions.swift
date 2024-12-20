import Foundation

public extension RadioboxAppearance {
    func size(_ size: SelectionControlSizeConfiguration) -> RadioboxAppearance {
        return RadioboxAppearance(
            size: size,
            titleTypography: self.titleTypography,
            subtitleTypography: self.subtitleTypography,
            titleColor: self.titleColor,
            subtitleColor: self.subtitleColor,
            disabledAlpha: self.disabledAlpha,
            imageTintColor: self.imageTintColor
        )
    }
    
    func titleTypography(_ titleTypography: TypographyConfiguration) -> RadioboxAppearance {
        return RadioboxAppearance(
            size: self.size,
            titleTypography: titleTypography,
            subtitleTypography: self.subtitleTypography,
            titleColor: self.titleColor,
            subtitleColor: self.subtitleColor,
            disabledAlpha: self.disabledAlpha,
            imageTintColor: self.imageTintColor
        )
    }
    
    func subtitleTypography(_ subtitleTypography: TypographyConfiguration) -> RadioboxAppearance {
        return RadioboxAppearance(
            size: self.size,
            titleTypography: self.titleTypography,
            subtitleTypography: subtitleTypography,
            titleColor: self.titleColor,
            subtitleColor: self.subtitleColor,
            disabledAlpha: self.disabledAlpha,
            imageTintColor: self.imageTintColor
        )
    }
    
    func titleColor(_ titleColor: ColorToken) -> RadioboxAppearance {
        return RadioboxAppearance(
            size: self.size,
            titleTypography: self.titleTypography,
            subtitleTypography: self.subtitleTypography,
            titleColor: titleColor,
            subtitleColor: self.subtitleColor,
            disabledAlpha: self.disabledAlpha,
            imageTintColor: self.imageTintColor
        )
    }
    
    func subtitleColor(_ subtitleColor: ColorToken) -> RadioboxAppearance {
        return RadioboxAppearance(
            size: self.size,
            titleTypography: self.titleTypography,
            subtitleTypography: self.subtitleTypography,
            titleColor: self.titleColor,
            subtitleColor: subtitleColor,
            disabledAlpha: self.disabledAlpha,
            imageTintColor: self.imageTintColor
        )
    }
    
    func disabledAlpha(_ disabledAlpha: CGFloat) -> RadioboxAppearance {
        return RadioboxAppearance(
            size: self.size,
            titleTypography: self.titleTypography,
            subtitleTypography: self.subtitleTypography,
            titleColor: self.titleColor,
            subtitleColor: self.subtitleColor,
            disabledAlpha: disabledAlpha,
            imageTintColor: self.imageTintColor
        )
    }
    
    func imageTintColor(_ imageTintColor: ColorToken?) -> RadioboxAppearance {
        return RadioboxAppearance(
            size: self.size,
            titleTypography: self.titleTypography,
            subtitleTypography: self.subtitleTypography,
            titleColor: self.titleColor,
            subtitleColor: self.subtitleColor,
            disabledAlpha: self.disabledAlpha,
            imageTintColor: imageTintColor
        )
    }
    
    func applyColorVariation(variation: RadioboxAppearance) -> RadioboxAppearance {
        return RadioboxAppearance(
            size: self.size,
            titleTypography: self.titleTypography,
            subtitleTypography: self.subtitleTypography,
            titleColor: variation.titleColor,
            subtitleColor: variation.subtitleColor,
            disabledAlpha: variation.disabledAlpha,
            imageTintColor: variation.imageTintColor
        )
    }
}
