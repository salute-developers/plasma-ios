import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons
import SandboxSwiftUI

struct ListView: View {
    @ObservedObject private var viewModel: ListViewModel
    @Environment(\.colorScheme) private var colorScheme
    
    init(viewModel: ListViewModel = ListViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 0) {
            SDDSList(
                items: viewModel.items.enumerated().map { index, item in
                    SDDSListItem(
                        title: item.title,
                        subtitle: viewModel.layout == .listNumbered ? "Subtitle \(index + 1)" : nil,
                        counterText: viewModel.layout == .listNumbered ? "\(index + 1)" : nil,
                        rightContent: { EmptyView() },
                        appearance: resolvedListItemAppearance,
                        onTap: {
                            self.viewModel.removeItem(item)
                        }
                    )
                },
                showDividers: viewModel.hasDivider,
                appearance: viewModel.appearance
            )
            .backgroundColorForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
            .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
            Spacer()
            List {
                Section {
                    Picker("Layout", selection: $viewModel.layout) {
                        ForEach(ListItemLayout.listLayouts, id: \.self) { layout in
                            Text(layout.rawValue.capitalized).tag(layout)
                        }
                    }
                    HStack {
                        Text("Has Divider")
                        Spacer()
                        Toggle("", isOn: $viewModel.hasDivider)
                    }
                    VariationsView(viewModel: viewModel)
                    BasicButton(
                        title: "Add Item",
                        subtitle: "",
                        action: {
                            viewModel.addItem()
                        }
                    )
                    .frame(maxWidth: .infinity)
                }
            }
            .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
            
        }
    }

    private var resolvedListItemAppearance: ListItemAppearance {
        var appearance = viewModel.appearance.listItemAppearance
        if viewModel.theme == .plasmaHomeDSTheme {
            appearance.disclosureIcon = Asset.disclosureRightOutline24.image
            appearance.disclosureIconColor = .textDefaultSecondary
        }
        return appearance
    }
}

#Preview {
    ListView()
} 
