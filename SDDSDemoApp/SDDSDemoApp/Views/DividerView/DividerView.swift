import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SandboxSwiftUI

struct DividerView: View {
    @ObservedObject private var viewModel: DividerViewModel
    @Environment(\.colorScheme) private var colorScheme

    init(viewModel: DividerViewModel = DividerViewModel()) {
        self.viewModel = viewModel
    }

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
