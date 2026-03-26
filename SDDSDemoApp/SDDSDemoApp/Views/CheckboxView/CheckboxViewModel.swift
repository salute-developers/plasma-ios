import Foundation
import Combine
import SwiftUI
import SDDSComponents
import SDDSThemeCore

final class CheckboxViewModel: ComponentViewModel<CheckboxVariationProvider> {
    // MARK: - Checkbox Properties
    @Published var title: String = ""
    @Published var subtitle: String = ""
    @Published var state: SelectionControlState = .deselected
    @Published var isEnabled: Bool = true
    
    init(theme: Theme = .sdddsServTheme, uiState: CheckboxUiState = .init()) {
        super.init(variationProvider: CheckboxVariationProvider(theme: theme), theme: theme)
        apply(uiState: uiState)
    }

    private func apply(uiState: CheckboxUiState) {
        title = uiState.title
        subtitle = uiState.subtitle
        state = uiState.state
        isEnabled = uiState.isEnabled
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
