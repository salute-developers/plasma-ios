import SwiftUI
import SDDSComponents

struct CircularProgressBarView: View {
    @ObservedObject private var viewModel: CircularProgressBarViewModel = CircularProgressBarViewModel()
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    SDDSCircularProgressBar(
                        progress: viewModel.progress,
                        appearance: viewModel.appearance
                    )
                    Spacer()
                }
            }
            
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Progress")
                        .font(.headline)
                    
                    Slider(value: $viewModel.progress, in: 0...1)
                    
                    Toggle("Value Enabled", isOn: $viewModel.valueEnabled)
                        .onChange(of: viewModel.valueEnabled) { _ in
                            viewModel.updateAppearance()
                        }
                }
            }
            
            Section {
                VariationsView(viewModel: viewModel)
            }
        }
        .navigationTitle("SDDSCircularProgressBar")
    }
}

#Preview {
    CircularProgressBarView()
} 
