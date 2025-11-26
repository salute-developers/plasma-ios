import Foundation
import SwiftUI
import SDDSThemeCore

struct VariationsView<Provider: VariationProvider>: View {
    @ObservedObject var viewModel: ComponentViewModel<Provider>

    var body: some View {
        Section {
            HStack {
                Text("Theme")
                
                Menu {
                    ForEach(themes, id: \.self) { theme in
                        Button(theme.name) {
                            viewModel.selectTheme(theme)
                        }
                    }
                } label: {
                    HStack {
                        Spacer().frame(maxWidth: .infinity)
                        Text(viewModel.theme.name)
                    }
                }
            }
            HStack {
                Text("Variation")
                Menu {
                    ForEach(viewModel.variations, id: \.self) { variation in
                        Button(variation.name) {
                            viewModel.selectVariation(variation)
                        }
                    }
                } label: {
                    HStack {
                        Spacer()
                        Text(viewModel.variation?.name ?? "")
                            .multilineTextAlignment(.trailing)
                            .padding(.trailing, 8)
                    }
                }
            }
            HStack {
                Text("Style")
                Menu {
                    ForEach(viewModel.styles, id: \.self) { style in
                        Button(style.name) {
                            viewModel.selectStyle(style)
                        }
                    }
                } label: {
                    HStack {
                        Spacer()
                        Text(viewModel.style?.name ?? "")
                            .multilineTextAlignment(.trailing)
                            .padding(.trailing, 8)
                    }
                }
            }
            HStack {
                Text("Subtheme")
                Menu {
                    ForEach(allSubthemes, id: \.self) { subtheme in
                        Button(subthemeName(subtheme)) {
                            viewModel.selectSubtheme(subtheme)
                        }
                    }
                } label: {
                    HStack {
                        Spacer()
                        Text(subthemeName(viewModel.subtheme))
                            .multilineTextAlignment(.trailing)
                            .padding(.trailing, 8)
                    }
                }
            }
        }
    }
    
    private func subthemeName(_ subtheme: Subtheme) -> String {
        switch subtheme {
        case .default:
            return "Default"
        case .onDark:
            return "On Dark"
        case .onLight:
            return "On Light"
        case .inverse:
            return "Inverse"
        case .none:
            return "None"
        }
    }
    
    private var themes: [Theme] {
        let variationProvider = viewModel.variationProvider
        let selectedTheme = variationProvider.theme
        let result = Theme.allCases.filter { theme in
            viewModel.variationProvider.theme = theme
            return variationProvider.variations.first != nil
        }
        variationProvider.theme = selectedTheme
        return result
    }
    
    private var allSubthemes: [Subtheme] {
        [.default, .onDark, .onLight, .inverse, .none]
    }
}

#Preview {
    VariationsView(viewModel: .init(variationProvider: ButtonVariationProvider(buttonType: .basic)))
}

