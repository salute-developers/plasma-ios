import Foundation
import SwiftUI
import SDDSThemeCore

public struct TextAreaAppearance {
    public var id = UUID()
    public var size: TextAreaSizeConfiguration
    public var chipAppearance: ChipAppearance
    public var chipGroupAppearance: ChipGroupAppearance
    public var labelPlacement: TextAreaLabelPlacement
    public var requiredPlacement: TextAreaRequiredPlacement
    public var backgroundColor: ColorToken
    public var backgroundColorFocused: ColorToken
    public var backgroundColorReadOnly: ColorToken?
    public var borderColor: ColorToken
    public var captionColor: ColorToken
    public var captionColorFocused: ColorToken
    public var captionColorReadOnly: ColorToken?
    public var captionTypography: TypographyConfiguration
    public var counterColor: ColorToken
    public var counterColorReadOnly: ColorToken
    public var counterTypography: TypographyConfiguration
    public var cursorColor: ColorToken
    public var disabledAlpha: CGFloat
    public var endContentColor: ColorToken
    public var endContentColorReadOnly: ColorToken?
    public var endContentColorFocused: ColorToken
    public var innerTitleTextAlignment: TextAlignment
    public var innerTitleTypography: TypographyConfiguration
    public var inputTextAlignment: TextAlignment
    public var lineColor: ColorToken
    public var lineColorFocused: ColorToken
    public var lineColorReadOnly: ColorToken
    public var optionalTitleColor: ColorToken
    public var placeholderColor: ColorToken
    public var placeholderColorFocused: ColorToken
    public var placeholderColorReadOnly: ColorToken?
    public var requiredIndicatorColor: ColorToken
    public var startContentColor: ColorToken
    public var startContentColorReadOnly: ColorToken
    public var textColor: ColorToken
    public var textColorFocused: ColorToken
    public var textColorReadOnly: ColorToken?
    public var textTypography: TypographyConfiguration
    public var titleColor: ColorToken
    public var titleTextAlignment: TextAlignment
    public var titleTypography: TypographyConfiguration

    public init(
        size: TextAreaSizeConfiguration = ZeroTextAreaSize(),
        chipAppearance: ChipAppearance = ChipAppearance(),
        chipGroupAppearance: ChipGroupAppearance = ChipGroupAppearance(),
        labelPlacement: TextAreaLabelPlacement = .none,
        requiredPlacement: TextAreaRequiredPlacement = .none,
        backgroundColor: ColorToken = .clearColor,
        backgroundColorFocused: ColorToken = .clearColor,
        backgroundColorReadOnly: ColorToken? = nil,
        borderColor: ColorToken = .clearColor,
        captionColor: ColorToken = .clearColor,
        captionColorFocused: ColorToken = .clearColor,
        captionColorReadOnly: ColorToken? = nil,
        counterColor: ColorToken = .clearColor,
        counterColorReadOnly: ColorToken = .clearColor,
        cursorColor: ColorToken = .clearColor,
        disabledAlpha: CGFloat = 0,
        endContentColor: ColorToken = .clearColor,
        endContentColorReadOnly: ColorToken? = nil,
        endContentColorFocused: ColorToken = .clearColor,
        innerTitleTextAlignment: TextAlignment = .leading,
        inputTextAlignment: TextAlignment = .leading,
        lineColor: ColorToken = .clearColor,
        lineColorFocused: ColorToken = .clearColor,
        lineColorReadonly: ColorToken = .clearColor,
        optionalTitleColor: ColorToken = .clearColor,
        placeholderColor: ColorToken = .clearColor,
        placeholderColorFocused: ColorToken = .clearColor,
        placeholderColorReadOnly: ColorToken? = nil,
        requiredIndicatorColor: ColorToken = .clearColor,
        startContentColor: ColorToken = .clearColor,
        startContentColorReadOnly: ColorToken = .clearColor,
        textColor: ColorToken = .clearColor,
        textColorFocused: ColorToken = .clearColor,
        textColorReadOnly: ColorToken? = nil,
        titleColor: ColorToken = .clearColor,
        titleTextAlignment: TextAlignment = .leading,
        captionTypography: TypographyConfiguration = .default,
        counterTypography: TypographyConfiguration = .default,
        innerTitleTypography: TypographyConfiguration = .default,
        textTypography: TypographyConfiguration = .default,
        titleTypography: TypographyConfiguration = .default
    ) {
        self.size = size
        self.chipAppearance = chipAppearance
        self.chipGroupAppearance = chipGroupAppearance
        self.labelPlacement = labelPlacement
        self.requiredPlacement = requiredPlacement
        self.backgroundColor = backgroundColor
        self.backgroundColorReadOnly = backgroundColorReadOnly
        self.borderColor = borderColor
        self.captionColor = captionColor
        self.captionColorFocused = captionColorFocused
        self.captionColorReadOnly = captionColorReadOnly
        self.captionTypography = captionTypography
        self.counterColor = counterColor
        self.counterColorReadOnly = counterColorReadOnly
        self.counterTypography = counterTypography
        self.cursorColor = cursorColor
        self.disabledAlpha = disabledAlpha
        self.endContentColor = endContentColor
        self.endContentColorReadOnly = endContentColorReadOnly
        self.endContentColorFocused = endContentColorFocused
        self.backgroundColorFocused = backgroundColorFocused
        self.innerTitleTextAlignment = innerTitleTextAlignment
        self.innerTitleTypography = innerTitleTypography
        self.inputTextAlignment = inputTextAlignment
        self.lineColor = lineColor
        self.lineColorFocused = lineColorFocused
        self.lineColorReadOnly = lineColorReadonly
        self.optionalTitleColor = optionalTitleColor
        self.placeholderColor = placeholderColor
        self.placeholderColorFocused = placeholderColorFocused
        self.placeholderColorReadOnly = placeholderColorReadOnly
        self.requiredIndicatorColor = requiredIndicatorColor
        self.startContentColor = startContentColor
        self.startContentColorReadOnly = startContentColorReadOnly
        self.textColor = textColor
        self.textColorFocused = textColorFocused
        self.textColorReadOnly = textColorReadOnly
        self.textTypography = textTypography
        self.titleColor = titleColor
        self.titleTextAlignment = titleTextAlignment
        self.titleTypography = titleTypography
    }
}

extension TextAreaAppearance: Hashable {
    public static func == (lhs: TextAreaAppearance, rhs: TextAreaAppearance) -> Bool {
        return lhs.id == rhs.id &&
            lhs.labelPlacement == rhs.labelPlacement &&
            lhs.requiredPlacement == rhs.requiredPlacement &&
            lhs.backgroundColor == rhs.backgroundColor &&
            lhs.backgroundColorFocused == rhs.backgroundColorFocused &&
            lhs.backgroundColorReadOnly == rhs.backgroundColorReadOnly &&
            lhs.borderColor == rhs.borderColor &&
            lhs.captionColor == rhs.captionColor &&
            lhs.captionColorFocused == rhs.captionColorFocused &&
            lhs.captionColorReadOnly == rhs.captionColorReadOnly &&
            lhs.counterColor == rhs.counterColor &&
            lhs.counterColorReadOnly == rhs.counterColorReadOnly &&
            lhs.cursorColor == rhs.cursorColor &&
            lhs.disabledAlpha == rhs.disabledAlpha &&
            lhs.endContentColor == rhs.endContentColor &&
            lhs.endContentColorReadOnly == rhs.endContentColorReadOnly &&
            lhs.endContentColorFocused == rhs.endContentColorFocused &&
            lhs.innerTitleTextAlignment == rhs.innerTitleTextAlignment &&
            lhs.inputTextAlignment == rhs.inputTextAlignment &&
            lhs.lineColor == rhs.lineColor &&
            lhs.lineColorFocused == rhs.lineColorFocused &&
            lhs.lineColorReadOnly == rhs.lineColorReadOnly &&
            lhs.optionalTitleColor == rhs.optionalTitleColor &&
            lhs.placeholderColor == rhs.placeholderColor &&
            lhs.placeholderColorFocused == rhs.placeholderColorFocused &&
            lhs.placeholderColorReadOnly == rhs.placeholderColorReadOnly &&
            lhs.requiredIndicatorColor == rhs.requiredIndicatorColor &&
            lhs.startContentColor == rhs.startContentColor &&
            lhs.startContentColorReadOnly == rhs.startContentColorReadOnly &&
            lhs.textColor == rhs.textColor &&
            lhs.textColorFocused == rhs.textColorFocused &&
            lhs.textColorReadOnly == rhs.textColorReadOnly &&
            lhs.titleColor == rhs.titleColor &&
            lhs.titleTextAlignment == rhs.titleTextAlignment
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(labelPlacement)
        hasher.combine(requiredPlacement)
        hasher.combine(backgroundColor)
        hasher.combine(backgroundColorFocused)
        hasher.combine(backgroundColorReadOnly)
        hasher.combine(borderColor)
        hasher.combine(captionColor)
        hasher.combine(captionColorFocused)
        hasher.combine(captionColorReadOnly)
        hasher.combine(counterColor)
        hasher.combine(counterColorReadOnly)
        hasher.combine(cursorColor)
        hasher.combine(disabledAlpha)
        hasher.combine(endContentColor)
        hasher.combine(endContentColorReadOnly)
        hasher.combine(endContentColorFocused)
        hasher.combine(innerTitleTextAlignment)
        hasher.combine(inputTextAlignment)
        hasher.combine(lineColor)
        hasher.combine(lineColorFocused)
        hasher.combine(lineColorReadOnly)
        hasher.combine(optionalTitleColor)
        hasher.combine(placeholderColor)
        hasher.combine(placeholderColorFocused)
        hasher.combine(placeholderColorReadOnly)
        hasher.combine(requiredIndicatorColor)
        hasher.combine(startContentColor)
        hasher.combine(startContentColorReadOnly)
        hasher.combine(textColor)
        hasher.combine(textColorFocused)
        hasher.combine(textColorReadOnly)
        hasher.combine(titleColor)
        hasher.combine(titleTextAlignment)
    }
}
