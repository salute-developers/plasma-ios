import SwiftUI
import SDDSServTheme
import StylesSaluteTheme
import PlasmaB2CTheme

@main
struct SDDSDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ComponentsView()
                .onAppear {
                    SDDSServTheme.Theme.initialize()
                    StylesSaluteTheme.Theme.initialize()
                    PlasmaB2CTheme.Theme.initialize()
                }
        }
    }
}
