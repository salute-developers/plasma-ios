import Foundation
import SwiftUI
import Combine
import SDDSComponents

struct ProgressBarView: View {
    @ObservedObject private var viewModel: ProgressBarViewModel = ProgressBarViewModel()
    
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
        .navigationTitle("SDDSProgressView")
    }
}

#Preview {
    ProgressBarView()
}
