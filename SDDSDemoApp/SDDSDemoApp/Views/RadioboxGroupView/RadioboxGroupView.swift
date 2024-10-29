import SwiftUI
import Combine
import SDDSComponents
import SDDSComponents

struct RadioboxGroupView: View {
    @ObservedObject private var viewModel: RadioboxGroupViewModel

    init(viewModel: RadioboxGroupViewModel = RadioboxGroupViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            Section {
                SDDSRadioboxGroup(
                    radioboxData: viewModel.radioboxData,
                    size: viewModel.size
                )
            }

            Section(header: Text("Configuration")) {
                Picker("Size", selection: $viewModel.size) {
                    ForEach(SDDSRadioboxGroupSize.allCases, id: \.self) { size in
                        Text(size.rawValue.capitalized).tag(size)
                    }
                }

                ForEach(viewModel.radioboxViewModels.indices, id: \.self) { index in
                    VStack(alignment: .leading) {
                        Text("Radiobox \(index + 1) Configuration")
                            .font(.headline)

                        Toggle("Is Selected", isOn: $viewModel.radioboxViewModels[index].isSelected)

                        Toggle("Is Enabled", isOn: $viewModel.radioboxViewModels[index].isEnabled)

                        HStack {
                            Text("Title")
                            Spacer()
                            TextField("Title", text: $viewModel.radioboxViewModels[index].title)
                                .multilineTextAlignment(.trailing)
                        }

                        HStack {
                            Text("Subtitle")
                            Spacer()
                            TextField("Subtitle", text: $viewModel.radioboxViewModels[index].subtitle)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .navigationTitle("SDDSRadioboxGroup")
    }
}

#Preview {
    NavigationView {
        RadioboxGroupView()
    }
}
