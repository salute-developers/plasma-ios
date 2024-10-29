import Foundation
@_exported import SDDSservTheme
@_exported import SDDSThemeCore
@_exported import SDDSThemeUtilities


extension ButtonAppearance {
    static var `default`: Self {
        return ButtonAppearance(
            titleTypography: ButtonTypography.text,
            titleColor: .textInversePrimary,
            subtitleTypography: ButtonTypography.text,
            subtitleColor: .textInverseSecondary,
            iconColor: .textInversePrimary,
            spinnerColor: .textInversePrimary,
            backgroundColor: .surfaceDefaultSolidDefault,
            disabledAlpha: 0.4,
            loadingAlpha: 0.06
        )
    }
    
    static var accent: Self {
        return ButtonAppearance(
            titleTypography: ButtonTypography.text,
            titleColor: .textOnDarkPrimary,
            subtitleTypography: ButtonTypography.text,
            subtitleColor: .textOnDarkSecondary,
            iconColor: .textOnDarkPrimary,
            spinnerColor: .textOnDarkPrimary,
            backgroundColor: .surfaceDefaultAccent,
            disabledAlpha: 0.4,
            loadingAlpha: 0.06
        )
    }
    
    static var secondary: Self {
        return ButtonAppearance(
            titleTypography: ButtonTypography.text,
            titleColor: .textDefaultPrimary,
            subtitleTypography: ButtonTypography.text,
            subtitleColor: .textDefaultSecondary,
            iconColor: .textDefaultPrimary,
            spinnerColor: .textDefaultPrimary,
            backgroundColor: .surfaceDefaultTransparentSecondary,
            disabledAlpha: 0.4,
            loadingAlpha: 0.06
        )
    }
    
    static var clear: Self {
        return ButtonAppearance(
            titleTypography: ButtonTypography.text,
            titleColor: .textDefaultPrimary,
            subtitleTypography: ButtonTypography.text,
            subtitleColor: .textDefaultSecondary,
            iconColor: .textDefaultPrimary,
            spinnerColor: .textDefaultPrimary,
            backgroundColor: .surfaceDefaultClear,
            disabledAlpha: 0.4,
            loadingAlpha: 0.06
        )
    }
    
    static var positive: Self {
        return ButtonAppearance(
            titleTypography: ButtonTypography.text,
            titleColor: .textOnDarkPrimary,
            subtitleTypography: ButtonTypography.text,
            subtitleColor: .textOnDarkSecondary,
            iconColor: .textOnDarkPrimary,
            spinnerColor: .textOnDarkPrimary,
            backgroundColor: .surfaceDefaultPositive,
            disabledAlpha: 0.4,
            loadingAlpha: 0.06
        )
    }
    
    static var warning: Self {
        return ButtonAppearance(
            titleTypography: ButtonTypography.text,
            titleColor: .textOnDarkPrimary,
            subtitleTypography: ButtonTypography.text,
            subtitleColor: .textOnDarkSecondary,
            iconColor: .textOnDarkPrimary,
            spinnerColor: .textOnDarkPrimary,
            backgroundColor: .surfaceDefaultWarning,
            disabledAlpha: 0.4,
            loadingAlpha: 0.06
        )
    }
    
    static var negative: Self {
        return ButtonAppearance(
            titleTypography: ButtonTypography.text,
            titleColor: .textOnDarkPrimary,
            subtitleTypography: ButtonTypography.text,
            subtitleColor: .textOnDarkSecondary,
            iconColor: .textOnDarkPrimary,
            spinnerColor: .textOnDarkPrimary,
            backgroundColor: .surfaceDefaultNegative,
            disabledAlpha: 0.4,
            loadingAlpha: 0.06
        )
    }
    
    static var dark: Self {
        return ButtonAppearance(
            titleTypography:  ButtonTypography.text,
            titleColor: .textOnDarkPrimary,
            subtitleTypography:  ButtonTypography.text,
            subtitleColor: .textOnDarkSecondary,
            iconColor: .textOnDarkPrimary,
            spinnerColor: .textOnDarkPrimary,
            backgroundColor: .surfaceOnLightTransparentDeep,
            disabledAlpha: 0.4,
            loadingAlpha: 0.06
        )
    }
    
    static var black: Self {
        return ButtonAppearance(
            titleTypography: ButtonTypography.text,
            titleColor: .textOnDarkPrimary,
            subtitleTypography: ButtonTypography.text,
            subtitleColor: .textOnDarkSecondary,
            iconColor: .textOnDarkPrimary,
            spinnerColor: .textOnDarkPrimary,
            backgroundColor: .surfaceOnLightSolidDefault,
            disabledAlpha: 0.4,
            loadingAlpha: 0.06
        )
    }
    
    static var linkDefault: Self {
        return ButtonAppearance(
            titleTypography: ButtonTypography.text,
            titleColor: .surfaceDefaultSolidDefault,
            subtitleTypography: ButtonTypography.text,
            subtitleColor: .clearColor,
            iconColor: .surfaceDefaultSolidDefault,
            spinnerColor: .surfaceDefaultSolidDefault,
            backgroundColor: .clearColor,
            disabledAlpha: 0.4,
            loadingAlpha: 0.06
        )
    }
    
    static var linkAccent: Self {
        return ButtonAppearance(
            titleTypography: ButtonTypography.text,
            titleColor: .surfaceDefaultAccent,
            subtitleTypography: ButtonTypography.text,
            subtitleColor: .clearColor,
            iconColor: .surfaceDefaultAccent,
            spinnerColor: .surfaceDefaultAccent,
            backgroundColor: .clearColor,
            disabledAlpha: 0.4,
            loadingAlpha: 0.06
        )
    }
    
    static var linkSecondary: Self {
        return ButtonAppearance(
            titleTypography: ButtonTypography.text,
            titleColor: .textDefaultSecondary,
            subtitleTypography: ButtonTypography.text,
            subtitleColor: .clearColor,
            iconColor: .textDefaultSecondary,
            spinnerColor: .textDefaultSecondary,
            backgroundColor: .clearColor,
            disabledAlpha: 0.4,
            loadingAlpha: 0.06
        )
    }
    
    static var linkClear: Self {
        return ButtonAppearance(
            titleTypography: ButtonTypography.text,
            titleColor: .surfaceDefaultClear,
            subtitleTypography: ButtonTypography.text,
            subtitleColor: .clearColor,
            iconColor: .surfaceDefaultClear,
            spinnerColor: .surfaceDefaultClear,
            backgroundColor: .clearColor,
            disabledAlpha: 0.4,
            loadingAlpha: 0.06
        )
    }
    
    static var linkPositive: Self {
        return ButtonAppearance(
            titleTypography: ButtonTypography.text,
            titleColor: .surfaceDefaultPositive,
            subtitleTypography: ButtonTypography.text,
            subtitleColor: .clearColor,
            iconColor: .surfaceDefaultPositive,
            spinnerColor: .surfaceDefaultPositive,
            backgroundColor: .clearColor,
            disabledAlpha: 0.4,
            loadingAlpha: 0.06
        )
    }
    
    static var linkWarning: Self {
        return ButtonAppearance(
            titleTypography: ButtonTypography.text,
            titleColor: .surfaceDefaultWarning,
            subtitleTypography: ButtonTypography.text,
            subtitleColor: .clearColor,
            iconColor: .surfaceDefaultWarning,
            spinnerColor: .surfaceDefaultWarning,
            backgroundColor: .clearColor,
            disabledAlpha: 0.4,
            loadingAlpha: 0.06
        )
    }
    
    static var linkNegative: Self {
        return ButtonAppearance(
            titleTypography: ButtonTypography.text,
            titleColor: .surfaceDefaultNegative,
            subtitleTypography: ButtonTypography.text,
            subtitleColor: .clearColor,
            iconColor: .surfaceDefaultNegative,
            spinnerColor: .surfaceDefaultNegative,
            backgroundColor: .clearColor,
            disabledAlpha: 0.4,
            loadingAlpha: 0.06
        )
    }
    
    static var linkDark: Self {
        return ButtonAppearance(
            titleTypography: ButtonTypography.text,
            titleColor: .surfaceOnLightTransparentDeep,
            subtitleTypography: ButtonTypography.text,
            subtitleColor: .clearColor,
            iconColor: .surfaceOnLightTransparentDeep,
            spinnerColor: .surfaceOnLightTransparentDeep,
            backgroundColor: .clearColor,
            disabledAlpha: 0.4,
            loadingAlpha: 0.06
        )
    }
    
    static var linkBlack: Self {
        return ButtonAppearance(
            titleTypography: ButtonTypography.text,
            titleColor: .surfaceOnLightSolidDefault,
            subtitleTypography: ButtonTypography.text,
            subtitleColor: .clearColor,
            iconColor: .surfaceOnLightSolidDefault,
            spinnerColor: .surfaceOnLightSolidDefault,
            backgroundColor: .clearColor,
            disabledAlpha: 0.4,
            loadingAlpha: 0.06
        )
    }
}


extension ButtonTypography {
    static var text: TypographyConfiguration {
        ButtonTypography(
            large: AdaptiveTypographyToken.bodyLBold.typography,
            medium: AdaptiveTypographyToken.bodyMBold.typography,
            small: AdaptiveTypographyToken.bodySBold.typography,
            extraSmall: AdaptiveTypographyToken.bodyXsBold.typography,
            extraExtraSmall: AdaptiveTypographyToken.bodyXsNormal.typography
        )
        .asContainer
    }
}

public extension ButtonAppearance {
    static let all: [ButtonAppearance] = [
        .default,
        .accent,
        .secondary,
        .clear,
        .positive,
        .warning,
        .negative,
        .dark,
        .black,
        .linkDefault,
        .linkAccent,
        .linkSecondary,
        .linkClear,
        .linkPositive,
        .linkWarning,
        .linkNegative,
        .linkDark,
        .linkBlack
    ]
}
