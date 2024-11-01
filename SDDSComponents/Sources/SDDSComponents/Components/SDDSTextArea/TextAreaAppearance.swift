import Foundation
import SwiftUI
import SDDSThemeCore
import SDDSServTheme

public struct TextAreaAppearance {
    public let id = UUID()
    public let textTypography: TypographyConfiguration
    public let titleTypography: TypographyConfiguration
    public let innerTitleTypography: TypographyConfiguration
    public let captionTypography: TypographyConfiguration
    public let counterTypography: TypographyConfiguration
    public let titleColor: ColorToken
    public let optionalTitleColor: ColorToken
    public let textColor: ColorToken
    public let textColorError: ColorToken
    public let textColorWarning: ColorToken
    public let textColorSuccess: ColorToken
    public let disabledAlpha: CGFloat
    public let requiredIndicatorColor: ColorToken
    public let cursorColor: ColorToken
    public let focusedBackgroundColor: ColorToken
    public let titleTextAlignment: TextAlignment
    public let captionTextAlignment: TextAlignment
    public let inputTextAlignment: TextAlignment
    public let innerTitleTextAlignment: TextAlignment
    public let lineColor: ColorToken
    public let focusedLineColor: ColorToken
    public let focusedLineColorError: ColorToken
    public let focusedLineColorWarning: ColorToken
    public let focusedLineColorSuccess: ColorToken
    public let placeholderColor: ColorToken?
    public let borderColorDefault: ColorToken
    public let borderColorError: ColorToken
    public let borderColorWarning: ColorToken
    public let borderColorSuccess: ColorToken
    public let backgroundColorDefault: ColorToken
    public let backgroundColorError: ColorToken
    public let backgroundColorWarning: ColorToken
    public let backgroundColorSuccess: ColorToken
    public let captionColorDefault: ColorToken
    public let captionColorError: ColorToken
    public let captionColorWarning: ColorToken
    public let captionColorSuccess: ColorToken
    public let counterColorDefault: ColorToken
    public let placeholderColorDefault: ColorToken
    public let placeholderColorError: ColorToken
    public let placeholderColorWarning: ColorToken
    public let placeholderColorSuccess: ColorToken
    
    public init(
        textTypography: TypographyConfiguration,
        titleTypography: TypographyConfiguration,
        innerTitleTypography: TypographyConfiguration,
        captionTypography: TypographyConfiguration,
        counterTypography: TypographyConfiguration,
        titleColor: ColorToken,
        optionalTitleColor: ColorToken,
        textColor: ColorToken,
        textColorError: ColorToken,
        textColorWarning: ColorToken,
        textColorSuccess: ColorToken,
        disabledAlpha: CGFloat,
        requiredIndicatorColor: ColorToken,
        cursorColor: ColorToken,
        focusedBackgroundColor: ColorToken,
        titleTextAlignment: TextAlignment = .leading,
        captionTextAlignment: TextAlignment = .leading,
        inputTextAlignment: TextAlignment = .leading,
        innerTitleTextAlignment: TextAlignment = .leading,
        lineColor: ColorToken,
        focusedLineColor: ColorToken,
        focusedLineColorError: ColorToken,
        focusedLineColorWarning: ColorToken,
        focusedLineColorSuccess: ColorToken,
        placeholderColor: ColorToken? = nil,
        borderColorDefault: ColorToken,
        borderColorError: ColorToken,
        borderColorWarning: ColorToken,
        borderColorSuccess: ColorToken,
        backgroundColorDefault: ColorToken,
        backgroundColorError: ColorToken,
        backgroundColorWarning: ColorToken,
        backgroundColorSuccess: ColorToken,
        captionColorDefault: ColorToken,
        captionColorError: ColorToken,
        captionColorWarning: ColorToken,
        captionColorSuccess: ColorToken,
        counterColorDefault: ColorToken,
        placeholderColorDefault: ColorToken,
        placeholderColorError: ColorToken,
        placeholderColorWarning: ColorToken,
        placeholderColorSuccess: ColorToken
    ) {
        self.textTypography = textTypography
        self.titleTypography = titleTypography
        self.innerTitleTypography = innerTitleTypography
        self.captionTypography = captionTypography
        self.counterTypography = counterTypography
        self.titleColor = titleColor
        self.optionalTitleColor = optionalTitleColor
        self.textColor = textColor
        self.textColorError = textColorError
        self.textColorWarning = textColorWarning
        self.textColorSuccess = textColorSuccess
        self.disabledAlpha = disabledAlpha
        self.requiredIndicatorColor = requiredIndicatorColor
        self.cursorColor = cursorColor
        self.focusedBackgroundColor = focusedBackgroundColor
        self.titleTextAlignment = titleTextAlignment
        self.captionTextAlignment = captionTextAlignment
        self.inputTextAlignment = inputTextAlignment
        self.innerTitleTextAlignment = innerTitleTextAlignment
        self.lineColor = lineColor
        self.focusedLineColor = focusedLineColor
        self.focusedLineColorError = focusedLineColorError
        self.focusedLineColorWarning = focusedLineColorWarning
        self.focusedLineColorSuccess = focusedLineColorSuccess
        self.placeholderColor = placeholderColor
        self.borderColorDefault = borderColorDefault
        self.borderColorError = borderColorError
        self.borderColorWarning = borderColorWarning
        self.borderColorSuccess = borderColorSuccess
        self.backgroundColorDefault = backgroundColorDefault
        self.backgroundColorError = backgroundColorError
        self.backgroundColorWarning = backgroundColorWarning
        self.backgroundColorSuccess = backgroundColorSuccess
        self.captionColorDefault = captionColorDefault
        self.captionColorError = captionColorError
        self.captionColorWarning = captionColorWarning
        self.captionColorSuccess = captionColorSuccess
        self.counterColorDefault = counterColorDefault
        self.placeholderColorDefault = placeholderColorDefault
        self.placeholderColorError = placeholderColorError
        self.placeholderColorWarning = placeholderColorWarning
        self.placeholderColorSuccess = placeholderColorSuccess
    }
    
    public func borderColor(for style: TextAreaStyle) -> ColorToken {
        switch style {
        case .default:
            return borderColorDefault
        case .error:
            return borderColorError
        case .warning:
            return borderColorWarning
        case .success:
            return borderColorSuccess
        }
    }
    
    public func backgroundColor(for style: TextAreaStyle, isFocused: Bool) -> ColorToken {
        if isFocused {
            return focusedBackgroundColor
        }
        switch style {
        case .default:
            return backgroundColorDefault
        case .error:
            return backgroundColorError
        case .warning:
            return backgroundColorWarning
        case .success:
            return backgroundColorSuccess
        }
    }
    
    public func captionColor(for style: TextAreaStyle) -> ColorToken {
        switch style {
        case .default:
            return captionColorDefault
        case .error:
            return captionColorError
        case .warning:
            return captionColorWarning
        case .success:
            return captionColorSuccess
        }
    }
    
    public func focusedLineColor(for style: TextAreaStyle) -> ColorToken {
        switch style {
        case .default:
            return focusedLineColor
        case .error:
            return focusedLineColorError
        case .warning:
            return focusedLineColorWarning
        case .success:
            return focusedLineColorSuccess
        }
    }
    
    public func textColor(for style: TextAreaStyle, layout: TextAreaLayout) -> ColorToken {
        if layout == .clear {
            switch style {
            case .default:
                return textColor
            case .error:
                return textColorError
            case .warning:
                return textColorWarning
            case .success:
                return textColorSuccess
            }
        } else {
            return textColor
        }
    }
    
    public func placeholderColor(for style: TextAreaStyle, layout: TextAreaLayout) -> ColorToken {
        if let customColor = placeholderColor {
            return customColor
        }
        if layout == .clear {
            switch style {
            case .default:
                return placeholderColorDefault
            case .error:
                return placeholderColorError
            case .warning:
                return placeholderColorWarning
            case .success:
                return placeholderColorSuccess
            }
        } else {
            return placeholderColorDefault
        }
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
