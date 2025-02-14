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
        return lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
