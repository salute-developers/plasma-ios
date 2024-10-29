import SwiftUI
import Combine
import SDDSComponents
import SDDSComponents
import SDDSservTheme

struct CheckboxGroupView: View {
    @ObservedObject private var viewModel: CheckboxGroupViewModel

    init(viewModel: CheckboxGroupViewModel = CheckboxGroupViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            Section {
                SDDSCheckboxGroup(
                    behaviour: viewModel.groupBehaviour,
                    size: viewModel.size
                )
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

                        Toggle("Is Selected", isOn: $viewModel.checkboxViewModels[index].isSelected)

                        Toggle("Is Enabled", isOn: $viewModel.checkboxViewModels[index].isEnabled)

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
