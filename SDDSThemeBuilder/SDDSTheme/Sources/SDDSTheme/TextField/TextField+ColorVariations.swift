import Foundation
import SDDSComponents
import SDDSServTheme
import SDDSThemeCore

public extension ComponentAppearanceVariation<SDDSComponents.TextField, TextFieldAppearance> {
    var `default`: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSComponents.TextField.default.appearance)
        )
    }
    var error: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSComponents.TextField.error.appearance)
        )
    }
    var success: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSComponents.TextField.success.appearance)
        )
    }
    var warning: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSComponents.TextField.warning.appearance)
        )
    }
}

public extension SDDSComponents.TextField {
    static var `default`: ComponentAppearanceVariation<SDDSComponents.TextField, TextFieldAppearance> {
        .init(
            name: "",
            appearance: .init(
                backgroundColor: surfaceDefaultTransparentPrimary,
                backgroundColorFocused: surfaceDefaultTransparentSecondary,
                backgroundColorReadOnly: surfaceDefaultTransparentPrimary,
                captionColor: textDefaultSecondary,
                captionColorFocused: textDefaultAccent,
                captionColorReadOnly: textDefaultSecondary,
                cursorColor: textDefaultAccent,
                disabledAlpha: 0.4,
                endContentColor: textDefaultSecondary,
                endContentColorReadonly: textDefaultSecondary.withOpacity(0.4),
                optionalTitleColor: textDefaultTertiary,
                placeholderColor: textDefaultSecondary,
                placeholderColorFocused: textDefaultTertiary,
                placeholderColorReadOnly: textDefaultSecondary,
                requiredIndicatorColor: surfaceDefaultNegative,
                startContentColor: textDefaultSecondary,
                textAfterColor: textDefaultTertiary,
                textBeforeColor: textDefaultTertiary,
                textColor: textDefaultPrimary,
                textColorFocused: textDefaultPrimary,
                textColorReadOnly: textDefaultPrimary,
                titleColor: textDefaultPrimary
            )
        )
    }
    static var error: ComponentAppearanceVariation<SDDSComponents.TextField, TextFieldAppearance> {
        .init(
            name: "",
            appearance: .init(
                backgroundColor: surfaceDefaultTransparentNegative,
                backgroundColorFocused: surfaceDefaultTransparentSecondary,
                backgroundColorReadOnly: surfaceDefaultTransparentNegative,
                captionColor: textDefaultNegative,
                captionColorFocused: textDefaultAccent,
                captionColorReadOnly: textDefaultNegative,
                cursorColor: textDefaultAccent,
                disabledAlpha: 0.4,
                endContentColor: textDefaultSecondary,
                endContentColorReadonly: textDefaultSecondary.withOpacity(0.4),
                optionalTitleColor: textDefaultTertiary,
                placeholderColor: textDefaultSecondary,
                placeholderColorFocused: textDefaultTertiary,
                placeholderColorReadOnly: textDefaultSecondary,
                requiredIndicatorColor: surfaceDefaultNegative,
                startContentColor: textDefaultSecondary,
                textAfterColor: textDefaultTertiary,
                textBeforeColor: textDefaultTertiary,
                textColor: textDefaultPrimary,
                textColorFocused: textDefaultPrimary,
                textColorReadOnly: textDefaultPrimary,
                titleColor: textDefaultPrimary
            )
        )
    }
    static var success: ComponentAppearanceVariation<SDDSComponents.TextField, TextFieldAppearance> {
        .init(
            name: "",
            appearance: .init(
                backgroundColor: surfaceDefaultTransparentPositive,
                backgroundColorFocused: surfaceDefaultTransparentSecondary,
                backgroundColorReadOnly: surfaceDefaultTransparentPositive,
                captionColor: textDefaultPositive,
                captionColorFocused: textDefaultAccent,
                captionColorReadOnly: textDefaultPositive,
                cursorColor: textDefaultAccent,
                disabledAlpha: 0.4,
                endContentColor: textDefaultSecondary,
                endContentColorReadonly: textDefaultSecondary.withOpacity(0.4),
                optionalTitleColor: textDefaultTertiary,
                placeholderColor: textDefaultSecondary,
                placeholderColorFocused: textDefaultTertiary,
                placeholderColorReadOnly: textDefaultSecondary,
                requiredIndicatorColor: surfaceDefaultNegative,
                startContentColor: textDefaultSecondary,
                textAfterColor: textDefaultTertiary,
                textBeforeColor: textDefaultTertiary,
                textColor: textDefaultPrimary,
                textColorFocused: textDefaultPrimary,
                textColorReadOnly: textDefaultPrimary,
                titleColor: textDefaultPrimary
            )
        )
    }
    static var warning: ComponentAppearanceVariation<SDDSComponents.TextField, TextFieldAppearance> {
        .init(
            name: "",
            appearance: .init(
                backgroundColor: surfaceDefaultTransparentWarning,
                backgroundColorFocused: surfaceDefaultTransparentSecondary,
                backgroundColorReadOnly: surfaceDefaultTransparentWarning,
                captionColor: textDefaultWarning,
                captionColorFocused: textDefaultAccent,
                captionColorReadOnly: textDefaultWarning,
                cursorColor: textDefaultAccent,
                disabledAlpha: 0.4,
                endContentColor: textDefaultSecondary,
                endContentColorReadonly: textDefaultSecondary.withOpacity(0.4),
                optionalTitleColor: textDefaultTertiary,
                placeholderColor: textDefaultSecondary,
                placeholderColorFocused: textDefaultTertiary,
                placeholderColorReadOnly: textDefaultSecondary,
                requiredIndicatorColor: surfaceDefaultNegative,
                startContentColor: textDefaultSecondary,
                textAfterColor: textDefaultTertiary,
                textBeforeColor: textDefaultTertiary,
                textColor: textDefaultPrimary,
                textColorFocused: textDefaultPrimary,
                textColorReadOnly: textDefaultPrimary,
                titleColor: textDefaultPrimary
            )
        )
    }
}
