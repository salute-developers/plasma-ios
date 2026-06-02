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
import StylesSaluteTheme
import SandboxDemoTheme
#endif

@main
struct SDDSDemoApp: App {
    private let profile: SandboxDesignSystemProfile
    @StateObject private var viewModel: SDDSDemoAppViewModel
    @StateObject private var tenantStorage = TenantStorage.shared

    init() {
        let resolvedProfile = SandboxDesignSystemProfile.current
        self.profile = resolvedProfile
        _viewModel = StateObject(wrappedValue: SDDSDemoAppViewModel(profile: resolvedProfile))
    }

    var body: some Scene {
        WindowGroup {
            Group {
                if viewModel.isInitialized {
                    ComponentsView(profile: profile)
                        .id(tenantStorage.treeIdentity)
                        .overlay(alignment: .topTrailing) {
                            TenantPickerView(profile: profile, storage: tenantStorage)
                                .padding(.top, 8)
                                .padding(.trailing, 8)
                        }
                } else {
                    LoadingView()
                }
            }
            .onAppear {
                viewModel.initializeThemes()
            }
        }
    }
}

final class TenantStorage: ObservableObject {
    static let shared = TenantStorage()

    private let defaultsKey = "SDDSDemoApp.activeTenantsByTheme"

    @Published private(set) var selection: [String: String]

    init() {
        let raw = UserDefaults.standard.dictionary(forKey: defaultsKey) as? [String: String]
        self.selection = raw ?? [:]
    }

    func tenant(for theme: SandboxDemoAppTheme) -> Tenant {
        let name = selection[theme.rawValue] ?? ""
        return Tenant(name: name)
    }

    func setTenant(_ tenant: Tenant, for theme: SandboxDemoAppTheme) {
        if tenant.isNone {
            selection.removeValue(forKey: theme.rawValue)
        } else {
            selection[theme.rawValue] = tenant.name
        }
        UserDefaults.standard.set(selection, forKey: defaultsKey)
    }

    var treeIdentity: String {
        selection
            .sorted { $0.key < $1.key }
            .map { "\($0.key)=\($0.value)" }
            .joined(separator: ",")
    }
}

struct TenantPickerView: View {
    let profile: SandboxDesignSystemProfile
    @ObservedObject var storage: TenantStorage

    private var themesWithTenants: [SandboxDemoAppTheme] {
        profile.supportedThemes
            .filter { !$0.availableTenants.isEmpty }
            .sorted { $0.rawValue < $1.rawValue }
    }

    var body: some View {
        if themesWithTenants.isEmpty {
            EmptyView()
        } else {
            Menu {
                ForEach(themesWithTenants, id: \.rawValue) { theme in
                    Section(theme.name) {
                        baseButton(for: theme)
                        ForEach(theme.availableTenants, id: \.name) { tenant in
                            tenantButton(theme: theme, tenant: tenant)
                        }
                    }
                }
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: "paintpalette")
                    Text(labelText)
                        .font(.caption.bold())
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(Color.black.opacity(0.7))
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        }
    }

    private var labelText: String {
        let active = themesWithTenants
            .map { theme in storage.tenant(for: theme).name }
            .filter { !$0.isEmpty }
        if active.isEmpty {
            return "Tenant: Base"
        }
        return "Tenant: " + active.joined(separator: "/")
    }

    @ViewBuilder
    private func baseButton(for theme: SandboxDemoAppTheme) -> some View {
        let isActive = storage.tenant(for: theme).isNone
        Button {
            apply(.none, for: theme)
        } label: {
            if isActive {
                Label("Base", systemImage: "checkmark")
            } else {
                Text("Base")
            }
        }
    }

    @ViewBuilder
    private func tenantButton(theme: SandboxDemoAppTheme, tenant: Tenant) -> some View {
        let isActive = storage.tenant(for: theme) == tenant
        Button {
            apply(tenant, for: theme)
        } label: {
            if isActive {
                Label(tenant.name, systemImage: "checkmark")
            } else {
                Text(tenant.name)
            }
        }
    }

    private func apply(_ tenant: Tenant, for theme: SandboxDemoAppTheme) {
        guard storage.tenant(for: theme) != tenant else { return }
        storage.setTenant(tenant, for: theme)
        theme.initialize(tenant: tenant)
    }
}
