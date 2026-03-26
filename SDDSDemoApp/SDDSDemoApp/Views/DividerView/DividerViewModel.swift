import Foundation
import SDDSThemeCore

final class DividerViewModel: ComponentViewModel<DividerVariationProvider> {
    init(theme: Theme = .sdddsServTheme, uiState: DividerUiState = .init()) {
        super.init(variationProvider: DividerVariationProvider(theme: theme), theme: theme)
        apply(uiState: uiState)
    }

    private func apply(uiState: DividerUiState) {
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
