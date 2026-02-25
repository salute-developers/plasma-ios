import SwiftUI
import SDDSComponents

final class ListItemViewModel: ComponentViewModel<ListItemVariationProvider> {
    @Published var label: String = "Label"
    @Published var title: String = "Title"
    @Published var subtitle: String = "Subtitle"
    @Published var counterText: String = "1"
    @Published var rightContentEnabled: Bool = true
    @Published var disabled: Bool = false
    
    @Published var layout: ListItemLayout = .listItemNormal {
        didSet {
            variationProvider.layout = layout
            self.selectVariation(variations.first)
        }
    }
    
    init() {
        super.init(variationProvider: ListItemVariationProvider())
    }
} 
