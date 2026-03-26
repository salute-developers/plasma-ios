import SwiftUI
import SDDSComponents
import SDDSThemeCore

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
    
    init(theme: Theme = .sdddsServTheme, uiState: ListItemUiState = .init()) {
        super.init(variationProvider: ListItemVariationProvider(theme: theme, layout: uiState.layout), theme: theme)
        apply(uiState: uiState)
    }

    private func apply(uiState: ListItemUiState) {
        label = uiState.label
        title = uiState.title
        subtitle = uiState.subtitle
        counterText = uiState.counterText
        rightContentEnabled = uiState.rightContentEnabled
        disabled = uiState.disabled
        layout = uiState.layout
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}

