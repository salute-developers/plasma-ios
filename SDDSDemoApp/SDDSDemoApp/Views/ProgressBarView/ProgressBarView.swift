import Foundation
import SwiftUI
import Combine
import SDDSComponents

struct ProgressBarView: View {
    @ObservedObject private var viewModel: ProgressBarViewModel

    init(viewModel: ProgressBarViewModel = ProgressBarViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    SDDSProgressView(
                        progress: $viewModel.progress,
                        isEnabled: viewModel.isEnabled,
                        appearance: viewModel.variation.appearance
                    )
                    Spacer()
                }
            }
            
            Section {
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
                
                Picker("Appearance", selection: $viewModel.variation) {
                    ForEach(SDDSProgressView.all, id: \.appearance) { variation in
                        Text(variation.name).tag(variation)
                    }
                }
            }
        }
        .navigationTitle("SDDSProgressView")
    }
}

#Preview {
    ProgressBarView(viewModel: ProgressBarViewModel())
}
