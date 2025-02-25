import Foundation
import SDDSThemeCore

extension BadgeAppearance {
    func buttonAppearance(iconColor: ColorToken, iconSize: CGSize, iconPadding: CGFloat) -> ButtonAppearance {
        ButtonAppearance(
            size: size.buttonSize(iconSize: iconSize, iconPadding: iconPadding),
            titleTypography: labelTypography,
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
