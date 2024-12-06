import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme

struct SwitchView: View {
    @ObservedObject private var viewModel: SwitchViewModel

    init(viewModel: SwitchViewModel = SwitchViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    SDDSSwitch(
                        title: viewModel.title,
                        subtitle: viewModel.subtitle,
                        isOn: $viewModel.isOn,
                        isEnabled: viewModel.isEnabled,
                        appearance: viewModel.appearance,
                        switchAccessibility: viewModel.switchAccessibility
                    )
                    Spacer()
                }
            }
            
            Section {
                HStack {
                    Text("Title")
                    Spacer()
                    TextField("Switch Title", text: $viewModel.title)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack {
                    Text("Subtitle")
                    Spacer()
                    TextField("Switch Subtitle", text: $viewModel.subtitle)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack {
                    Toggle("Enabled", isOn: $viewModel.isEnabled)
                }
                
                HStack {
                    Toggle("On/Off", isOn: $viewModel.isOn)
                }
                
                Picker("Size", selection: $viewModel.size) {
                    ForEach(SDDSSwitchSize.allCases, id: \.self) { size in
                        Button(size.description) {
                            viewModel.size = size
                        }
                    }
                }
                
                Picker("Appearance", selection: $viewModel.appearance) {
                    ForEach(SDDSSwitch.all, id: \.self) { variation in
                        Button(variation.name) {
                            viewModel.appearance = variation.appearance.size(viewModel.size)
                            viewModel.variationName = variation.name
                        }
                    }
                }
            }
        }
        .navigationTitle("SDDSSwitch")
    }
}

#Preview {
    SwitchView(viewModel: SwitchViewModel())
}
