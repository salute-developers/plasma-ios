import Foundation
import SDDSservTheme
import SwiftUI
import Combine
import SDDSComponents

struct CheckboxView: View {
    @ObservedObject private var viewModel: CheckboxViewModel = CheckboxViewModel()
    
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
        .navigationTitle("Checkbox")
    }
}

#Preview {
    CheckboxView()
}

