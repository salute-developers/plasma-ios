import SwiftUI
import SDDSComponents
import Combine
import SDDSComponents

struct ChipGroupView: View {
    @ObservedObject private var viewModel: ChipGroupViewModel
    @State var size: CGFloat = 0

    init(viewModel: ChipGroupViewModel = ChipGroupViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            Section {
                HStack {
                    SDDSChipGroup(
                        data: viewModel.chips,
                        size: viewModel.chipGroupSize,
                        height: $size
                    )
                    .frame(height: size)
                }
            }
            
            Section {
                Picker("Chip Group Alignment", selection: $viewModel.chipSize) {
                    ForEach(DefaultChipGroupSize.allCases, id: \.self) { size in
                        Text(size.debugDescription).tag(size.debugDescription)
                    }
                }
                Picker("Chip Size", selection: $viewModel.chipSize) {
                    ForEach(SDDSChipSize.allCases, id: \.self) { size in
                        Text(size.debugDescription).tag(size.debugDescription)
                    }
                }
                Picker("Appearance", selection: $viewModel.appearance) {
                    ForEach(ChipAppearance.allCases, id: \.self) { appearance in
                        Text(appearance.name).tag(appearance)
                    }
                }
            }
            
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
                    TextField("Chip Title", text: $viewModel.chipTitle)
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
