import SwiftUI
import SDDSComponents
import SDDSservTheme
import SDDSIcons

struct ListView: View {
    @ObservedObject private var viewModel: ListViewModel
    
    init() {
        self.viewModel = ListViewModel()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            SDDSList(
                items: viewModel.items.map { item in
                    SDDSListItem(
                        title: item.title,
                        rightContent: { EmptyView() },
                        appearance: viewModel.appearance.listItemAppearance,
                        onTap: {
                            self.viewModel.removeItem(item)
                        }
                    )
                },
                appearance: viewModel.appearance
            )
            Spacer()
            List {
                Section {
                    Picker("Layout", selection: $viewModel.layout) {
                        ForEach(ListItemLayout.allCases, id: \.self) { layout in
                            Text(layout.rawValue.capitalized).tag(layout)
                        }
                    }
                    VariationsView(viewModel: viewModel)
                    BasicButton(
                        title: "Add Item",
                        subtitle: "",
                        appearance: SDDSservTheme.BasicButton.m.accent.appearance,
                        action: {
                            viewModel.addItem()
                        }
                    )
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

#Preview {
    ListView()
} 
