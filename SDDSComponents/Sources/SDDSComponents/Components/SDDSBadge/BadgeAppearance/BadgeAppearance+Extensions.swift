import Foundation
import SDDSThemeCore

extension BadgeAppearance {
    func buttonAppearance(iconColor: ColorToken, iconSize: CGSize, iconPadding: CGFloat) -> ButtonAppearance {
        let size = size.buttonSize(iconSize: iconSize, iconPadding: iconPadding)
        let typography = OneSizeTypography<ButtonSizeConfiguration>(token: labelTypography.typography(with: self.size)).asContainer
        
        return ButtonAppearance(
            size: size,
            titleTypography: typography,
            titleColor: labelColor.buttonColor,
            subtitleTypography: .default,
            subtitleColor: ColorToken.clearColor.buttonColor,
            iconColor: iconColor.buttonColor,
            spinnerColor: ColorToken.clearColor.buttonColor,
            backgroundColor: backgroundColor.buttonColor,
            disabledAlpha: 0,
            loadingAlpha: 0
        )
    }
}
