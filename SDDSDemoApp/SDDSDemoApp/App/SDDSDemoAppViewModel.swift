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
import StylesSaluteTheme
import PlasmaB2CTheme
import PlasmaHomeDSTheme
#endif

final class SDDSDemoAppViewModel: ObservableObject {
    @Published var isInitialized = false

    private let profile: SandboxDesignSystemProfile
    private var initializationCount = 0
    private let totalThemes: Int

    init(profile: SandboxDesignSystemProfile) {
        self.profile = profile
        self.totalThemes = profile.supportedThemes.count
    }

    func initializeThemes() {
        guard !isInitialized else { return }

        #if SANDBOX_DS_SERV
        SDDSServTheme.Theme.initialize(
            tenant: TenantStorage.shared.tenant(for: .sdddsServTheme)
        ) { [weak self] in
            self?.isInitialized = true
        }
        return
        #elseif SANDBOX_DS_PLASMA_B2C
        PlasmaB2CTheme.Theme.initialize(
            tenant: TenantStorage.shared.tenant(for: .plasmaB2CTheme)
        ) { [weak self] in
            self?.isInitialized = true
        }
        return
        #elseif SANDBOX_DS_PLASMA_HOME_DS
        PlasmaHomeDSTheme.Theme.initialize(
            tenant: TenantStorage.shared.tenant(for: .plasmaHomeDSTheme)
        ) { [weak self] in
            self?.isInitialized = true
        }
        return
        #endif

        #if !SANDBOX_DS_SERV && !SANDBOX_DS_PLASMA_B2C && !SANDBOX_DS_PLASMA_HOME_DS
        if totalThemes == 0 {
            isInitialized = true
            return
        }

        if profile.supportedThemes.contains(.sdddsServTheme) {
            SDDSServTheme.Theme.initialize(
                tenant: TenantStorage.shared.tenant(for: .sdddsServTheme)
            ) { [weak self] in
                self?.themeDidInitialize()
            }
        }

        if profile.supportedThemes.contains(.stylesSalute) {
            StylesSaluteTheme.Theme.initialize(
                tenant: TenantStorage.shared.tenant(for: .stylesSalute)
            ) { [weak self] in
                self?.themeDidInitialize()
            }
        }

        if profile.supportedThemes.contains(.plasmaB2CTheme) {
            PlasmaB2CTheme.Theme.initialize(
                tenant: TenantStorage.shared.tenant(for: .plasmaB2CTheme)
            ) { [weak self] in
                self?.themeDidInitialize()
            }
        }

        if profile.supportedThemes.contains(.plasmaHomeDSTheme) {
            PlasmaHomeDSTheme.Theme.initialize(
                tenant: TenantStorage.shared.tenant(for: .plasmaHomeDSTheme)
            ) { [weak self] in
                self?.themeDidInitialize()
            }
        }
        #endif
    }

    private func themeDidInitialize() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.initializationCount += 1

            if self.initializationCount >= self.totalThemes {
                self.isInitialized = true
            }
        }
    }
}
