import Foundation
import Combine
import SwiftUI
import SDDSComponents
import SDDSThemeCore

final class RadioboxViewModel: ComponentViewModel<RadioboxVariationProvider> {
    @Published var title: String = ""
    @Published var subtitle: String = ""
    @Published var isSelected: Bool = false
    @Published var isEnabled: Bool = true
    
    init(theme: Theme = .sdddsServTheme, uiState: RadioboxUiState = .init()) {
        super.init(variationProvider: RadioboxVariationProvider(theme: theme), theme: theme)
        apply(uiState: uiState)
    }

    private func apply(uiState: RadioboxUiState) {
        title = uiState.title
        subtitle = uiState.subtitle
        isSelected = uiState.isSelected
        isEnabled = uiState.isEnabled
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
