import Foundation

struct TextFieldAppearance {
    let backgroundColor: String
    let backgroundColorFocused: String
    let backgroundColorReadOnly: String
    let borderColor: String
    let captionColor: String
    let captionColorFocused: String
    let captionColorReadOnly: String
    let captionTypography: String
    let cursorColor: String
    let disabledAlpha: CGFloat
    let endContentColor: String
    let innerTitleTypography: String
    let lineColor: String
    let lineColorFocused: String
    let optionalTitleColor: String
    let placeholderColor: String
    let placeholderColorFocused: String
    let placeholderColorReadOnly: String
    let requiredIndicatorColor: String
    let startContentColor: String
    let textAfterColor: String
    let textAfterTypography: String
    let textBeforeColor: String
    let textBeforeTypography: String
    let textColor: String
    let textColorFocused: String
    let textColorReadOnly: String
    let textTypography: String
    let titleColor: String
    let titleTypography: String

    init(
        backgroundColor: String = "",
        backgroundColorFocused: String = "",
        backgroundColorReadOnly: String = "",
        borderColor: String = "",
        captionColor: String = "",
        captionColorFocused: String = "",
        captionColorReadOnly: String = "",
        captionTypography: String = "",
        cursorColor: String = "",
        disabledAlpha: CGFloat = 0,
        endContentColor: String = "",
        innerTitleTypography: String = "",
        lineColor: String = "",
        lineColorFocused: String = "",
        optionalTitleColor: String = "",
        placeholderColor: String = "",
        placeholderColorFocused: String = "",
        placeholderColorReadOnly: String = "",
        requiredIndicatorColor: String = "",
        startContentColor: String = "",
        textAfterColor: String = "",
        textAfterTypography: String = "",
        textBeforeColor: String = "",
        textBeforeTypography: String = "",
        textColor: String = "",
        textColorFocused: String = "",
        textColorReadOnly: String = "",
        textTypography: String = "",
        titleColor: String = "",
        titleTypography: String = ""
    ) {
        self.backgroundColor = backgroundColor
        self.backgroundColorFocused = backgroundColorFocused
        self.backgroundColorReadOnly = backgroundColorReadOnly
        self.borderColor = borderColor
        self.captionColor = captionColor
        self.captionColorFocused = captionColorFocused
        self.captionColorReadOnly = captionColorReadOnly
        self.captionTypography = captionTypography
        self.cursorColor = cursorColor
        self.disabledAlpha = disabledAlpha
        self.endContentColor = endContentColor
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
        self.titleTypography = titleTypography
    }
}
