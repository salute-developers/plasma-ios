import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSThemeCore
import SandboxSwiftUI

struct CheckboxView: View {
    @ObservedObject private var viewModel: CheckboxViewModel
    @Environment(\.colorScheme) private var colorScheme

    init(viewModel: CheckboxViewModel = CheckboxViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    SDDSCheckbox(
                        state: $viewModel.state,
                        title: viewModel.title,
                        subtitle: viewModel.subtitle,
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
                    Text("Title")
                    Spacer()
                    TextField("Checkbox Title", text: $viewModel.title)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack {
                    Text("Subtitle")
                    Spacer()
                    TextField("Checkbox Subtitle", text: $viewModel.subtitle)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack {
                    Text("State")
                    Spacer()
                    Menu {
                        ForEach(SelectionControlState.allCases, id: \.self) { state in
                            Button(state.rawValue.capitalized) {
                                viewModel.state = state
                            }
                        }
                    } label: {
                        Text(viewModel.state.rawValue.capitalized)
                    }
                }
                
                HStack {
                    Toggle("Enabled", isOn: $viewModel.isEnabled)
                }
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        
        .navigationTitle("Checkbox")
    }
}

#Preview {
    CheckboxView()
}

