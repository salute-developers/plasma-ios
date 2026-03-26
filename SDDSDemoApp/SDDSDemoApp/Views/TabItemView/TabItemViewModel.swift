import SwiftUI
import Combine
import SDDSComponents
import SDDSThemeCore

final class TabItemViewModel: ComponentViewModel<TabItemVariationProvider> {
    typealias Appearance = TabItemAppearance
    
    @Published var label: String = "Label"
    @Published var value: String? = nil
    @Published var hasValue: Bool = false {
        didSet {
            value = hasValue ? "Value" : nil
        }
    }
    @Published var counterValue: Int? = nil
    @Published var hasCounter: Bool = false {
        didSet {
            counterValue = hasCounter ? 5 : nil
        }
    }
    @Published var isSelected: Bool = false
    @Published var isDisabled: Bool = false
    @Published var orientation: TabsOrientation = .horizontal
    @Published var hasStartContent: Bool = false
    @Published var hasEndContent: Bool = false
    @Published var tabItemType: SDDSTabItemType = .tabItemDefault {
        didSet {
            self.variationProvider.tabItemType = tabItemType
            self.selectVariation(variations.first)
        }
    }
    
    init(theme: Theme = .sdddsServTheme, uiState: TabItemUiState = .init()) {
        super.init(
            variationProvider: TabItemVariationProvider(tabItemType: uiState.tabItemType, theme: theme),
            theme: theme
        )

        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
        apply(uiState: uiState)
    }

    private func apply(uiState: TabItemUiState) {
        label = uiState.label
        value = uiState.value
        hasValue = uiState.hasValue
        counterValue = uiState.counterValue
        hasCounter = uiState.hasCounter
        isSelected = uiState.isSelected
        isDisabled = uiState.isDisabled
        orientation = uiState.orientation
        hasStartContent = uiState.hasStartContent
        hasEndContent = uiState.hasEndContent
        tabItemType = uiState.tabItemType
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}

