import SwiftUI
import SDDSServTheme

@main
struct SDDSDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ComponentsView()
                .onAppear {
                    Theme.initialize()
                }
        }
    }
}
