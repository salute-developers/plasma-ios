import Foundation
import SDDSComponents
import SDDSServTheme
import SDDSThemeCore

public extension ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
    var secondary: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: TextAreaClear.default.appearance)
        )
    }
}

public extension TextAreaClear {
    static var `default`: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        .init(
            name: "default",
            appearance: .init(
                backgroundColor: .surfaceDefaultTransparentPrimary,
                backgroundColorReadOnly: .surfaceDefaultTransparentPrimary,
                borderColor: .clearColor,
                captionColor: .textDefaultSecondary,
                captionColorFocused: .textDefaultAccent,
                captionColorReadOnly: .textDefaultSecondary,
                captionTypography: TextAreaTypography.caption,
                counterColor: .textDefaultSecondary,
                counterColorReadOnly: .textDefaultSecondary,
                counterTypography: TextAreaTypography.counter,
                cursorColor: .textDefaultAccent,
                disabledAlpha: 0.4,
                endContentColor: .textDefaultPrimary,
                backgroundColorFocused: .surfaceDefaultTransparentSecondary,
                innerTitleTypography: TextAreaTypography.innerTitle,
                lineColor: .surfaceDefaultTransparentTertiary,
                lineColorFocused: .textDefaultAccent,
                optionalTitleColor: .textDefaultTertiary,
                placeholderColor: .textDefaultSecondary,
                placeholderColorFocused: .textDefaultSecondary,
                placeholderColorReadOnly: .textDefaultSecondary,
                requiredIndicatorColor: .surfaceOnDarkNegative,
                startContentColor: .textDefaultPrimary,
                textAfterColor: .textDefaultSecondary,
                textBeforeColor: .textDefaultSecondary,
                textColor: .textDefaultPrimary,
                textColorFocused: .textDefaultPrimary,
                textColorReadOnly: .textDefaultPrimary,
                textTypography: TextAreaTypography.text,
                titleColor: .textDefaultPrimary,
                titleTypography: TextAreaTypography.title
            )
        )
    }
}
