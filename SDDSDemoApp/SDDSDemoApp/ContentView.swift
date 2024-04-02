import SwiftUI
import SDDSIcons

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.red.opacity(0.3)
                .ignoresSafeArea()
            VStack {
                if let bundle = bundle {
                    Image("testIcon", bundle: bundle)
                        .fixedSize()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.red)
                } else {
                    Text("no bundle")
                }
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
