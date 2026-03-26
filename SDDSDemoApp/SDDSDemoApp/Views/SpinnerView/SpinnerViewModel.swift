import Foundation
import Combine
import SwiftUI
import SDDSComponents
import SDDSThemeCore

final class SpinnerViewModel: ComponentViewModel<SpinnerVariationProvider> {
    @Published var isAnimating: Bool = true

    init(
        theme: Theme = .sdddsServTheme,
        uiState: SpinnerUiState = .init(),
        componentViewLayoutMode: ComponentViewLayoutMode = .screen
    ) {
        super.init(
            variationProvider: SpinnerVariationProvider(theme: theme),
            componentViewLayoutMode: componentViewLayoutMode,
            theme: theme
        )

        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
        apply(uiState: uiState)
    }

    private func apply(uiState: SpinnerUiState) {
        isAnimating = uiState.isAnimating
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
    
    override func onUpdateAppearance() {
        super.onUpdateAppearance()
    }
} 
