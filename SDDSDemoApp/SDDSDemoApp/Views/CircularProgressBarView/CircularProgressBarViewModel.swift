import Foundation
import Combine
import SwiftUI
import SDDSComponents
import SDDSThemeCore

final class CircularProgressBarViewModel: ComponentViewModel<CircularProgressBarVariationProvider> {
    @Published var progress: Double = 0.5
    @Published var valueEnabled: Bool = true
    @Published var hasTrack: Bool = true
    @Published var customContent: Bool = false

    init(
        theme: Theme = .sdddsServTheme,
        uiState: CircularProgressBarUiState = .init(),
        componentViewLayoutMode: ComponentViewLayoutMode = .screen
    ) {
        super.init(
            variationProvider: CircularProgressBarVariationProvider(theme: theme),
            componentViewLayoutMode: componentViewLayoutMode,
            theme: theme
        )

        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
        apply(uiState: uiState)
    }

    private func apply(uiState: CircularProgressBarUiState) {
        progress = uiState.progress
        valueEnabled = uiState.valueEnabled
        hasTrack = uiState.hasTrack
        customContent = uiState.customContent
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
