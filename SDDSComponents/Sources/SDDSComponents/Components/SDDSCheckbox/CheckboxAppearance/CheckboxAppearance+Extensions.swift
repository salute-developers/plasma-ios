import Foundation

public extension CheckboxAppearance {
    func size(_ size: SelectionControlSizeConfiguration) -> CheckboxAppearance {
        return CheckboxAppearance(
            size: size,
            titleTypography: self.titleTypography,
            subtitleTypography: self.subtitleTypography,
            titleColor: self.titleColor,
            subtitleColor: self.subtitleColor,
            disabledAlpha: self.disabledAlpha,
            imageTintColor: self.imageTintColor
        )
    }
    
    func titleTypography(_ titleTypography: TypographyConfiguration) -> CheckboxAppearance {
        return CheckboxAppearance(
            size: self.size,
            titleTypography: titleTypography,
            subtitleTypography: self.subtitleTypography,
            titleColor: self.titleColor,
            subtitleColor: self.subtitleColor,
            disabledAlpha: self.disabledAlpha,
            imageTintColor: self.imageTintColor
        )
    }
    
    func subtitleTypography(_ subtitleTypography: TypographyConfiguration) -> CheckboxAppearance {
        return CheckboxAppearance(
            size: self.size,
            titleTypography: self.titleTypography,
            subtitleTypography: subtitleTypography,
            titleColor: self.titleColor,
            subtitleColor: self.subtitleColor,
            disabledAlpha: self.disabledAlpha,
            imageTintColor: self.imageTintColor
        )
    }
    
    func titleColor(_ titleColor: ColorToken) -> CheckboxAppearance {
        return CheckboxAppearance(
            size: self.size,
            titleTypography: self.titleTypography,
            subtitleTypography: self.subtitleTypography,
            titleColor: titleColor,
            subtitleColor: self.subtitleColor,
            disabledAlpha: self.disabledAlpha,
            imageTintColor: self.imageTintColor
        )
    }
    
    func subtitleColor(_ subtitleColor: ColorToken) -> CheckboxAppearance {
        return CheckboxAppearance(
            size: self.size,
            titleTypography: self.titleTypography,
            subtitleTypography: self.subtitleTypography,
            titleColor: self.titleColor,
            subtitleColor: subtitleColor,
            disabledAlpha: self.disabledAlpha,
            imageTintColor: self.imageTintColor
        )
    }
    
    func disabledAlpha(_ disabledAlpha: CGFloat) -> CheckboxAppearance {
        return CheckboxAppearance(
            size: self.size,
            titleTypography: self.titleTypography,
            subtitleTypography: self.subtitleTypography,
            titleColor: self.titleColor,
            subtitleColor: self.subtitleColor,
            disabledAlpha: disabledAlpha,
            imageTintColor: self.imageTintColor
        )
    }
    
    func imageTintColor(_ imageTintColor: ColorToken?) -> CheckboxAppearance {
        return CheckboxAppearance(
            size: self.size,
            titleTypography: self.titleTypography,
            subtitleTypography: self.subtitleTypography,
            titleColor: self.titleColor,
            subtitleColor: self.subtitleColor,
            disabledAlpha: self.disabledAlpha,
            imageTintColor: imageTintColor
        )
    }
    
    func applyColorVariation(variation: CheckboxAppearance) -> CheckboxAppearance {
        return CheckboxAppearance(
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
