import Foundation
import SwiftUI
import SDDSThemeCore
import SDDSServTheme

public struct TextAreaAppearance {
    let id = UUID()
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
            textColorError: .textDefaultNegative,
            textColorWarning: .textDefaultWarning,
            textColorSuccess: .textDefaultAccent,
            disabledAlpha: 0.4,
            requiredIndicatorColor: .surfaceOnDarkNegative,
            cursorColor: .textDefaultAccent,
            focusedBackgroundColor: .surfaceDefaultTransparentSecondary,
            lineColor: .surfaceDefaultTransparentTertiary,
            focusedLineColor: .textDefaultAccent,
            focusedLineColorError: .textDefaultAccent,
            focusedLineColorWarning: .textDefaultAccent,
            focusedLineColorSuccess: .textDefaultAccent,
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
            counterColorDefault: .surfaceInverseSolidPrimary.withOpacity(0.96),
            placeholderColorDefault: .textDefaultSecondary,
            placeholderColorError: .textDefaultNegative,
            placeholderColorWarning: .textDefaultWarning,
            placeholderColorSuccess: .textDefaultAccent
        )
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

public extension ChipAppearance {
    static var textArea: ChipAppearance {
        ChipAppearance(
            titleColor: .surfaceInverseSolidPrimary.withOpacity(0.96),
            titleTypography: ChipTextAreaTypography.text,
            imageTintColor: Color.clear.token,
            buttonTintColor: Color.clear.token,
            backgroundColor: .surfaceDefaultTransparentSecondary,
            disabledAlpha: 0.5
        )
    }
}

struct ChipTextAreaTypography: GeneralTypographyConfiguration {
    let large: TypographyToken?
    let medium: TypographyToken?
    let small: TypographyToken?
    let extraSmall: TypographyToken?
    
    func typography(with size: ChipSizeConfiguration) -> TypographyToken? {
//        switch size as? SDDSChipSize {
//        case .large:
//            return large
//        case .medium:
//            return medium
//        case .small, .none:
//            return small
//        case .extraSmall:
//            return extraSmall
//        }
        return medium
    }
}

extension ChipTextAreaTypography {
    static var text: TypographyConfiguration {
        ChipTextAreaTypography(
            large: Typographies.bodyLNormal.typography,
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodySNormal.typography,
            extraSmall: Typographies.bodyXsNormal.typography
        ).asContainer
    }
}

#Preview {
    SDDSTextAreaPreview.previews
}
