import Foundation

struct TextFieldAppearance: Codable {
    struct AppearanceVariation: Codable {
        let backgroundColor: String
        let backgroundColorFocused: String
        let backgroundColorReadOnly: String
        let captionColor: String
        let captionColorFocused: String
        let captionColorReadOnly: String
        let cursorColor: String
        let disabledAlpha: CGFloat
        let endContentColor: String
        let optionalTitleColor: String
        let placeholderColor: String
        let placeholderColorFocused: String
        let placeholderColorReadOnly: String
        let requiredIndicatorColor: String
        let startContentColor: String
        let textAfterColor: String
        let textBeforeColor: String
        let textColor: String
        let textColorFocused: String
        let textColorReadOnly: String
        let titleColor: String

        init(
            backgroundColor: String,
            backgroundColorFocused: String,
            backgroundColorReadOnly: String,
            captionColor: String,
            captionColorFocused: String,
            captionColorReadOnly: String,
            cursorColor: String,
            disabledAlpha: CGFloat,
            endContentColor: String,
            optionalTitleColor: String,
            placeholderColor: String,
            placeholderColorFocused: String,
            placeholderColorReadOnly: String,
            requiredIndicatorColor: String,
            startContentColor: String,
            textAfterColor: String,
            textBeforeColor: String,
            textColor: String,
            textColorFocused: String,
            textColorReadOnly: String,
            titleColor: String
        ) {
            self.backgroundColor = backgroundColor
            self.backgroundColorFocused = backgroundColorFocused
            self.backgroundColorReadOnly = backgroundColorReadOnly
            self.captionColor = captionColor
            self.captionColorFocused = captionColorFocused
            self.captionColorReadOnly = captionColorReadOnly
            self.cursorColor = cursorColor
            self.disabledAlpha = disabledAlpha
            self.endContentColor = endContentColor
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
            self.titleColor = titleColor
        }
    }
    
    let data: [String: AppearanceVariation]
}
