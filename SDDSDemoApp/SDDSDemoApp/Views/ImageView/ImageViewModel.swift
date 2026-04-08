import Foundation
import SDDSThemeCore

final class ImageViewModel: ComponentViewModel<ImageVariationProvider> {
    init(theme: Theme = .sdddsServTheme, uiState: ImageUiState = .init()) {
        super.init(variationProvider: ImageVariationProvider(theme: theme), theme: theme)
        apply(uiState: uiState)
    }

    private func apply(uiState: ImageUiState) {
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
