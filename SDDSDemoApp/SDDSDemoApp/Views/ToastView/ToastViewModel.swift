import SwiftUI
import Combine
import SDDSComponents
import SDDSThemeCore

final class ToastViewModel: ComponentViewModel<ToastVariationProvider> {
    @Published var text: String = "Toast message"
    @Published var contentStartEnabled: Bool = true
    @Published var contentEndEnabled: Bool = true
    @Published var position: ToastPosition = .topCenter
    @Published var duration: TimeInterval = 3000
    
    init(theme: Theme = .sdddsServTheme, uiState: ToastUiState = .init()) {
        super.init(variationProvider: ToastVariationProvider(theme: theme), theme: theme)
        apply(uiState: uiState)
    }

    private func apply(uiState: ToastUiState) {
        text = uiState.text
        contentStartEnabled = uiState.contentStartEnabled
        contentEndEnabled = uiState.contentEndEnabled
        position = uiState.position
        duration = uiState.duration
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}

