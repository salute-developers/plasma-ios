import SwiftUI

import Combine
import SDDSComponents
import SDDSServTheme

struct ChipView: View {
    @ObservedObject private var viewModel: ChipViewModel = ChipViewModel()

    var body: some View {
        List {
            Section {
                ScrollView(.horizontal) {
                    SDDSChip(
                        title: viewModel.value,
                        isEnabled: viewModel.isEnabled,
                        contentStart: viewModel.iconImage,
                        contentEnd: viewModel.buttonImage,
                        appearance: viewModel.appearance,
                        removeAction: viewModel.removeAction
                    )
                }
                .scrollIndicators(.hidden)
            }
            Section {
                VariationsView(viewModel: viewModel)
                HStack {
                    Text("Value")
                    Spacer()
                    TextField("Value", text: $viewModel.value)
                        .multilineTextAlignment(.trailing)
                }
                Toggle("Enabled", isOn: $viewModel.isEnabled)
                Toggle("Icon Image", isOn: $viewModel.iconImageEnabled)
                Toggle("Button Image", isOn: $viewModel.buttomImageEnabled)
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
    }
}

#Preview {
    NavigationView {
        ChipView()
    }
}
