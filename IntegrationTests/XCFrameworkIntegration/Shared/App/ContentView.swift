import SwiftUI
import SDDSThemeCore
import SDDSComponents
import SDDSIcons

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("SDDS integration: \(IntegrationTheme.name)")
                .foregroundColor(IntegrationTheme.primaryTextColor.color(for: .light))
            Asset.addFill24.image
            BasicButton(
                title: "Button",
                subtitle: "",
                appearance: IntegrationTheme.buttonAppearance,
                action: {}
            )
        }
        .padding()
    }
}
