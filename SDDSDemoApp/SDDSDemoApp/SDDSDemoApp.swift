import SwiftUI

@main
struct SDDSDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ButtonView(viewModel: ButtonViewModel())
        }
    }
}
