import SwiftUI
import SDDSTheme

@main
struct SDDSDemoApp: App {
    init() {
        ThemeService.shared.initialize()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
