import Foundation
import SwiftUI
import SDDSThemeCore
import SDDSServTheme
import SDDSComponents

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
            counterColorDefault: .surfaceInverseSolidPrimary.withOpacity(0.56),
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
            size: ZeroChipSize(),
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
