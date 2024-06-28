import SwiftUI
import SDDSTheme

@main
struct SDDSDemoApp: App {
    init() {
        Theme.initialize()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
