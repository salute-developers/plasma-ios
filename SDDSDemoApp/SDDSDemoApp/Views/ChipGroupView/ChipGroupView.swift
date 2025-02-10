import SwiftUI

import Combine
import SDDSComponents
import SDDSServTheme

struct ChipGroupView: View {
    @ObservedObject var viewModel = ChipGroupViewModel()
    @State var size: CGFloat = 0

    var body: some View {
        List {
            Section {
                HStack {
                    SDDSChipGroup(
                        data: viewModel.chips,
                        appearance: viewModel.appearance,
                        height: $size
                    )
                    .frame(height: size)
                }
            }
            
            Section(header: Text("ChipGroup")) {
                VariationsView(viewModel: viewModel)
            }
            Section(header: Text("Chip")) {
                VariationsView(viewModel: viewModel.chipViewModel)
            }
            Toggle("Icon Image", isOn: $viewModel.iconImageEnabled)
            Toggle("Button Image", isOn: $viewModel.buttomImageEnabled)

            
            Section {
                ForEach(viewModel.chips.indices, id: \.self) { index in
                    HStack {
                        TextField(
                            "\(viewModel.chips[index].title)",
                            text: Binding(
                                get: {
                                    guard !viewModel.chips.isEmpty else {
                                        return ""
                                    }
                                    return viewModel.chips[index].title
                                },
                                set: { newTitle in
                                    viewModel.updateChipTitle(at: index, with: newTitle)
                                }
                            )
                        )
                        Spacer()
                        Button("Remove") {
                            viewModel.removeChip(at: index)
                        }
                        .foregroundColor(.red)
                    }
                }
                HStack {
                    TextField("Chip Title", text: $viewModel.chipViewModel.value)
                    Spacer()
                    Button("Add Chip") {
                        viewModel.addChip()
                    }
                }
            }
        }
        .navigationTitle("SDDSChipGroup")
    }
}

#Preview {
    NavigationView {
        ChipGroupView()
    }
}
