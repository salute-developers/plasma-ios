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
                ScrollView(.horizontal) {
                    SDDSChip(
                        title: viewModel.title,
                        isEnabled: viewModel.isEnabled,
                        iconImage: viewModel.iconImage,
                        buttonImage: viewModel.buttonImage,
                        appearance: viewModel.appearance,
                        size: viewModel.size,
                        removeAction: viewModel.removeAction
                    )
                }
                .scrollIndicators(.hidden)
            }

            Section(header: Text("Configuration")) {
                HStack {
                    Text("Title")
                    Spacer()
                    TextField("Chip Title", text: $viewModel.title)
                        .multilineTextAlignment(.trailing)
                }

                Toggle("Enabled", isOn: $viewModel.isEnabled)
                Toggle("Icon Image", isOn: $viewModel.iconImageEnabled)
                Toggle("Button Image", isOn: $viewModel.buttomImageEnabled)

                Picker("Size", selection: $viewModel.size) {
                    ForEach(SDDSChipSize.allCases, id: \.self) { size in
                        Text(size.debugDescription).tag(size)
                    }
                }

                Picker("Border Style", selection: $viewModel.borderStyle) {
                    Text("Default").tag(ChipBorderStyle.default(viewModel.size.shapeToken.cornerRadius))
                    Text("Pilled").tag(ChipBorderStyle.pilled)
                }

                Picker("Appearance", selection: $viewModel.appearance) {
                    ForEach(ChipAppearance.allCases, id: \.self) { appearance in
                        Text(appearance.name).tag(appearance)
                    }
                }
            }
        }
        .navigationTitle("SDDSChip")
        .onChange(of: viewModel.iconImageEnabled) { iconImageEnabled in
            if iconImageEnabled {
                viewModel.setIconImage()
            } else {
                viewModel.iconImage = nil
            }
        }
        .onChange(of: viewModel.buttomImageEnabled) { buttomImageEnabled in
            if buttomImageEnabled {
                viewModel.setButtonImage()
            } else {
                viewModel.buttonImage = nil
            }
        }
        .onChange(of: viewModel.borderStyle) { borderStyle in
            viewModel.updateBorderStyle(borderStyle: borderStyle)
        }
    }
}

#Preview {
    NavigationView {
        ChipView()
    }
}
