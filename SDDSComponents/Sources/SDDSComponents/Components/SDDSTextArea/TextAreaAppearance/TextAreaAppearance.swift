import Foundation
import SwiftUI
import SDDSThemeCore

public struct TextAreaAppearance {
    public let id = UUID()
    public let size: TextAreaSizeConfiguration
    public let backgroundColor: ColorToken
    public let backgroundColorReadOnly: ColorToken
    public let borderColor: ColorToken
    public let captionColor: ColorToken
    public let captionColorFocused: ColorToken
    public let captionColorReadOnly: ColorToken
    public let captionTypography: TypographyConfiguration
    public let counterColor: ColorToken
    public let counterColorReadOnly: ColorToken
    public let counterTypography: TypographyConfiguration
    public let cursorColor: ColorToken
    public let disabledAlpha: CGFloat
    public let endContentColor: ColorToken
    public let backgroundColorFocused: ColorToken
    public let innerTitleTextAlignment: TextAlignment
    public let innerTitleTypography: TypographyConfiguration
    public let inputTextAlignment: TextAlignment
    public let lineColor: ColorToken
    public let lineColorFocused: ColorToken
    public let optionalTitleColor: ColorToken
    public let placeholderColor: ColorToken
    public let placeholderColorFocused: ColorToken
    public let placeholderColorReadOnly: ColorToken
    public let requiredIndicatorColor: ColorToken
    public let startContentColor: ColorToken
    public let textAfterColor: ColorToken
    public let textBeforeColor: ColorToken
    public let textColor: ColorToken
    public let textColorFocused: ColorToken
    public let textColorReadOnly: ColorToken
    public let textTypography: TypographyConfiguration
    public let titleColor: ColorToken
    public let titleTextAlignment: TextAlignment
    public let titleTypography: TypographyConfiguration

    public init(
        size: TextAreaSizeConfiguration = ZeroTextAreaSize(),
        backgroundColor: ColorToken = .clearColor,
        backgroundColorReadOnly: ColorToken = .clearColor,
        borderColor: ColorToken = .clearColor,
        captionColor: ColorToken = .clearColor,
        captionColorFocused: ColorToken = .clearColor,
        captionColorReadOnly: ColorToken = .clearColor,
        captionTypography: TypographyConfiguration = .default,
        counterColor: ColorToken = .clearColor,
        counterColorReadOnly: ColorToken = .clearColor,
        counterTypography: TypographyConfiguration = .default,
        cursorColor: ColorToken = .clearColor,
        disabledAlpha: CGFloat = 0,
        endContentColor: ColorToken = .clearColor,
        backgroundColorFocused: ColorToken = .clearColor,
        innerTitleTextAlignment: TextAlignment = .leading,
        innerTitleTypography: TypographyConfiguration = .default,
        inputTextAlignment: TextAlignment = .leading,
        lineColor: ColorToken = .clearColor,
        lineColorFocused: ColorToken = .clearColor,
        optionalTitleColor: ColorToken = .clearColor,
        placeholderColor: ColorToken = .clearColor,
        placeholderColorFocused: ColorToken = .clearColor,
        placeholderColorReadOnly: ColorToken = .clearColor,
        requiredIndicatorColor: ColorToken = .clearColor,
        startContentColor: ColorToken = .clearColor,
        textAfterColor: ColorToken = .clearColor,
        textBeforeColor: ColorToken = .clearColor,
        textColor: ColorToken = .clearColor,
        textColorFocused: ColorToken = .clearColor,
        textColorReadOnly: ColorToken = .clearColor,
        textTypography: TypographyConfiguration = .default,
        titleColor: ColorToken = .clearColor,
        titleTextAlignment: TextAlignment = .leading,
        titleTypography: TypographyConfiguration = .default
    ) {
        self.size = size
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
        self.backgroundColorFocused = backgroundColorFocused
        self.innerTitleTextAlignment = innerTitleTextAlignment
        self.innerTitleTypography = innerTitleTypography
        self.inputTextAlignment = inputTextAlignment
        self.lineColor = lineColor
        self.lineColorFocused = lineColorFocused
        self.optionalTitleColor = optionalTitleColor
        self.placeholderColor = placeholderColor
        self.placeholderColorFocused = placeholderColorFocused
        self.placeholderColorReadOnly = placeholderColorReadOnly
        self.requiredIndicatorColor = requiredIndicatorColor
        self.startContentColor = startContentColor
        self.textAfterColor = textAfterColor
        self.textBeforeColor = textBeforeColor
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
