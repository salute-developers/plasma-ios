import Foundation
import Combine
import SwiftUI
import SDDSComponents
import SDDSThemeCore

final class SwitchViewModel: ComponentViewModel<SwitchVariationProvider> {
    // MARK: - Switch Properties
    @Published var title: String = "Label"
    @Published var subtitle: String = "Description"
    @Published var isOn: Bool = true
    @Published var isEnabled: Bool = true
    @Published var switchAccessibility: SwitchAccessibility = SwitchAccessibility()
    
    init(theme: Theme = .sdddsServTheme, uiState: SwitchUiState = .init()) {
        super.init(variationProvider: SwitchVariationProvider(theme: theme), theme: theme)
        apply(uiState: uiState)
    }

    private func apply(uiState: SwitchUiState) {
        title = uiState.title
        subtitle = uiState.subtitle
        isOn = uiState.isOn
        isEnabled = uiState.isEnabled
        switchAccessibility = uiState.switchAccessibility
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
