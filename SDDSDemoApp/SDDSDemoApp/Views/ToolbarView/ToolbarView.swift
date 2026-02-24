import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ToolbarView: View {
    @ObservedObject private var viewModel: ToolbarViewModel
    @Environment(\.colorScheme) private var colorScheme
    
    init(viewModel: ToolbarViewModel = ToolbarViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    SDDSToolbar(
                        slots: viewModel.slots,
                        slotsAmount: viewModel.slotsAmount,
                        hasDivider: viewModel.hasDivider,
                        appearance: viewModel.appearance
                    )
                    Spacer()
                }

            }
            .listRowBackground(Color.clear)
            .background(.clear)
            
            Section {
                toolbarTypeSelection
                VariationsView(viewModel: viewModel)
                HStack {
                    Toggle("Has Divider", isOn: $viewModel.hasDivider)
                }
                HStack {
                    Stepper("Slots Amount: \(viewModel.slotsAmount)", value: $viewModel.slotsAmount, in: 0...10)
                }
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        .navigationTitle("Toolbar")
    }
    
    @ViewBuilder
    private var toolbarTypeSelection: some View {
        HStack {
            Text("Toolbar Type")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                ForEach(ToolbarType.allCases, id: \.self) { toolbarType in
                    Button(toolbarType.rawValue.capitalized) {
                        viewModel.toolbarType = toolbarType
                    }
                }
            } label: {
                Text(viewModel.toolbarType.rawValue.capitalized)
            }
        }
    }
}

#Preview {
    ToolbarView()
}
