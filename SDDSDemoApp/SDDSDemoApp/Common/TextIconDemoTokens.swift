import SDDSThemeCore

#if SANDBOX_DS_SERV
import SDDSServTheme

enum TextIconDemoTokens {
    static func positiveTextColorToken(theme _: Theme) -> ColorToken {
        SDDSServTheme.Colors.textDefaultPositive.token
    }

    static func accentTextColorToken(theme _: Theme) -> ColorToken {
        SDDSServTheme.Colors.textDefaultAccent.token
    }

    static func accentTextGradientToken(theme _: Theme) -> GradientToken {
        SDDSServTheme.Gradients.textDefaultAccentGradient.token
    }
}

#elseif SANDBOX_DS_PLASMA_B2C
import PlasmaB2CTheme

enum TextIconDemoTokens {
    static func positiveTextColorToken(theme _: Theme) -> ColorToken {
        PlasmaB2CTheme.Colors.textDefaultPositive.token
    }

    static func accentTextColorToken(theme _: Theme) -> ColorToken {
        PlasmaB2CTheme.Colors.textDefaultAccent.token
    }

    static func accentTextGradientToken(theme _: Theme) -> GradientToken {
        PlasmaB2CTheme.Gradients.textDefaultAccentGradient.token
    }
}

#elseif SANDBOX_DS_PLASMA_HOME_DS
import PlasmaHomeDSTheme

enum TextIconDemoTokens {
    static func positiveTextColorToken(theme _: Theme) -> ColorToken {
        PlasmaHomeDSTheme.Colors.textDefaultPositive.token
    }

    static func accentTextColorToken(theme _: Theme) -> ColorToken {
        PlasmaHomeDSTheme.Colors.textDefaultAccent.token
    }

    static func accentTextGradientToken(theme _: Theme) -> GradientToken {
        PlasmaHomeDSTheme.Gradients.textDefaultAccentGradient.token
    }
}

#else
import PlasmaB2CTheme
import PlasmaHomeDSTheme
import SDDSServTheme
import StylesSaluteTheme

enum TextIconDemoTokens {
    static func positiveTextColorToken(theme: Theme) -> ColorToken {
        switch theme {
        case .sdddsServTheme:
            return SDDSServTheme.Colors.textDefaultPositive.token
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Colors.textDefaultPositive.token
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.Colors.textDefaultPositive.token
        case .stylesSalute:
            return StylesSaluteTheme.Colors.textDefaultPositive.token
        }
    }

    static func accentTextColorToken(theme: Theme) -> ColorToken {
        switch theme {
        case .sdddsServTheme:
            return SDDSServTheme.Colors.textDefaultAccent.token
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Colors.textDefaultAccent.token
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.Colors.textDefaultAccent.token
        case .stylesSalute:
            return StylesSaluteTheme.Colors.textDefaultAccent.token
        }
    }

    static func accentTextGradientToken(theme: Theme) -> GradientToken {
        switch theme {
        case .sdddsServTheme:
            return SDDSServTheme.Gradients.textDefaultAccentGradient.token
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Gradients.textDefaultAccentGradient.token
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.Gradients.textDefaultAccentGradient.token
        case .stylesSalute:
            return StylesSaluteTheme.Gradients.textDefaultAccentGradient.token
        }
    }
}

#endif
