import SwiftUI
import SDDSComponentsPreview
import Combine
import SDDSComponents
import SDDSServTheme

struct ChipView: View {
    @ObservedObject private var viewModel: ChipViewModel

    init(viewModel: ChipViewModel = ChipViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    SDDSChip(
                        title: viewModel.title,
                        isEnabled: viewModel.isEnabled,
                        iconImage: nil,
                        buttonImage: nil,
                        appearance: viewModel.appearance,
                        size: viewModel.size,
                        removeAction: viewModel.removeAction
                    )
                    Spacer()
                }
            }

            Section(header: Text("Configuration")) {
                HStack {
                    Text("Title")
                    Spacer()
                    TextField("Chip Title", text: $viewModel.title)
                        .multilineTextAlignment(.trailing)
                }

                Toggle("Enabled", isOn: $viewModel.isEnabled)

                Picker("Size", selection: $viewModel.size) {
                    ForEach(SDDSChipSize.allCases, id: \.self) { size in
                        Text(size.debugDescription).tag(size)
                    }
                }

                Picker("Border Style", selection: $viewModel.borderStyle) {
                    Text("Default").tag(ChipBorderStyle.default(viewModel.size.shapeToken.cornerRadius))
                    Text("Rounded").tag(ChipBorderStyle.pilled)
                }

                Picker("Appearance", selection: $viewModel.appearance) {
                    ForEach(ChipAppearance.allCases, id: \.self) { appearance in
                        Text(appearance.name).tag(appearance)
                    }
                }
            }
        }
        .navigationTitle("SDDSChip")
    }
}

#Preview {
    NavigationView {
        ChipView()
    }
}
