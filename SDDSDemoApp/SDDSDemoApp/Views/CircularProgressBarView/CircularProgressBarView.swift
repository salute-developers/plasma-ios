import SwiftUI
import SDDSComponents
import SDDSIcons

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
                        hasTrack: viewModel.hasTrack,
                        appearance: viewModel.appearance,
                        content: content
                    )
                    Spacer()
                }
            }
            
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Progress")
                        .font(.headline)
                    
                    Slider(value: $viewModel.progress, in: 0...1)
                    
                    Toggle("Has Track", isOn: $viewModel.hasTrack)
                    
                    Toggle("Custom Content", isOn: $viewModel.customContent)
                }
            }
            
            Section {
                VariationsView(viewModel: viewModel)
            }
        }
        .navigationTitle("SDDSCircularProgressBar")
    }
    
    private var content: AnyView? {
        if viewModel.customContent {
            AnyView(icon)
        } else {
            nil
        }
    }
    
    private var icon: some View {
        Asset.close24.image
            .renderingMode(.template)
            .tint(.black)
            .frame(width: 24, height: 24)
    }
}

#Preview {
    CircularProgressBarView()
} 
