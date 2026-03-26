import Foundation
import SDDSComponents
import SwiftUI
import SDDSThemeCore

final class EditableViewModel: ComponentViewModel<EditableVariationProvider> {
    @Published var text: String = "Value"
    @Published var enabled: Bool = true
    @Published var readOnly: Bool = false
    @Published var singleLine: Bool = true
    @Published var textAlign: TextAlignment = .leading
    @Published var hasIcon: Bool = true
    @Published var iconPlacement: EditableIconPlacement = .relative
    
    init(theme: Theme = .sdddsServTheme, uiState: EditableUiState = .init()) {
        super.init(variationProvider: EditableVariationProvider(theme: theme), theme: theme)
        apply(uiState: uiState)
    }

    private func apply(uiState: EditableUiState) {
        text = uiState.text
        enabled = uiState.enabled
        readOnly = uiState.readOnly
        singleLine = uiState.singleLine
        textAlign = uiState.textAlign
        hasIcon = uiState.hasIcon
        iconPlacement = uiState.iconPlacement
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
