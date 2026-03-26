import Foundation
import SDDSThemeCore

final class RectSkeletonViewModel: ComponentViewModel<RectSkeletonVariationProvider> {
    init(theme: Theme = .sdddsServTheme, uiState: RectSkeletonUiState = .init()) {
        super.init(variationProvider: RectSkeletonVariationProvider(theme: theme), theme: theme)
        apply(uiState: uiState)
    }

    private func apply(uiState: RectSkeletonUiState) {
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
