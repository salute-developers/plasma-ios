import SwiftUI
import SDDSComponents
import SDDSThemeCore

final class ListViewModel: ComponentViewModel<ListVariationProvider> {
    @Published var items: [ListItemData] = []
    @Published var nextItemId: Int = 1
    @Published var hasDivider: Bool = false
    
    @Published var layout: ListItemLayout = .listItemNormal {
        didSet {
            variationProvider.layout = layout
            self.selectVariation(variations.first)
        }
    }
    
    init(theme: Theme = .sdddsServTheme, uiState: ListUiState = .init()) {
        super.init(variationProvider: ListVariationProvider(theme: theme, layout: uiState.layout), theme: theme)
        if uiState.items.isEmpty {
            addItem()
            addItem()
            addItem()
        } else {
            items = uiState.items
            nextItemId = uiState.nextItemId
        }
        hasDivider = uiState.hasDivider
        layout = uiState.layout
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
    
    func addItem() {
        let newItem = ListItemData(
            id: UUID(),
            title: "Item \(nextItemId)"
        )
        items.append(newItem)
        nextItemId += 1
    }
    
    func removeItem(_ item: ListItemData) {
        items.removeAll { $0.id == item.id }
    }
}

struct ListItemData: Identifiable {
    let id: UUID
    let title: String
} 
