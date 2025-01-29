import Foundation
import SDDSComponents
import SDDSServTheme
import SDDSThemeCore

public extension ComponentAppearanceVariation<SDDSComponents.TextField, TextFieldAppearance> {
    var secondary: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSComponents.TextField.default.appearance)
        )
    }
}

public extension SDDSComponents.TextField {
    static var `default`: ComponentAppearanceVariation<SDDSComponents.TextField, TextFieldAppearance> {
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
                endContentColorReadonly: textDefaultSecondary.withOpacity(0.3),
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
