import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme

struct SwitchView: View {
    @ObservedObject private var viewModel: SwitchViewModel = SwitchViewModel()
    
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
                    .frame(width: 180)
                    Spacer()
                }
            }
            
            Section {
                VariationsView(viewModel: viewModel)
                HStack {
                    Text("Title")
                    Spacer()
                    TextField("Label", text: $viewModel.title)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack {
                    Text("Subtitle")
                    Spacer()
                    TextField("Description", text: $viewModel.subtitle)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack {
                    Toggle("Enabled", isOn: $viewModel.isEnabled)
                }
                
                HStack {
                    Toggle("On/Off", isOn: $viewModel.isOn)
                }
            }
        }
        .navigationTitle("SDDSSwitch")
    }
}

#Preview {
    SwitchView()
}
