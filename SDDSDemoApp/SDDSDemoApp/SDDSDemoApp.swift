import SwiftUI
import SDDSservTheme
import StylesSaluteTheme
import PlasmaB2CTheme

@main
struct SDDSDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ComponentsView()
                .onAppear {
                    SDDSservTheme.Theme.initialize()
                    StylesSaluteTheme.Theme.initialize()
                    PlasmaB2CTheme.Theme.initialize()
                }
        }
    }
}
