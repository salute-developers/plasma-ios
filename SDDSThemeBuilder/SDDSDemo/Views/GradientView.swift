import SwiftUI
import SDDSTheme

struct GradientView: View {
    private let tokens = GradientToken.tokens
    
    var body: some View {
        List {
            ForEach(tokens, id: \.self) { token in
                ForEach(ThemeStyle.allCases, id: \.self) { theme in
                    Section(header: header(theme: theme, token: token)) {
                        exampleView
                            .applyGradient(token, theme: theme)
                            .cornerRadius(16)
                    }
                }
            }
        }
    }
    
    private func header(theme: ThemeStyle, token: GradientToken) -> some View {
        HStack {
            Text(theme.title)
            Spacer()
            Text(token.description)
            Spacer()
        }
    }
    
    private var exampleView: some View {
        VStack {
            Spacer()
                .frame(height: 64)
        }
    }
}
