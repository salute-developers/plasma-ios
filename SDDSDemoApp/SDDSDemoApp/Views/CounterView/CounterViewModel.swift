import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSThemeCore

final class CounterViewModel: ComponentViewModel<CounterVariationProvider> {
    @Published var text: String = "1"

    init(
        theme: Theme = .sdddsServTheme,
        uiState: CounterUiState = .init(),
        componentViewLayoutMode: ComponentViewLayoutMode = .screen
    ) {
        super.init(
            variationProvider: CounterVariationProvider(theme: theme),
            componentViewLayoutMode: componentViewLayoutMode,
            theme: theme
        )
        apply(uiState: uiState)
    }

    private func apply(uiState: CounterUiState) {
        text = uiState.text
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
