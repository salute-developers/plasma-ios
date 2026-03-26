import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class IndicatorViewModel: ComponentViewModel<IndicatorVariationProvider> {
    init(theme: Theme = .sdddsServTheme, uiState: IndicatorUiState = .init()) {
        super.init(
            variationProvider: IndicatorVariationProvider(theme: theme),
            theme: theme
        )
        apply(uiState: uiState)
    }

    private func apply(uiState: IndicatorUiState) {
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
