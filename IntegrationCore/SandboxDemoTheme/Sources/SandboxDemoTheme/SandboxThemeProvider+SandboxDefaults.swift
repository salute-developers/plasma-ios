import Foundation
import PlasmaB2CTheme
import PlasmaHomeDSTheme
import SandboxCore
import SDDSServTheme
import StylesSaluteTheme

extension SDDSServSandboxThemeProvider {
    /// Pre-configured provider for sandbox variant/appearance lists (SDDS Serv).
    public static var forSandbox: Self {
        Self(
            variantResolver: { SandboxThemeVariationResolver.variantNames(theme: .sdddsServTheme, component: $0) },
            appearanceResolver: { SandboxThemeVariationResolver.appearanceNames(theme: .sdddsServTheme, component: $0, variant: $1) }
        )
    }
}

extension PlasmaB2CSandboxThemeProvider {
    public static var forSandbox: Self {
        Self(
            variantResolver: { SandboxThemeVariationResolver.variantNames(theme: .plasmaB2CTheme, component: $0) },
            appearanceResolver: { SandboxThemeVariationResolver.appearanceNames(theme: .plasmaB2CTheme, component: $0, variant: $1) }
        )
    }
}

extension PlasmaHomeDSSandboxThemeProvider {
    public static var forSandbox: Self {
        Self(
            variantResolver: { SandboxThemeVariationResolver.variantNames(theme: .plasmaHomeDSTheme, component: $0) },
            appearanceResolver: { SandboxThemeVariationResolver.appearanceNames(theme: .plasmaHomeDSTheme, component: $0, variant: $1) }
        )
    }
}

extension StylesSaluteSandboxThemeProvider {
    public static var forSandbox: Self {
        Self(
            variantResolver: { SandboxThemeVariationResolver.variantNames(theme: .stylesSalute, component: $0) },
            appearanceResolver: { SandboxThemeVariationResolver.appearanceNames(theme: .stylesSalute, component: $0, variant: $1) }
        )
    }
}
