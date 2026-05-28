import Foundation
import SDDSThemeCore

extension BadgeAppearance {
    func buttonAppearance(iconColor: StatefulFillStyle, iconSize: CGSize, iconPadding: CGFloat) -> ButtonAppearance {
        let size = size.buttonSize(iconSize: iconSize, iconPadding: iconPadding)
        let typography = OneSizeTypography<ButtonSizeConfiguration>(token: labelTypography.typography(with: self.size)).asContainer

        return ButtonAppearance(
            size: size,
            titleTypography: typography,
            titleColor: labelColor,
            subtitleTypography: .default,
            subtitleColor: StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
            iconColor: iconColor,
            spinnerColor: StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
            backgroundColor: backgroundColor,
            disabledAlpha: 0,
            loadingAlpha: 0
        )
    }
}
