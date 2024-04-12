import SwiftUI
import SDDSIcons

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.red.opacity(0.3)
                .ignoresSafeArea()
            VStack {
                Text("no bundle")
            }
            .padding()
        }
    }
    
    private var bundle: Bundle? {
        Bundle(for: Icons.self)
    }
}

#Preview {
    ContentView()
}
