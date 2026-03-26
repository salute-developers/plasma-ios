import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSThemeCore
import SandboxSwiftUI

struct SwitchView: View {
    @ObservedObject private var viewModel: SwitchViewModel
    @Environment(\.colorScheme) private var colorScheme

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
                    .frame(width: 180)
                    Spacer()
                }
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
            
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
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        
        .navigationTitle("Switch")
    }
}

#Preview {
    SwitchView()
}
