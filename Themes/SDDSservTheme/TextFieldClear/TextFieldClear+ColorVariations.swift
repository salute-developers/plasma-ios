import Foundation
import SDDSComponents
import SDDSThemeCore

public extension ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
    var `default`: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: TextFieldClear.default.appearance)
        )
    }
    var error: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: TextFieldClear.error.appearance)
        )
    }
    var success: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: TextFieldClear.success.appearance)
        )
    }
    var warning: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: TextFieldClear.warning.appearance)
        )
    }
}

public extension TextFieldClear {
    static var `default`: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        .init(
            name: "",
            appearance: .init(
                captionColor: .textDefaultSecondary,
                captionColorFocused: .textDefaultAccent,
                captionColorReadOnly: .textDefaultSecondary,
                cursorColor: .textDefaultAccent,
                disabledAlpha: 0.4,
                endContentColor: .textDefaultSecondary,
                endContentColorReadonly: .textDefaultSecondary.withOpacity(0.4),
                lineColor: .surfaceDefaultTransparentTertiary,
                lineColorFocused: .surfaceDefaultAccent,
                optionalTitleColor: .textDefaultTertiary,
                placeholderColor: .textDefaultSecondary,
                placeholderColorFocused: .textDefaultTertiary,
                placeholderColorReadOnly: .textDefaultSecondary,
                requiredIndicatorColor: .surfaceDefaultNegative,
                startContentColor: .textDefaultSecondary,
                textAfterColor: .textDefaultTertiary,
                textBeforeColor: .textDefaultTertiary,
                textColor: .textDefaultPrimary,
                textColorFocused: .textDefaultPrimary,
                textColorReadOnly: .textDefaultPrimary,
                titleColor: .textDefaultPrimary
            )
        )
    }
    static var error: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        .init(
            name: "",
            appearance: .init(
                captionColor: .textDefaultNegative,
                captionColorFocused: .textDefaultAccent,
                captionColorReadOnly: .textDefaultNegative,
                cursorColor: .textDefaultAccent,
                disabledAlpha: 0.4,
                endContentColor: .textDefaultSecondary,
                endContentColorReadonly: .textDefaultSecondary.withOpacity(0.4),
                lineColor: .surfaceDefaultNegative,
                lineColorFocused: .surfaceDefaultAccent,
                optionalTitleColor: .textDefaultTertiary,
                placeholderColor: .textDefaultNegative,
                placeholderColorFocused: .textDefaultTertiary,
                placeholderColorReadOnly: .textDefaultNegative,
                requiredIndicatorColor: .surfaceDefaultNegative,
                startContentColor: .textDefaultNegative,
                textAfterColor: .textDefaultTertiary,
                textBeforeColor: .textDefaultTertiary,
                textColor: .textDefaultNegative,
                textColorFocused: .textDefaultNegative,
                textColorReadOnly: .textDefaultNegative,
                titleColor: .textDefaultNegative
            )
        )
    }
    static var success: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        .init(
            name: "",
            appearance: .init(
                captionColor: .textDefaultPositive,
                captionColorFocused: .textDefaultAccent,
                captionColorReadOnly: .textDefaultPositive,
                cursorColor: .textDefaultAccent,
                disabledAlpha: 0.4,
                endContentColor: .textDefaultSecondary,
                endContentColorReadonly: .textDefaultSecondary.withOpacity(0.4),
                lineColor: .surfaceDefaultPositive,
                lineColorFocused: .surfaceDefaultAccent,
                optionalTitleColor: .textDefaultTertiary,
                placeholderColor: .textDefaultPositive,
                placeholderColorFocused: .textDefaultTertiary,
                placeholderColorReadOnly: .textDefaultPositive,
                requiredIndicatorColor: .surfaceDefaultNegative,
                startContentColor: .textDefaultPositive,
                textAfterColor: .textDefaultTertiary,
                textBeforeColor: .textDefaultTertiary,
                textColor: .textDefaultPositive,
                textColorFocused: .textDefaultPositive,
                textColorReadOnly: .textDefaultPositive,
                titleColor: .textDefaultPositive
            )
        )
    }
    static var warning: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        .init(
            name: "",
            appearance: .init(
                captionColor: .textDefaultWarning,
                captionColorFocused: .textDefaultAccent,
                captionColorReadOnly: .textDefaultWarning,
                cursorColor: .textDefaultAccent,
                disabledAlpha: 0.4,
                endContentColor: .textDefaultSecondary,
                endContentColorReadonly: .textDefaultSecondary.withOpacity(0.4),
                lineColor: .surfaceDefaultWarning,
                lineColorFocused: .surfaceDefaultAccent,
                optionalTitleColor: .textDefaultTertiary,
                placeholderColor: .textDefaultWarning,
                placeholderColorFocused: .textDefaultTertiary,
                placeholderColorReadOnly: .textDefaultWarning,
                requiredIndicatorColor: .surfaceDefaultNegative,
                startContentColor: .textDefaultWarning,
                textAfterColor: .textDefaultTertiary,
                textBeforeColor: .textDefaultTertiary,
                textColor: .textDefaultWarning,
                textColorFocused: .textDefaultWarning,
                textColorReadOnly: .textDefaultWarning,
                titleColor: .textDefaultWarning
            )
        )
    }
}
