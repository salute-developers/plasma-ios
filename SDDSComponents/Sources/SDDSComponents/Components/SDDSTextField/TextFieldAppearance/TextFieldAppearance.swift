import Foundation
import SwiftUI
import SDDSThemeCore

public struct TextFieldAppearance {
    let id = UUID()
    public let size: TextFieldSizeConfiguration
    public let chipGroupAppearance: ChipGroupAppearance
    public let chipAppearance: ChipAppearance
    public let backgroundColor: ColorToken
    public let backgroundColorFocused: ColorToken
    public let backgroundColorReadOnly: ColorToken
    public let borderColor: ColorToken
    public let captionColor: ColorToken
    public let captionColorFocused: ColorToken
    public let captionColorReadOnly: ColorToken
    public let captionTextAlignment: TextAlignment
    public let captionTypography: TypographyConfiguration
    public let cursorColor: ColorToken
    public let disabledAlpha: CGFloat
    public let endContentColor: ColorToken
    public let inputTextAlignment: TextAlignment
    public let innerTitleTextAlignment: TextAlignment
    public let innerTitleTypography: TypographyConfiguration
    public let lineColor: ColorToken
    public let lineColorFocused: ColorToken
    public let optionalTitleColor: ColorToken
    public let placeholderColor: ColorToken
    public let placeholderColorFocused: ColorToken
    public let placeholderColorReadOnly: ColorToken
    public let requiredIndicatorColor: ColorToken
    public let startContentColor: ColorToken
    public let textAfterColor: ColorToken
    public let textAfterTypography: TypographyConfiguration
    public let textBeforeColor: ColorToken
    public let textBeforeTypography: TypographyConfiguration
    public let textColor: ColorToken
    public let textColorFocused: ColorToken
    public let textColorReadOnly: ColorToken
    public let textTypography: TypographyConfiguration
    public let titleColor: ColorToken
    public let titleTextAlignment: TextAlignment
    public let titleTypography: TypographyConfiguration

    public init(
        size: TextFieldSizeConfiguration = ZeroTextFieldSize(),
        chipGroupAppearance: ChipGroupAppearance = ChipGroupAppearance(),
        chipAppearance: ChipAppearance = ChipAppearance(),
        backgroundColor: ColorToken = .clearColor,
        backgroundColorFocused: ColorToken = .clearColor,
        backgroundColorReadOnly: ColorToken = .clearColor,
        borderColor: ColorToken = .clearColor,
        captionColor: ColorToken = .clearColor,
        captionColorFocused: ColorToken = .clearColor,
        captionColorReadOnly: ColorToken = .clearColor,
        captionTextAlignment: TextAlignment = .leading,
        captionTypography: TypographyConfiguration = .default,
        cursorColor: ColorToken = .clearColor,
        disabledAlpha: CGFloat = 0,
        endContentColor: ColorToken = .clearColor,
        inputTextAlignment: TextAlignment = .leading,
        innerTitleTextAlignment: TextAlignment = .leading,
        innerTitleTypography: TypographyConfiguration = .default,
        lineColor: ColorToken = .clearColor,
        lineColorFocused: ColorToken = .clearColor,
        optionalTitleColor: ColorToken = .clearColor,
        placeholderColor: ColorToken = .clearColor,
        placeholderColorFocused: ColorToken = .clearColor,
        placeholderColorReadOnly: ColorToken = .clearColor,
        requiredIndicatorColor: ColorToken = .clearColor,
        startContentColor: ColorToken = .clearColor,
        textAfterColor: ColorToken = .clearColor,
        textAfterTypography: TypographyConfiguration = .default,
        textBeforeColor: ColorToken = .clearColor,
        textBeforeTypography: TypographyConfiguration = .default,
        textColor: ColorToken = .clearColor,
        textColorFocused: ColorToken = .clearColor,
        textColorReadOnly: ColorToken = .clearColor,
        textTypography: TypographyConfiguration = .default,
        titleColor: ColorToken = .clearColor,
        titleTextAlignment: TextAlignment = .leading,
        titleTypography: TypographyConfiguration = .default
    ) {
        self.size = size
        self.chipGroupAppearance = chipGroupAppearance
        self.chipAppearance = chipAppearance
        self.backgroundColor = backgroundColor
        self.backgroundColorFocused = backgroundColorFocused
        self.backgroundColorReadOnly = backgroundColorReadOnly
        self.borderColor = borderColor
        self.captionColor = captionColor
        self.captionColorFocused = captionColorFocused
        self.captionColorReadOnly = captionColorReadOnly
        self.captionTextAlignment = captionTextAlignment
        self.captionTypography = captionTypography
        self.cursorColor = cursorColor
        self.disabledAlpha = disabledAlpha
        self.endContentColor = endContentColor
        self.inputTextAlignment = inputTextAlignment
        self.innerTitleTextAlignment = innerTitleTextAlignment
        self.innerTitleTypography = innerTitleTypography
        self.lineColor = lineColor
        self.lineColorFocused = lineColorFocused
        self.optionalTitleColor = optionalTitleColor
        self.placeholderColor = placeholderColor
        self.placeholderColorFocused = placeholderColorFocused
        self.placeholderColorReadOnly = placeholderColorReadOnly
        self.requiredIndicatorColor = requiredIndicatorColor
        self.startContentColor = startContentColor
        self.textAfterColor = textAfterColor
        self.textAfterTypography = textAfterTypography
        self.textBeforeColor = textBeforeColor
        self.textBeforeTypography = textBeforeTypography
        self.textColor = textColor
        self.textColorFocused = textColorFocused
        self.textColorReadOnly = textColorReadOnly
        self.textTypography = textTypography
        self.titleColor = titleColor
        self.titleTextAlignment = titleTextAlignment
        self.titleTypography = titleTypography
    }
}

extension TextFieldAppearance: Hashable {
    public static func == (lhs: TextFieldAppearance, rhs: TextFieldAppearance) -> Bool {
        return lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
