import SwiftUI

@main
struct SDDSDemoApp: App {
    private let profile: SandboxDesignSystemProfile
    @StateObject private var viewModel: SDDSDemoAppViewModel

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
