import SwiftUI
import SDDSComponents
import SDDSIcons

struct SpinnerView: View {
    @ObservedObject private var viewModel: SpinnerViewModel
    @Environment(\.colorScheme) private var colorScheme
    
    init(viewModel: SpinnerViewModel = .init()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        switch viewModel.componentViewLayoutMode {
        case .screen:
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
                    settings
                }
                
                Section {
                    VariationsView(viewModel: viewModel)
                }
            }
            .navigationTitle("Spinner")
        case .subScreen:
            settings
        }
    }
    
    @ViewBuilder
    private var settings: some View {
        VStack(alignment: .leading) {
            Toggle("Is Animating", isOn: $viewModel.isAnimating)
        }
    }
}
