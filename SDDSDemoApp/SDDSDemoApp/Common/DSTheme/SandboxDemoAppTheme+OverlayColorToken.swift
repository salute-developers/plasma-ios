#if !(SANDBOX_DS_SERV || SANDBOX_DS_PLASMA_B2C || SANDBOX_DS_PLASMA_HOME_DS)
import SandboxDemoTheme
import SDDSThemeCore
import SDDSComponents
import SDDSServTheme
import PlasmaB2CTheme
import PlasmaHomeDSTheme
import StylesSaluteTheme

extension SandboxDemoAppTheme {
    var overlayDefaultSoftColorToken: ColorToken {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Colors.overlayDefaultSoft.token
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Colors.overlayDefaultSoft.token
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.Colors.overlayDefaultSoft.token
        case .stylesSalute:
            return StylesSaluteTheme.Colors.overlayDefaultSoft.token
        }
    }

    var formItemVariations: [Variation<FormItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.FormItem.all
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.FormItem.all
        case .plasmaB2CTheme, .stylesSalute:
            return []
        }
    }
}
#endif
