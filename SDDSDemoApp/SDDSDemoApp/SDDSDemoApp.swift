import SwiftUI
import SDDSservTheme

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
