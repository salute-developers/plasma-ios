import SwiftUI
import SDDSComponentsPreview
import Combine
import SDDSComponents
import SDDSServTheme

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
                Picker("Chip Group Alignment", selection: $viewModel.chipGroupSize) {
                    ForEach(DefaultChipGroupSize.allCases, id: \.self) { size in
                        Text(size.debugDescription).tag(size.debugDescription)
                    }
                }
                Picker("Chip Size", selection: $viewModel.chipSize) {
                    ForEach(SDDSChipSize.allCases, id: \.self) { size in
                        Text(size.debugDescription).tag(size.debugDescription)
                    }
                }
                
                HStack {
                    Text("Appearance")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(SDDSChip.all, id: \.self) { variation in
                            Button(variation.name) {
                                viewModel.appearance = variation.appearance.size(viewModel.chipSize)
                                viewModel.variationName = variation.name
                            }
                        }
                    } label: {
                        Text(viewModel.variationName.capitalized)
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
