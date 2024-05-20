import SwiftUI
import SDDSTheme

struct TypographyView: View {    
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
