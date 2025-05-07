import SwiftUI
import SDDSIcons
import SDDSTheme

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Circular Progress Bar") {
                    CircularProgressBarView()
                }
            }
            .navigationTitle("SDDS Components")
        }
    }
}

#Preview {
    ContentView()
}
