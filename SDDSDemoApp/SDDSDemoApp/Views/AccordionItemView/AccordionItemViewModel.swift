import SwiftUI
import SDDSComponents
import SDDSThemeCore

final class AccordionItemViewModel: ComponentViewModel<AccordionItemVariationProvider> {
    @Published var title: String = "Заголовок элемента аккордеона"
    @Published var content: String = "Это содержимое элемента аккордеона. Здесь может быть любой текст, который будет отображаться при разворачивании элемента."
    @Published var isExpanded: Bool = false
    
    @Published var layout: AccordionItemLayout = .solidActionEnd {
        didSet {
            variationProvider.layout = layout
            self.selectVariation(variations.first)
        }
    }
    
    init(theme: Theme = .sdddsServTheme, uiState: AccordionItemUiState = .init()) {
        super.init(
            variationProvider: AccordionItemVariationProvider(theme: theme, layout: uiState.layout),
            theme: theme
        )
        apply(uiState: uiState)
    }

    private func apply(uiState: AccordionItemUiState) {
        title = uiState.title
        content = uiState.content
        isExpanded = uiState.isExpanded
        layout = uiState.layout
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}

