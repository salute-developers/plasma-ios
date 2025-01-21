import Foundation
import SDDSComponents
import SDDSServTheme
import SDDSThemeCore

public extension ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
    var secondary: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: TextFieldClear.default.appearance)
        )
    }
}

public extension TextFieldClear {
    static var `default`: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        .init(
            name: "default",
            appearance: .init(
                backgroundColor: .surfaceDefaultTransparentPrimary,
                backgroundColorFocused: .surfaceDefaultTransparentSecondary,
                backgroundColorReadOnly: .surfaceDefaultTransparentPrimary,
                borderColor: .clearColor,
                captionColor: .textDefaultSecondary,
                captionColorFocused: .textDefaultAccent,
                captionColorReadOnly: .textDefaultSecondary,
                captionTypography: TextFieldTypography.caption,
                cursorColor: .textDefaultAccent,
                disabledAlpha: 0.4,
                endContentColor: .textDefaultSecondary,
                innerTitleTypography: TextFieldTypography.innerTitle,
                lineColor: .surfaceDefaultTransparentTertiary,
                lineColorFocused: .textDefaultAccent,
                optionalTitleColor: .textDefaultTertiary,
                placeholderColor: .textDefaultSecondary,
                placeholderColorFocused: .textDefaultSecondaryActive,
                placeholderColorReadOnly: .textDefaultSecondary,
                requiredIndicatorColor: .surfaceOnDarkNegative,
                startContentColor: .textDefaultSecondary,
                textAfterColor: .textDefaultTertiary,
                textAfterTypography: TextFieldTypography.text,
                textBeforeColor: .textDefaultTertiary,
                textBeforeTypography: TextFieldTypography.text,
                textColor: .textDefaultPrimary,
                textColorFocused: .textDefaultPrimaryActive,
                textColorReadOnly: .textDefaultPrimary,
                textTypography: TextFieldTypography.text,
                titleColor: .textDefaultPrimary,
                titleTypography: TextFieldTypography.title
            )
        )
    }
}
