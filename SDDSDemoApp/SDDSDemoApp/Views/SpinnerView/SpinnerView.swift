import SwiftUI
import SDDSComponents
import SDDSIcons

struct SpinnerView: View {
    @ObservedObject private var viewModel: SpinnerViewModel = SpinnerViewModel()
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    SDDSSpinner(
                        isAnimating: viewModel.isAnimating,
                        appearance: viewModel.appearance
                    )
                    Spacer()
                }
            }
            
            Section {
                VStack(alignment: .leading) {
                    Toggle("Is Animating", isOn: $viewModel.isAnimating)
                }
            }
            
            Section {
                VariationsView(viewModel: viewModel)
            }
        }
        .navigationTitle("Spinner")
    }
}
