import SwiftUI
import SDDSComponents

final class ListItemViewModel: ComponentViewModel<ListItemVariationProvider> {
    @Published var title: String = "Title"
    @Published var rightContentEnabled: Bool = true
    @Published var disabled: Bool = false
    
    @Published var layout: ListItemLayout = .normal {
        didSet {
            variationProvider.layout = layout
            self.selectVariation(variations.first)
        }
    }
    
    init() {
        super.init(variationProvider: ListItemVariationProvider())
    }
} 
