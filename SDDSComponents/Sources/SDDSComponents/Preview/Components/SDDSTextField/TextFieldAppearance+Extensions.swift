import Foundation

@_exported import SDDSservTheme
@_exported import SDDSThemeCore
import SwiftUI
import UIKit

public extension TextFieldAppearance {
    static var defaultAppearance: TextFieldAppearance {
        .init(
            textTypography: TextFieldTypography.text,
            titleTypography: TextFieldTypography.title,
            innerTitleTypography: TextFieldTypography.innerTitle,
            captionTypography: TextFieldTypography.caption,
            textBeforeTypography: TextFieldTypography.text,
            textAfterTypography: TextFieldTypography.text,
            titleColor: .surfaceInverseSolidPrimary.withOpacity(0.96),
            optionalTitleColor: .surfaceInverseSolidPrimary.withOpacity(0.28),
            textColor: .surfaceInverseSolidPrimary.withOpacity(0.96),
            textColorError: .textDefaultNegative,
            textColorWarning: .textDefaultWarning,
            textColorSuccess: .textDefaultAccent,
            disabledAlpha: 0.4,
            requiredIndicatorColor: .surfaceOnDarkNegative,
            cursorColor: .textDefaultAccent,
            focusedBackgroundColor: .surfaceDefaultTransparentSecondary,
            lineColor: .surfaceDefaultTransparentTertiary,
            focusedLineColor: .textDefaultAccent,
            focusedLineColorError: .textDefaultAccent,
            focusedLineColorWarning: .textDefaultAccent,
            focusedLineColorSuccess: .textDefaultAccent,
            borderColorDefault: Color.clear.token,
            borderColorError: Color.clear.token,
            borderColorWarning: Color.clear.token,
            borderColorSuccess: Color.clear.token,
            backgroundColorDefault: .surfaceDefaultTransparentPrimary,
            backgroundColorError: ColorToken(
                darkColor: Color(UIColor(hex: "#FF293E").withAlphaComponent(0.2)),
                lightColor: Color(UIColor(hex: "#FF293E").withAlphaComponent(0.12))
            ),
            backgroundColorWarning: .surfaceDefaultTransparentWarning.inverted,
            backgroundColorSuccess: ColorToken(
                darkColor: Color(UIColor(hex: "#1A9E32").withAlphaComponent(0.2)),
                lightColor: Color(UIColor(hex: "#1A9E32").withAlphaComponent(0.12))
            ),
            captionColorDefault: .surfaceInverseSolidPrimary.withOpacity(0.56),
            captionColorError: .textDefaultNegative,
            captionColorWarning: .textDefaultWarning,
            captionColorSuccess: .textDefaultAccent,
            placeholderColorDefault: .textDefaultSecondary,
            placeholderColorError: .textDefaultNegative,
            placeholderColorWarning: .textDefaultWarning,
            placeholderColorSuccess: .textDefaultAccent,
            textBeforeColor: .textDefaultTertiary,
            textAfterColor: .textDefaultTertiary
        )
    }
}
