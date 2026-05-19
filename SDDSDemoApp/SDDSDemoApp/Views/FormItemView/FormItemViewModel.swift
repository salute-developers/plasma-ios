import Foundation
import SDDSComponents

final class FormItemViewModel: ComponentViewModel<FormItemVariationProvider> {
    @Published var content: String = "Form item text content.\nSecond line text."
    @Published var title: String = "Title"
    @Published var titleCaption: String = ""
    @Published var caption: String = "Caption"
    @Published var counter: String = ""
    @Published var optional: String = "Optional"
    @Published var hasHint: Bool = false
    @Published var hasCaptionIcon: Bool = true
    @Published var enabled: Bool = true
    @Published var showHintTooltip: Bool = false

    init(theme: Theme = .sdddsServTheme, uiState: FormItemUiState = .init()) {
        super.init(
            variationProvider: FormItemVariationProvider(theme: theme),
            theme: theme
        )
        apply(uiState: uiState)
    }

    private func apply(uiState: FormItemUiState) {
        content = uiState.content
        title = uiState.title
        titleCaption = uiState.titleCaption
        caption = uiState.caption
        counter = uiState.counter
        optional = uiState.optional
        hasHint = uiState.hasHint
        hasCaptionIcon = uiState.hasCaptionIcon
        enabled = uiState.enabled
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
