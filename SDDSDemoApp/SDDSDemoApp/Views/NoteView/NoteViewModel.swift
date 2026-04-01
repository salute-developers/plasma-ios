import Foundation
import Combine
import SwiftUI
import SDDSComponents
import SDDSThemeCore

final class NoteViewModel: ComponentViewModel<NoteVariationProvider> {
    @Published var title: String = "Title"
    @Published var text: String = "Text"
    @Published var hasContentBefore: Bool = true
    @Published var hasAction: Bool = true
    
    init(theme: Theme = .sdddsServTheme, uiState: NoteUiState = .init()) {
        super.init(variationProvider: NoteVariationProvider(theme: theme), theme: theme)

        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
        apply(uiState: uiState)
    }

    private func apply(uiState: NoteUiState) {
        title = uiState.title
        text = uiState.text
        hasContentBefore = uiState.hasContentBefore
        hasAction = uiState.hasAction
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
