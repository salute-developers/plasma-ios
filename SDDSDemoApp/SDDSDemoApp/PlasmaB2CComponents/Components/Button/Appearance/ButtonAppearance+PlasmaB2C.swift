import Foundation
import PlasmaB2CTheme
import SDDSThemeCore
import SDDSComponents

public extension ButtonAppearance {
    static var `default`: Self {
        return ButtonAppearance(
            name: "default",
            titleTypography: .text,
            titleColor: .textInversePrimary,
            subtitleTypography: .text,
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
            name: "accent",
            titleTypography: .text,
            titleColor: .textOnDarkPrimary,
            subtitleTypography: .text,
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
            name: "secondary",
            titleTypography: .text,
            titleColor: .textDefaultPrimary,
            subtitleTypography: .text,
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
            name: "clear",
            titleTypography: .text,
            titleColor: .textDefaultPrimary,
            subtitleTypography: .text,
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
            name: "positive",
            titleTypography: .text,
            titleColor: .textOnDarkPrimary,
            subtitleTypography: .text,
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
            name: "warning",
            titleTypography: .text,
            titleColor: .textOnDarkPrimary,
            subtitleTypography: .text,
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
            name: "negative",
            titleTypography: .text,
            titleColor: .textOnDarkPrimary,
            subtitleTypography: .text,
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
            name: "dark",
            titleTypography: .text,
            titleColor: .textOnDarkPrimary,
            subtitleTypography: .text,
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
            name: "black",
            titleTypography: .text,
            titleColor: .textOnDarkPrimary,
            subtitleTypography: .text,
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
            name: "linkDefault",
            titleTypography: .text,
            titleColor: .surfaceDefaultSolidDefault,
            subtitleTypography: .text,
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
            name: "linkAccent",
            titleTypography: .text,
            titleColor: .surfaceDefaultAccent,
            subtitleTypography: .text,
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
            name: "linkSecondary",
            titleTypography: .text,
            titleColor: .textDefaultSecondary,
            subtitleTypography: .text,
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
            name: "linkClear",
            titleTypography: .text,
            titleColor: .surfaceDefaultClear,
            subtitleTypography: .text,
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
            name: "linkPositive",
            titleTypography: .text,
            titleColor: .surfaceDefaultPositive,
            subtitleTypography: .text,
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
            name: "linkWarning",
            titleTypography: .text,
            titleColor: .surfaceDefaultWarning,
            subtitleTypography: .text,
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
            name: "linkNegative",
            titleTypography: .text,
            titleColor: .surfaceDefaultNegative,
            subtitleTypography: .text,
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
            name: "linkDark",
            titleTypography: .text,
            titleColor: .surfaceOnLightTransparentDeep,
            subtitleTypography: .text,
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
            name: "linkBlack",
            titleTypography: .text,
            titleColor: .surfaceOnLightSolidDefault,
            subtitleTypography: .text,
            subtitleColor: .clearColor,
            iconColor: .surfaceOnLightSolidDefault,
            spinnerColor: .surfaceOnLightSolidDefault,
            backgroundColor: .clearColor,
            disabledAlpha: 0.4,
            loadingAlpha: 0.06
        )
    }
}


extension TypographyConfiguration {
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
