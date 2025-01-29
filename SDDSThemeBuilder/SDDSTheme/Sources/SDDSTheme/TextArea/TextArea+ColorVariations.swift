import Foundation
import SDDSComponents
import SDDSServTheme
import SDDSThemeCore

public extension ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
    var `default`: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: TextArea.default.appearance)
        )
    }
    var error: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: TextArea.error.appearance)
        )
    }
    var success: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: TextArea.success.appearance)
        )
    }
    var warning: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: TextArea.warning.appearance)
        )
    }
}

public extension TextFieldClear {
    static var `default`: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        .init(
            name: "",
            appearance: .init(
                backgroundColor: surfaceDefaultTransparentPrimary,
                backgroundColorFocused: surfaceDefaultTransparentSecondary,
                backgroundColorReadOnly: surfaceDefaultTransparentPrimary,
                captionColor: textDefaultSecondary,
                captionColorFocused: textDefaultAccent,
                captionColorReadOnly: textDefaultSecondary,
                counterColor: textDefaultSecondary,
                counterColorReadOnly: textDefaultSecondary,
                cursorColor: textDefaultAccent,
                disabledAlpha: 0.4,
                endContentColor: textDefaultSecondary,
                optionalTitleColor: textDefaultTertiary,
                placeholderColor: textDefaultSecondary,
                placeholderColorFocused: textDefaultTertiary,
                placeholderColorReadOnly: textDefaultSecondary,
                requiredIndicatorColor: surfaceDefaultNegative,
                startContentColor: textDefaultSecondary,
                textColor: textDefaultPrimary,
                textColorFocused: textDefaultPrimary,
                textColorReadOnly: textDefaultPrimary,
                titleColor: textDefaultPrimary
            )
        )
    }
    static var error: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        .init(
            name: "",
            appearance: .init(
                backgroundColor: surfaceDefaultTransparentNegative,
                backgroundColorFocused: surfaceDefaultTransparentSecondary,
                backgroundColorReadOnly: surfaceDefaultTransparentNegative,
                captionColor: textDefaultNegative,
                captionColorFocused: textDefaultAccent,
                captionColorReadOnly: textDefaultNegative,
                counterColor: textDefaultSecondary,
                counterColorReadOnly: textDefaultSecondary,
                cursorColor: textDefaultAccent,
                disabledAlpha: 0.4,
                endContentColor: textDefaultSecondary,
                optionalTitleColor: textDefaultTertiary,
                placeholderColor: textDefaultSecondary,
                placeholderColorFocused: textDefaultTertiary,
                placeholderColorReadOnly: textDefaultSecondary,
                requiredIndicatorColor: surfaceDefaultNegative,
                startContentColor: textDefaultSecondary,
                textColor: textDefaultPrimary,
                textColorFocused: textDefaultPrimary,
                textColorReadOnly: textDefaultPrimary,
                titleColor: textDefaultPrimary
            )
        )
    }
    static var success: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        .init(
            name: "",
            appearance: .init(
                backgroundColor: surfaceDefaultTransparentPositive,
                backgroundColorFocused: surfaceDefaultTransparentSecondary,
                backgroundColorReadOnly: surfaceDefaultTransparentPositive,
                captionColor: textDefaultPositive,
                captionColorFocused: textDefaultAccent,
                captionColorReadOnly: textDefaultPositive,
                counterColor: textDefaultSecondary,
                counterColorReadOnly: textDefaultSecondary,
                cursorColor: textDefaultAccent,
                disabledAlpha: 0.4,
                endContentColor: textDefaultSecondary,
                optionalTitleColor: textDefaultTertiary,
                placeholderColor: textDefaultSecondary,
                placeholderColorFocused: textDefaultTertiary,
                placeholderColorReadOnly: textDefaultSecondary,
                requiredIndicatorColor: surfaceDefaultNegative,
                startContentColor: textDefaultSecondary,
                textColor: textDefaultPrimary,
                textColorFocused: textDefaultPrimary,
                textColorReadOnly: textDefaultPrimary,
                titleColor: textDefaultPrimary
            )
        )
    }
    static var warning: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        .init(
            name: "",
            appearance: .init(
                backgroundColor: surfaceDefaultTransparentWarning,
                backgroundColorFocused: surfaceDefaultTransparentSecondary,
                backgroundColorReadOnly: surfaceDefaultTransparentWarning,
                captionColor: textDefaultWarning,
                captionColorFocused: textDefaultAccent,
                captionColorReadOnly: textDefaultWarning,
                counterColor: textDefaultSecondary,
                counterColorReadOnly: textDefaultSecondary,
                cursorColor: textDefaultAccent,
                disabledAlpha: 0.4,
                endContentColor: textDefaultSecondary,
                optionalTitleColor: textDefaultTertiary,
                placeholderColor: textDefaultSecondary,
                placeholderColorFocused: textDefaultTertiary,
                placeholderColorReadOnly: textDefaultSecondary,
                requiredIndicatorColor: surfaceDefaultNegative,
                startContentColor: textDefaultSecondary,
                textColor: textDefaultPrimary,
                textColorFocused: textDefaultPrimary,
                textColorReadOnly: textDefaultPrimary,
                titleColor: textDefaultPrimary
            )
        )
    }
}
