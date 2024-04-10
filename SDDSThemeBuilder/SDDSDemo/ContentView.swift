import SwiftUI
import SDDSTheme

struct ContentView: View {
    init() {
        ThemeService.shared.initialize()
    }
    
    private let tokens = AdaptiveTypographyToken.tokens
    
    var body: some View {
        List {
            Section(header: Text("Small")) {
                ForEach(tokens.map { $0.small }, id: \.self) { token in
                    Text(placeholder)
                        .applyTypography(token)
                }
            }
            Section(header: Text("Medium")) {
                ForEach(tokens.map { $0.medium }, id: \.self) { token in
                    Text(placeholder)
                        .applyTypography(token)
                }
            }
            Section(header: Text("Large")) {
                ForEach(tokens.map { $0.large }, id: \.self) { token in
                    Text(placeholder)
                        .applyTypography(token)
                }
            }
        }
    }
    
    private var placeholder: String {
        "Salut, world!"
    }
}

#Preview {
    ContentView()
}
