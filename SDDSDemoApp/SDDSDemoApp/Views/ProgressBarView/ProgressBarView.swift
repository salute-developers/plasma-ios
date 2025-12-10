import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSThemeCore

struct ProgressBarView: View {
    @ObservedObject private var viewModel: ProgressBarViewModel = ProgressBarViewModel()
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    SDDSProgressView(
                        progress: $viewModel.progress,
                        isEnabled: viewModel.isEnabled,
                        appearance: viewModel.appearance
                    )
                    Spacer()
                }
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
            
            Section {
                VariationsView(viewModel: viewModel)
                HStack {
                    Text("Progress")
                    Spacer()
                    Slider(value: $viewModel.progress, in: 0...1)
                }
                HStack {
                    Text("Progress Value (%)")
                    Spacer()
                    TextField("Progress", text: $viewModel.progressString)
                        .keyboardType(.decimalPad)
                        .frame(maxWidth: 100)
                }
                HStack {
                    Toggle("Enabled", isOn: $viewModel.isEnabled)
                }
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        
        .navigationTitle("ProgressView")
    }
}

#Preview {
    ProgressBarView()
}
