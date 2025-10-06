import SwiftUI
import SDDSComponents

final class ListViewModel: ComponentViewModel<ListVariationProvider> {
    @Published var items: [ListItemData] = []
    @Published var nextItemId: Int = 1
    
    @Published var layout: ListItemLayout = .listItemNormal {
        didSet {
            variationProvider.layout = layout
            self.selectVariation(variations.first)
        }
    }
    
    init() {
        super.init(variationProvider: ListVariationProvider())

        addItem()
        addItem()
        addItem()
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
