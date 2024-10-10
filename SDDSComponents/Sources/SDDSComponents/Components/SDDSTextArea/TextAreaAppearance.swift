import Foundation
import SwiftUI
import SDDSThemeCore
import SDDSServTheme

public struct TextAreaAppearance {
    public let textTypography: TypographyConfiguration
    public let titleTypography: TypographyConfiguration
    public let innerTitleTypography: TypographyConfiguration
    public let captionTypography: TypographyConfiguration
    public let counterTypography: TypographyConfiguration
    public let titleColor: ColorToken
    public let optionalTitleColor: ColorToken
    public let textColor: ColorToken
    public let disabledAlpha: CGFloat
    public let requiredIndicatorColor: ColorToken
    public let cursorColor: ColorToken
    public let focusedBackgroundColor: ColorToken
    public let titleTextAlignment: TextAlignment
    public let captionTextAlignment: TextAlignment
    public let counterTextAlignment: TextAlignment
    public let inputTextAlignment: TextAlignment
    public let innerTitleTextAlignment: TextAlignment
    public let lineColor: ColorToken
    public let placeholderColor: ColorToken
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
    public let counterColorError: ColorToken
    public let counterColorWarning: ColorToken
    public let counterColorSuccess: ColorToken
    
    public init(
        textTypography: TypographyConfiguration,
        titleTypography: TypographyConfiguration,
        innerTitleTypography: TypographyConfiguration,
        captionTypography: TypographyConfiguration,
        counterTypography: TypographyConfiguration,
        titleColor: ColorToken,
        optionalTitleColor: ColorToken,
        textColor: ColorToken,
        disabledAlpha: CGFloat,
        requiredIndicatorColor: ColorToken,
        cursorColor: ColorToken,
        focusedBackgroundColor: ColorToken,
        titleTextAlignment: TextAlignment = .leading,
        captionTextAlignment: TextAlignment = .leading,
        counterTextAlignment: TextAlignment = .trailing,
        inputTextAlignment: TextAlignment = .leading,
        innerTitleTextAlignment: TextAlignment = .leading,
        lineColor: ColorToken,
        placeholderColor: ColorToken,
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
        counterColorError: ColorToken,
        counterColorWarning: ColorToken,
        counterColorSuccess: ColorToken
    ) {
        self.textTypography = textTypography
        self.titleTypography = titleTypography
        self.innerTitleTypography = innerTitleTypography
        self.captionTypography = captionTypography
        self.counterTypography = counterTypography
        self.titleColor = titleColor
        self.optionalTitleColor = optionalTitleColor
        self.textColor = textColor
        self.disabledAlpha = disabledAlpha
        self.requiredIndicatorColor = requiredIndicatorColor
        self.cursorColor = cursorColor
        self.focusedBackgroundColor = focusedBackgroundColor
        self.titleTextAlignment = titleTextAlignment
        self.captionTextAlignment = captionTextAlignment
        self.counterTextAlignment = counterTextAlignment
        self.inputTextAlignment = inputTextAlignment
        self.innerTitleTextAlignment = innerTitleTextAlignment
        self.lineColor = lineColor
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
        self.counterColorDefault = captionColorDefault
        self.counterColorError = captionColorError
        self.counterColorWarning = captionColorWarning
        self.counterColorSuccess = captionColorSuccess
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
    
    public func counterColor(for style: TextAreaStyle) -> ColorToken {
        switch style {
        case .default:
            return counterColorDefault
        case .error:
            return counterColorError
        case .warning:
            return counterColorWarning
        case .success:
            return counterColorSuccess
        }
    }

}

public extension TextAreaAppearance {
    static var defaultAppearance: TextAreaAppearance {
        .init(
            textTypography: TextAreaTypography.text,
            titleTypography: TextAreaTypography.title,
            innerTitleTypography: TextAreaTypography.innerTitle,
            captionTypography: TextAreaTypography.caption,
            counterTypography: TextAreaTypography.counter,
            titleColor: .surfaceInverseSolidPrimary.withOpacity(0.96),
            optionalTitleColor: .surfaceInverseSolidPrimary.withOpacity(0.28),
            textColor: .surfaceInverseSolidPrimary.withOpacity(0.96),
            disabledAlpha: 0.4,
            requiredIndicatorColor: .surfaceOnDarkNegative,
            cursorColor: .textDefaultAccent,
            focusedBackgroundColor: .surfaceDefaultTransparentSecondary,
            titleTextAlignment: .leading,
            captionTextAlignment: .leading,
            counterTextAlignment: .trailing,
            inputTextAlignment: .leading,
            innerTitleTextAlignment: .leading,
            lineColor: .surfaceDefaultTransparentTertiary,
            placeholderColor: .textDefaultSecondary,
            borderColorDefault: Color.clear.token,
            borderColorError: Color.clear.token,
            borderColorWarning: Color.clear.token,
            borderColorSuccess: Color.clear.token,
            backgroundColorDefault: .surfaceDefaultTransparentPrimary,
            backgroundColorError: ColorToken(
                darkColor: Color(UIColor(hex: "#FF293E").withAlphaComponent(0.2)),
                lightColor: Color(UIColor(hex: "#FF293E").withAlphaComponent(0.12))
            ),
            backgroundColorWarning: .surfaceDefaultTransparentWarning.inverted,
            backgroundColorSuccess: ColorToken(
                darkColor: Color(UIColor(hex: "#1A9E32").withAlphaComponent(0.2)),
                lightColor: Color(UIColor(hex: "#1A9E32").withAlphaComponent(0.12))
            ),
            captionColorDefault: .surfaceInverseSolidPrimary.withOpacity(0.56),
            captionColorError: .textDefaultNegative,
            captionColorWarning: .textDefaultWarning,
            captionColorSuccess: .textDefaultAccent,
            counterColorDefault: .surfaceInverseSolidPrimary.withOpacity(0.56),
            counterColorError: .textDefaultNegative,
            counterColorWarning: .textDefaultWarning,
            counterColorSuccess: .textDefaultAccent
        )
    }
}

extension ChipAppearance {
    static var textArea: ChipAppearance {
        ChipAppearance(
            titleColor: .surfaceInverseSolidPrimary.withOpacity(0.96),
            titleTypography: ChipAreaFieldTypography.text,
            imageTintColor: Color.clear.token,
            buttonTintColor: Color.clear.token,
            backgroundColor: .surfaceDefaultTransparentSecondary,
            disabledAlpha: 0.5
        )
    }
}

struct ChipAreaFieldTypography: GeneralTypographyConfiguration {
    let large: TypographyToken?
    let medium: TypographyToken?
    let small: TypographyToken?
    let extraSmall: TypographyToken?
    
    func typography(with size: ChipSizeConfiguration) -> TypographyToken? {
        switch size as? SDDSChipSize {
        case .large:
            return large
        case .medium:
            return medium
        case .small, .none:
            return small
        case .extraSmall:
            return extraSmall
        }
    }
}

extension ChipAreaFieldTypography {
    static var text: TypographyConfiguration {
        ChipAreaFieldTypography(
            large: Typographies.bodyLNormal.typography,
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodySNormal.typography,
            extraSmall: Typographies.bodyXsNormal.typography
        ).asContainer
    }
}

struct TextAreaTypography: GeneralTypographyConfiguration {
    let large: TypographyToken?
    let medium: TypographyToken?
    let small: TypographyToken?
    let extraSmall: TypographyToken?
    
    func typography(with size: TextAreaSizeConfiguration) -> TypographyToken? {
        switch size as? SDDSTextAreaSize {
        case .large:
            return large
        case .medium:
            return medium
        case .small, .none:
            return small
        case .extraSmall:
            return extraSmall
        }
    }
}

extension TextAreaTypography {
    static var title: TypographyConfiguration {
        TextAreaTypography(
            large: Typographies.bodyLNormal.typography,
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodySNormal.typography,
            extraSmall: Typographies.bodyXsNormal.typography
        ).asContainer
    }
    
    static var text: TypographyConfiguration {
        TextAreaTypography(
            large: Typographies.bodyLNormal.typography,
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodySNormal.typography,
            extraSmall: Typographies.bodyXsNormal.typography
        ).asContainer
    }
    
    static var innerTitle: TypographyConfiguration {
        TextAreaTypography(
            large: Typographies.bodyXsNormal.typography,
            medium: Typographies.bodyXsNormal.typography,
            small: Typographies.bodyXsNormal.typography,
            extraSmall: nil
        ).asContainer
    }
    
    static var caption: TypographyConfiguration {
        TextAreaTypography(
            large: Typographies.bodyXsNormal.typography,
            medium: Typographies.bodyXsNormal.typography,
            small: Typographies.bodyXsNormal.typography,
            extraSmall: Typographies.bodyXsNormal.typography
        ).asContainer
    }
    
    static var counter: TypographyConfiguration {
        TextAreaTypography(
            large: Typographies.bodyXsNormal.typography,
            medium: Typographies.bodyXsNormal.typography,
            small: Typographies.bodyXsNormal.typography,
            extraSmall: Typographies.bodyXsNormal.typography
        ).asContainer
    }
}

#Preview {
    SDDSTextAreaPreview.previews
}
