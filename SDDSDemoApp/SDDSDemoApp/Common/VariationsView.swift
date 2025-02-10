import Foundation
import SwiftUI

struct VariationsView<Provider: VariationProvider>: View {
    @ObservedObject var viewModel: ComponentViewModel<Provider>

    var body: some View {
        Section {
            HStack {
                Text("Theme")
                
                Menu {
                    ForEach(Theme.allCases, id: \.self) { theme in
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
}

#Preview {
    VariationsView(viewModel: .init(variationProvider: ButtonVariationProvider(buttonType: .basic)))
}

