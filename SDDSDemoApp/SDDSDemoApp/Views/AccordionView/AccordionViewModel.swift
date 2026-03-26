import SwiftUI
import SDDSComponents
import SDDSThemeCore

final class AccordionViewModel: ComponentViewModel<AccordionVariationProvider> {
    @Published var title: String = "Title"
    @Published var content: String = "Content text"
    @Published var itemsCount: Int = 10 {
        didSet {
            if itemsCount < 1 {
                itemsCount = 1
            }
        }
    }
    @Published var showDividers: Bool = false
    
    @Published var layout: AccordionLayout = .solidActionEnd {
        didSet {
            variationProvider.layout = layout
            self.selectVariation(variations.first)
        }
    }
    
    init(theme: Theme = .sdddsServTheme, uiState: AccordionUiState = .init()) {
        super.init(
            variationProvider: AccordionVariationProvider(theme: theme, layout: uiState.layout),
            theme: theme
        )
        apply(uiState: uiState)
    }

    private func apply(uiState: AccordionUiState) {
        title = uiState.title
        content = uiState.content
        itemsCount = uiState.itemsCount
        showDividers = uiState.showDividers
        layout = uiState.layout
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
    
    var accordionItems: [AccordionData] {
        (0..<itemsCount).map { index in
            AccordionData(
                title: title,
                content: content,
                isExpanded: false,
                appearance: nil,
                onToggle: { isExpanded in
                    print("Элемент \(index + 1) " + (isExpanded ? "развернут" : "свернут"))
                }
            )
        }
    }
    
    var canChangeDividers: Bool {
        layout == .clearActionEnd || layout == .clearActionStart
    }
}
