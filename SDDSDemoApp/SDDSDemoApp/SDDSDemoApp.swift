import SwiftUI
import PlasmaB2CTheme

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
