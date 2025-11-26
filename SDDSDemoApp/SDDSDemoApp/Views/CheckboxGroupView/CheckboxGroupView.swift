import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSServTheme

struct CheckboxGroupView: View {
    @ObservedObject private var viewModel: CheckboxGroupViewModel
    @Environment(\.colorScheme) private var colorScheme

    init(viewModel: CheckboxGroupViewModel = CheckboxGroupViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            Section {
                if let groupBehaviour = viewModel.groupBehaviour {
                    SDDSCheckboxGroup(
                        behaviour: groupBehaviour,
                        size: viewModel.appearance.size,
                        appearance: viewModel.appearance
                    )
                    .id(UUID())
                }
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)

            Section(header: Text("Configuration")) {
                VariationsView(viewModel: viewModel)
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
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        
        .navigationTitle("CheckboxGroup")
    }
}

#Preview {
    NavigationView {
        CheckboxGroupView()
    }
}
