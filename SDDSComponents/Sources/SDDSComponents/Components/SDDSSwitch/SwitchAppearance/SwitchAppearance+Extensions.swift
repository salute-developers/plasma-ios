// MARK: - SwitchAppearance Extension
import Foundation

public extension SwitchAppearance {
    func size(_ size: SwitchSizeConfiguration) -> SwitchAppearance {
        return SwitchAppearance(
            size: size,
            titleTypography: self.titleTypography,
            subtitleTypography: self.subtitleTypography,
            titleColor: self.titleColor,
            subtitleColor: self.subtitleColor,
            tintColor: self.tintColor,
            disabledAlpha: self.disabledAlpha
        )
    }
    
    func titleTypography(_ titleTypography: TypographyConfiguration) -> SwitchAppearance {
        return SwitchAppearance(
            size: self.size,
            titleTypography: titleTypography,
            subtitleTypography: self.subtitleTypography,
            titleColor: self.titleColor,
            subtitleColor: self.subtitleColor,
            tintColor: self.tintColor,
            disabledAlpha: self.disabledAlpha
        )
    }
    
    func subtitleTypography(_ subtitleTypography: TypographyConfiguration) -> SwitchAppearance {
        return SwitchAppearance(
            size: self.size,
            titleTypography: self.titleTypography,
            subtitleTypography: subtitleTypography,
            titleColor: self.titleColor,
            subtitleColor: self.subtitleColor,
            tintColor: self.tintColor,
            disabledAlpha: self.disabledAlpha
        )
    }
    
    func titleColor(_ titleColor: ColorToken) -> SwitchAppearance {
        return SwitchAppearance(
            size: self.size,
            titleTypography: self.titleTypography,
            subtitleTypography: self.subtitleTypography,
            titleColor: titleColor,
            subtitleColor: self.subtitleColor,
            tintColor: self.tintColor,
            disabledAlpha: self.disabledAlpha
        )
    }
    
    func subtitleColor(_ subtitleColor: ColorToken) -> SwitchAppearance {
        return SwitchAppearance(
            size: self.size,
            titleTypography: self.titleTypography,
            subtitleTypography: self.subtitleTypography,
            titleColor: self.titleColor,
            subtitleColor: subtitleColor,
            tintColor: self.tintColor,
            disabledAlpha: self.disabledAlpha
        )
    }
    
    func tintColor(_ tintColor: ColorToken) -> SwitchAppearance {
        return SwitchAppearance(
            size: self.size,
            titleTypography: self.titleTypography,
            subtitleTypography: self.subtitleTypography,
            titleColor: self.titleColor,
            subtitleColor: self.subtitleColor,
            tintColor: tintColor,
            disabledAlpha: self.disabledAlpha
        )
    }
    
    func disabledAlpha(_ disabledAlpha: CGFloat) -> SwitchAppearance {
        return SwitchAppearance(
            size: self.size,
            titleTypography: self.titleTypography,
            subtitleTypography: self.subtitleTypography,
            titleColor: self.titleColor,
            subtitleColor: self.subtitleColor,
            tintColor: self.tintColor,
            disabledAlpha: disabledAlpha
        )
    }
    
    func applyColorVariation(variation: SwitchAppearance) -> SwitchAppearance {
        return SwitchAppearance(
            size: self.size,
            titleTypography: self.titleTypography,
            subtitleTypography: self.subtitleTypography,
            titleColor: variation.titleColor,
            subtitleColor: variation.subtitleColor,
            tintColor: variation.tintColor,
            disabledAlpha: disabledAlpha
        )
    }
}
