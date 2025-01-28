import Foundation
import SDDSComponents
import SDDSServTheme
import SDDSThemeCore
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
            titleColor: .textDefaultPrimary,
            optionalTitleColor: .textDefaultTertiary,
            textColor: .textDefaultPrimary,
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
            backgroundColorReadOnly: .surfaceDefaultSolidPrimary,
            backgroundColorError: .surfaceDefaultTransparentNegative,
            backgroundColorWarning: .surfaceDefaultTransparentWarning,
            backgroundColorSuccess: .surfaceDefaultTransparentPositive,
            captionColorDefault: .textDefaultSecondary,
            captionColorError: .textDefaultNegative,
            captionColorWarning: .textDefaultWarning,
            captionColorSuccess: .textDefaultAccent,
            placeholderColorDefault: .textDefaultSecondary,
            placeholderColorError: .textDefaultNegative,
            placeholderColorWarning: .textDefaultWarning,
            placeholderColorSuccess: .textDefaultAccent,
            textBeforeColor: .textDefaultTertiary,
            textAfterColor: .textDefaultTertiary,
            startContentColor: .textDefaultSecondary,
            endContentColor: .textDefaultSecondary,
            textColorReadOnly: .textDefaultPrimary,
            captionColorReadOnly: .textDefaultSecondary,
            placeholderColorReadOnly: .textDefaultSecondary
        )
    }
}

#Preview {
    SDDSTextFieldPreview.previews
}
