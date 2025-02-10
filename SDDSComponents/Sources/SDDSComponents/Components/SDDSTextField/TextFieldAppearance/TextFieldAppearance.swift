import Foundation
import SwiftUI
import SDDSThemeCore

public struct TextFieldAppearance {
    let id = UUID()
    public var size: TextFieldSizeConfiguration
    public var chipGroupAppearance: ChipGroupAppearance
    public var chipAppearance: ChipAppearance
    public var labelPlacement: TextFieldLabelPlacement
    public var requiredPlacement: TextFieldRequiredPlacement
    public var backgroundColor: ColorToken
    public var backgroundColorFocused: ColorToken
    public var backgroundColorReadOnly: ColorToken?
    public var borderColor: ColorToken
    public var captionColor: ColorToken
    public var captionColorFocused: ColorToken
    public var captionColorReadOnly: ColorToken
    public var captionTextAlignment: TextAlignment
    public var captionTypography: TypographyConfiguration
    public var cursorColor: ColorToken
    public var disabledAlpha: CGFloat
    public var endContentColor: ColorToken
    public var endContentColorReadOnly: ColorToken?
    public var endContentColorFocused: ColorToken
    public var inputTextAlignment: TextAlignment
    public var innerTitleTextAlignment: TextAlignment
    public var innerTitleTypography: TypographyConfiguration
    public var lineColor: ColorToken
    public var lineColorFocused: ColorToken
    public var lineColorReadOnly: ColorToken
    public var optionalTitleColor: ColorToken
    public var placeholderColor: ColorToken
    public var placeholderColorFocused: ColorToken
    public var placeholderColorReadOnly: ColorToken?
    public var requiredIndicatorColor: ColorToken
    public var startContentColor: ColorToken
    public var startContentColorFocused: ColorToken
    public var startContentColorReadOnly: ColorToken?
    public var textAfterColor: ColorToken
    public var textAfterTypography: TypographyConfiguration
    public var textBeforeColor: ColorToken
    public var textBeforeTypography: TypographyConfiguration
    public var textColor: ColorToken
    public var textColorFocused: ColorToken
    public var textColorReadOnly: ColorToken?
    public var textTypography: TypographyConfiguration
    public var titleColor: ColorToken
    public var titleTextAlignment: TextAlignment
    public var titleTypography: TypographyConfiguration

    public init(
        size: TextFieldSizeConfiguration = ZeroTextFieldSize(),
        chipGroupAppearance: ChipGroupAppearance = ChipGroupAppearance(),
        chipAppearance: ChipAppearance = ChipAppearance(),
        labelPlacement: TextFieldLabelPlacement = .none,
        requiredPlacement: TextFieldRequiredPlacement = .none,
        backgroundColor: ColorToken = .clearColor,
        backgroundColorFocused: ColorToken = .clearColor,
        backgroundColorReadOnly: ColorToken? = nil,
        borderColor: ColorToken = .clearColor,
        captionColor: ColorToken = .clearColor,
        captionColorFocused: ColorToken = .clearColor,
        captionColorReadOnly: ColorToken = .clearColor,
        captionTextAlignment: TextAlignment = .leading,
        cursorColor: ColorToken = .clearColor,
        disabledAlpha: CGFloat = 0,
        endContentColor: ColorToken = .clearColor,
        endContentColorReadOnly: ColorToken = .clearColor,
        endContentColorFocused: ColorToken = .clearColor,
        inputTextAlignment: TextAlignment = .leading,
        innerTitleTextAlignment: TextAlignment = .leading,
        lineColor: ColorToken = .clearColor,
        lineColorFocused: ColorToken = .clearColor,
        lineColorReadOnly: ColorToken = .clearColor,
        optionalTitleColor: ColorToken = .clearColor,
        placeholderColor: ColorToken = .clearColor,
        placeholderColorFocused: ColorToken = .clearColor,
        placeholderColorReadOnly: ColorToken? = nil,
        requiredIndicatorColor: ColorToken = .clearColor,
        startContentColor: ColorToken = .clearColor,
        startContentColorFocused: ColorToken = .clearColor,
        startContentColorReadOnly: ColorToken? = nil,
        textAfterColor: ColorToken = .clearColor,
        textBeforeColor: ColorToken = .clearColor,
        textColor: ColorToken = .clearColor,
        textColorFocused: ColorToken = .clearColor,
        textColorReadOnly: ColorToken? = nil,
        titleColor: ColorToken = .clearColor,
        titleTextAlignment: TextAlignment = .leading,
        captionTypography: TypographyConfiguration = .default,
        innerTitleTypography: TypographyConfiguration = .default,
        textTypography: TypographyConfiguration = .default,
        textAfterTypography: TypographyConfiguration = .default,
        textBeforeTypography: TypographyConfiguration = .default,
        titleTypography: TypographyConfiguration = .default
    ) {
        self.size = size
        self.chipGroupAppearance = chipGroupAppearance
        self.chipAppearance = chipAppearance
        self.labelPlacement = labelPlacement
        self.requiredPlacement = requiredPlacement
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
        self.endContentColorReadOnly = endContentColorReadOnly
        self.endContentColorFocused = endContentColorFocused
        self.inputTextAlignment = inputTextAlignment
        self.innerTitleTextAlignment = innerTitleTextAlignment
        self.innerTitleTypography = innerTitleTypography
        self.lineColor = lineColor
        self.lineColorFocused = lineColorFocused
        self.lineColorReadOnly = lineColorReadOnly
        self.optionalTitleColor = optionalTitleColor
        self.placeholderColor = placeholderColor
        self.placeholderColorFocused = placeholderColorFocused
        self.placeholderColorReadOnly = placeholderColorReadOnly
        self.requiredIndicatorColor = requiredIndicatorColor
        self.startContentColor = startContentColor
        self.startContentColorFocused = startContentColorFocused
        self.startContentColorReadOnly = startContentColorReadOnly
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
