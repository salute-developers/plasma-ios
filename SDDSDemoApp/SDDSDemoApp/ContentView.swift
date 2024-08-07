import SwiftUI
import SDDSIcons
import SDDSTheme

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Test text")
                .applyTypography(AdaptiveTypographyToken.bodyLBold.medium)
        }
    }
}

#Preview {
    ContentView()
}
