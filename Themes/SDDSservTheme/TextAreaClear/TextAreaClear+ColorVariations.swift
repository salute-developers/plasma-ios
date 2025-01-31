import Foundation
import SDDSComponents
import SDDSThemeCore

public extension ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
    var `default`: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: TextAreaClear.default.appearance)
        )
    }
    var error: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: TextAreaClear.error.appearance)
        )
    }
    var success: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: TextAreaClear.success.appearance)
        )
    }
    var warning: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: TextAreaClear.warning.appearance)
        )
    }
}

public extension TextAreaClear {
    static var `default`: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        .init(
            name: "",
            appearance: .init(
                captionColor: .textDefaultSecondary,
                captionColorFocused: .textDefaultAccent,
                captionColorReadOnly: .textDefaultSecondary,
                counterColor: .textDefaultSecondary,
                counterColorReadOnly: .textDefaultSecondary,
                cursorColor: .textDefaultAccent,
                disabledAlpha: 0.4,
                endContentColor: .textDefaultSecondary,
                lineColor: .surfaceDefaultTransparentTertiary,
                lineColorFocused: .surfaceDefaultAccent,
                optionalTitleColor: .textDefaultTertiary,
                placeholderColor: .textDefaultSecondary,
                placeholderColorFocused: .textDefaultTertiary,
                placeholderColorReadOnly: .textDefaultSecondary,
                requiredIndicatorColor: .surfaceDefaultNegative,
                startContentColor: .textDefaultSecondary,
                textColor: .textDefaultPrimary,
                textColorFocused: .textDefaultPrimary,
                textColorReadOnly: .textDefaultPrimary,
                titleColor: .textDefaultPrimary
            )
        )
    }
    static var error: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        .init(
            name: "",
            appearance: .init(
                captionColor: .textDefaultNegative,
                captionColorFocused: .textDefaultAccent,
                captionColorReadOnly: .textDefaultNegative,
                counterColor: .textDefaultSecondary,
                counterColorReadOnly: .textDefaultSecondary,
                cursorColor: .textDefaultAccent,
                disabledAlpha: 0.4,
                endContentColor: .textDefaultSecondary,
                lineColor: .surfaceDefaultNegative,
                lineColorFocused: .surfaceDefaultAccent,
                optionalTitleColor: .textDefaultTertiary,
                placeholderColor: .textDefaultNegative,
                placeholderColorFocused: .textDefaultTertiary,
                placeholderColorReadOnly: .textDefaultNegative,
                requiredIndicatorColor: .surfaceDefaultNegative,
                startContentColor: .textDefaultNegative,
                textColor: .textDefaultNegative,
                textColorFocused: .textDefaultNegative,
                textColorReadOnly: .textDefaultNegative,
                titleColor: .textDefaultNegative
            )
        )
    }
    static var success: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        .init(
            name: "",
            appearance: .init(
                captionColor: .textDefaultPositive,
                captionColorFocused: .textDefaultAccent,
                captionColorReadOnly: .textDefaultPositive,
                counterColor: .textDefaultSecondary,
                counterColorReadOnly: .textDefaultSecondary,
                cursorColor: .textDefaultAccent,
                disabledAlpha: 0.4,
                endContentColor: .textDefaultSecondary,
                lineColor: .surfaceDefaultPositive,
                lineColorFocused: .surfaceDefaultAccent,
                optionalTitleColor: .textDefaultTertiary,
                placeholderColor: .textDefaultPositive,
                placeholderColorFocused: .textDefaultTertiary,
                placeholderColorReadOnly: .textDefaultPositive,
                requiredIndicatorColor: .surfaceDefaultNegative,
                startContentColor: .textDefaultPositive,
                textColor: .textDefaultPositive,
                textColorFocused: .textDefaultPositive,
                textColorReadOnly: .textDefaultPositive,
                titleColor: .textDefaultPositive
            )
        )
    }
    static var warning: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        .init(
            name: "",
            appearance: .init(
                captionColor: .textDefaultWarning,
                captionColorFocused: .textDefaultAccent,
                captionColorReadOnly: .textDefaultWarning,
                counterColor: .textDefaultSecondary,
                counterColorReadOnly: .textDefaultSecondary,
                cursorColor: .textDefaultAccent,
                disabledAlpha: 0.4,
                endContentColor: .textDefaultSecondary,
                lineColor: .surfaceDefaultWarning,
                lineColorFocused: .surfaceDefaultAccent,
                optionalTitleColor: .textDefaultTertiary,
                placeholderColor: .textDefaultWarning,
                placeholderColorFocused: .textDefaultTertiary,
                placeholderColorReadOnly: .textDefaultWarning,
                requiredIndicatorColor: .surfaceDefaultNegative,
                startContentColor: .textDefaultWarning,
                textColor: .textDefaultWarning,
                textColorFocused: .textDefaultWarning,
                textColorReadOnly: .textDefaultWarning,
                titleColor: .textDefaultWarning
            )
        )
    }
    
    static var all: [ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance>] {
        [
            TextAreaClear.default,
            TextAreaClear.success,
            TextAreaClear.warning,
            TextAreaClear.error
        ]
    }
}
