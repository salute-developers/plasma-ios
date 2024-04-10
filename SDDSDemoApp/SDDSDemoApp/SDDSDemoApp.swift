import SwiftUI
import SDDSCore
import SDDSUIKit
import SDDSSwiftUI
import SDDSIcons
import SDDSTheme

@main
struct SDDSDemoApp: App {
    init() {
        ThemeService.shared.initialize()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
