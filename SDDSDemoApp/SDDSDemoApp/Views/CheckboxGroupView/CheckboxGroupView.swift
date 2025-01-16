import SwiftUI
import Combine
import SDDSComponents

import SDDSServTheme

struct CheckboxGroupView: View {
    @ObservedObject private var viewModel: CheckboxGroupViewModel

    init(viewModel: CheckboxGroupViewModel = CheckboxGroupViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            Section {
                if let groupBehaviour = viewModel.groupBehaviour {
                    SDDSCheckboxGroup(
                        behaviour: groupBehaviour,
                        size: viewModel.size
                    )
                    .id(UUID())
                }
            }

            Section(header: Text("Configuration")) {
                Picker("Size", selection: $viewModel.size) {
                    ForEach(SDDSCheckboxGroupSize.allCases, id: \.self) { size in
                        Text(size.rawValue).tag(size)
                    }
                }

                ForEach(viewModel.checkboxViewModels.indices, id: \.self) { index in
                    VStack(alignment: .leading) {
                        Text("Checkbox \(index + 1) Configuration")
                            .font(.headline)
                        
                        Toggle("Is Enabled", isOn: $viewModel.checkboxViewModels[index].isEnabled)
                        
                        Picker("State", selection: Binding(get: {
                            viewModel.states[index] ?? .deselected
                        }, set: { value in
                            viewModel.update(at: index, to: value)
                        })) {
                            ForEach(SelectionControlState.allCases, id: \.self) { state in
                                Text(state.rawValue).tag(state.rawValue)
                            }
                        }

                        HStack {
                            Text("Title")
                            Spacer()
                            TextField("Title", text: $viewModel.checkboxViewModels[index].title)
                                .multilineTextAlignment(.trailing)
                        }

                        HStack {
                            Text("Subtitle")
                            Spacer()
                            TextField("Subtitle", text: $viewModel.checkboxViewModels[index].subtitle)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .navigationTitle("SDDSCheckboxGroup")
    }
}

#Preview {
    NavigationView {
        CheckboxGroupView()
    }
}
