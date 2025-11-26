import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct DividerView: View {
    @ObservedObject private var viewModel: DividerViewModel = DividerViewModel()
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        List {
            Section {
                SDDSDivider(
                    appearance: viewModel.appearance
                )
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
            
            Section {
                VariationsView(viewModel: viewModel)
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        
        .navigationTitle("Divider")
    }
}

#Preview {
    DividerView()
}
