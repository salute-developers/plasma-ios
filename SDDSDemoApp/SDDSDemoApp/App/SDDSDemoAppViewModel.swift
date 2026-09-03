import SwiftUI
import Combine
#if SANDBOX_DS_SERV
import SDDSServTheme
#elseif SANDBOX_DS_PLASMA_B2C
import PlasmaB2CTheme
#elseif SANDBOX_DS_PLASMA_HOME_DS
import PlasmaHomeDSTheme
#else
import SDDSServTheme
import PlasmaB2CTheme
import PlasmaHomeDSTheme
#endif

final class SDDSDemoAppViewModel: ObservableObject {
    @Published var isInitialized = false

    private let profile: SandboxDesignSystemProfile

    init(profile: SandboxDesignSystemProfile) {
        self.profile = profile
    }

    /// К возврату из метода все темы профиля инициализированы.
    func initializeThemes() {
        guard !isInitialized else { return }

        #if SANDBOX_DS_SERV
        SDDSServTheme.Theme.initialize(tenant: TenantStorage.shared.tenant(for: .sdddsServTheme))
        #elseif SANDBOX_DS_PLASMA_B2C
        PlasmaB2CTheme.Theme.initialize(tenant: TenantStorage.shared.tenant(for: .plasmaB2CTheme))
        #elseif SANDBOX_DS_PLASMA_HOME_DS
        PlasmaHomeDSTheme.Theme.initialize(tenant: TenantStorage.shared.tenant(for: .plasmaHomeDSTheme))
        #else
        if profile.supportedThemes.contains(.sdddsServTheme) {
            SDDSServTheme.Theme.initialize(tenant: TenantStorage.shared.tenant(for: .sdddsServTheme))
        }
        if profile.supportedThemes.contains(.plasmaB2CTheme) {
            PlasmaB2CTheme.Theme.initialize(tenant: TenantStorage.shared.tenant(for: .plasmaB2CTheme))
        }
        if profile.supportedThemes.contains(.plasmaHomeDSTheme) {
            PlasmaHomeDSTheme.Theme.initialize(tenant: TenantStorage.shared.tenant(for: .plasmaHomeDSTheme))
        }
        #endif

        isInitialized = true
    }
}
