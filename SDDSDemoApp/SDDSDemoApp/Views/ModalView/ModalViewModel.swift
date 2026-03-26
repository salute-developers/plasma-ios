import Foundation
import SDDSComponents
import SDDSThemeCore

final class ModalViewModel: ComponentViewModel<ModalVariationProvider> {
    @Published var hasClose: Bool = true
    @Published var useNativeBlackout: Bool = false
    
    init(theme: Theme = .sdddsServTheme, uiState: ModalUiState = .init()) {
        super.init(variationProvider: ModalVariationProvider(theme: theme), theme: theme)
        apply(uiState: uiState)
    }

    private func apply(uiState: ModalUiState) {
        hasClose = uiState.hasClose
        useNativeBlackout = uiState.useNativeBlackout
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
