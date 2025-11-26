import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

struct CircularProgressBarView: View {
    @ObservedObject private var viewModel: CircularProgressBarViewModel
    @Environment(\.colorScheme) private var colorScheme
    
    init(viewModel: CircularProgressBarViewModel = .init()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        switch viewModel.componentViewLayoutMode {
        case .screen:
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
                .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
                
                Section {
                    settings
                }
                
                Section {
                    VariationsView(viewModel: viewModel)
                }
            }
            .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
            
            .navigationTitle("CircularProgressBar")
        case .subScreen:
            settings
        }
    }
    
    @ViewBuilder
    private var settings: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Progress")
                .font(.headline)
            
            Slider(value: $viewModel.progress, in: 0...1)
            
            Toggle("Has Track", isOn: $viewModel.hasTrack)
            
            Toggle("Custom Content", isOn: $viewModel.customContent)
        }
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
