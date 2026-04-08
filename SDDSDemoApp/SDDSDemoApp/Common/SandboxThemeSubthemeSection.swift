import SwiftUI
import SDDSThemeCore

/// Theme and subtheme menus aligned with ``VariationsView`` (for demos without variation/style lists).
struct SandboxThemeSubthemeSection: View {
    @Binding var theme: Theme
    @Binding var subtheme: Subtheme

    private let profile = SandboxDesignSystemProfile.current

    var body: some View {
        Group {
            if themes.count > 1 {
                HStack {
                    Text("Theme")
                    Menu {
                        ForEach(themes, id: \.self) { t in
                            Button(t.name) {
                                theme = t
                            }
                        }
                    } label: {
                        HStack {
                            Spacer().frame(maxWidth: .infinity)
                            Text(theme.name)
                        }
                    }
                }
            }
            HStack {
                Text("Subtheme")
                Menu {
                    ForEach(allSubthemes, id: \.self) { st in
                        Button(subthemeName(st)) {
                            subtheme = st
                        }
                    }
                } label: {
                    HStack {
                        Spacer()
                        Text(subthemeName(subtheme))
                            .multilineTextAlignment(.trailing)
                            .padding(.trailing, 8)
                    }
                }
            }
        }
    }

    private var themes: [Theme] {
        let allowed = profile.supportedThemes
        return Theme.allCases.filter { allowed.contains($0) }
    }

    private var allSubthemes: [Subtheme] {
        [.default, .onDark, .onLight, .inverse, .none]
    }

    private func subthemeName(_ subtheme: Subtheme) -> String {
        switch subtheme {
        case .default: return "Default"
        case .onDark: return "On Dark"
        case .onLight: return "On Light"
        case .inverse: return "Inverse"
        case .none: return "None"
        }
    }
}
