import Foundation
import SDDSServTheme
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
                        images: CheckboxView.checkbox,
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
        .navigationTitle("SDDSCheckbox")
    }
}

extension CheckboxView {
    static var checkbox: SelectionControlStateImages {
        .init(
            selectedImage: Image.image("checkboxOn", bundle: Bundle(for: CheckboxViewModel.self)),
            deselectedImage: Image.image("checkboxIconOff", bundle: Bundle(for: CheckboxViewModel.self)),
            indeterminateImage: Image.image("checkboxMulti", bundle: Bundle(for: CheckboxViewModel.self))
        )
    }
}

#Preview {
    CheckboxView()
}

