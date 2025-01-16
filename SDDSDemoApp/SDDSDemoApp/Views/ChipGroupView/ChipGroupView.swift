import SwiftUI

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
                        appearance: viewModel.chipGroupAppearance,
                        height: $size
                    )
                    .frame(height: size)
                }
            }
            
            Section {
                HStack {
                    Text("Chip Group Appearance")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(SDDSChipGroup.all, id: \.self) { variation in
                            Button(variation.name) {
                                viewModel.chipGroupAppearance = variation.appearance
                                viewModel.chipGroupVariationName = variation.name
                            }
                        }
                    } label: {
                        Text(viewModel.chipGroupVariationName.capitalized)
                    }

                }
                HStack {
                    Text("Chip Appearance")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(SDDSChip.all, id: \.self) { variation in
                            Button(variation.name) {
                                viewModel.appearance = variation.appearance.size(viewModel.chipSize)
                                viewModel.chipVariationName = variation.name
                            }
                        }
                    } label: {
                        Text(viewModel.chipVariationName.capitalized)
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
