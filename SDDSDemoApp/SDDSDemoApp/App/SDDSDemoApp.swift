import SwiftUI
import SDDSServTheme
import StylesSaluteTheme
import PlasmaB2CTheme
import PlasmaHomeDSTheme

@main
struct SDDSDemoApp: App {
    @StateObject private var viewModel = SDDSDemoAppViewModel()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if viewModel.isInitialized {
                    ComponentsView()
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
