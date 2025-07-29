import Foundation
import SwiftUI

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
}

#Preview {
    VariationsView(viewModel: .init(variationProvider: ButtonVariationProvider(buttonType: .basic)))
}

