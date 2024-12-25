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
                
                HStack {
                    Text("Size")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(SDDSChipSize.allCases, id: \.self) { size in
                            Button(size.debugDescription) {
                                viewModel.size = size
                            }
                        }
                    } label: {
                        Text(viewModel.size.debugDescription)
                    }
                }

                Picker("Border Style", selection: $viewModel.borderStyle) {
                    Text("Default").tag(ComponentShapeStyle.cornered)
                    Text("Pilled").tag(ComponentShapeStyle.pilled)
                }
                
                HStack {
                    Text("Appearance")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(SDDSChip.all, id: \.self) { variation in
                            Button(variation.name) {
                                viewModel.appearance = variation.appearance.size(viewModel.size)
                                viewModel.variationName = variation.name
                            }
                        }
                    } label: {
                        Text(viewModel.variationName.capitalized)
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
