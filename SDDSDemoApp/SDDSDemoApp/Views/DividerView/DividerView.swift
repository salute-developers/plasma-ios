import SwiftUI
import SDDSComponents

struct DividerView: View {
    @ObservedObject private var viewModel: DividerViewModel = DividerViewModel()

    var body: some View {
        List {
            Section {
                SDDSDivider(
                    appearance: viewModel.appearance
                )
            }
            
            Section {
                VariationsView(viewModel: viewModel)
            }
        }
        .navigationTitle("Divider")
    }
}

#Preview {
    DividerView()
}
