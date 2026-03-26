import Foundation
import SDDSComponents
import SDDSThemeCore

final class TooltipViewModel: ComponentViewModel<TooltipVariationProvider> {
    @Published var placement: PopoverPlacement = .top
    @Published var alignment: PopoverAlignment = .center
    @Published var tailEnabled: Bool = true
    @Published var autoHide: Bool = true
    @Published var contentStartEnabled: Bool = true
    @Published var triggerCentered: Bool = false
    @Published var placementMode: PopoverPlacementMode = .strict
    @Published var buttonPosition: PopoverButtonPosition = .center
    @Published var duration: Int? = nil
    @Published var text: String = "Tooltip text"
    
    init(theme: Theme = .sdddsServTheme, uiState: TooltipUiState = .init()) {
        super.init(variationProvider: TooltipVariationProvider(theme: theme), theme: theme)
        apply(uiState: uiState)
    }

    private func apply(uiState: TooltipUiState) {
        placement = uiState.placement
        alignment = uiState.alignment
        tailEnabled = uiState.tailEnabled
        autoHide = uiState.autoHide
        contentStartEnabled = uiState.contentStartEnabled
        triggerCentered = uiState.triggerCentered
        placementMode = uiState.placementMode
        buttonPosition = uiState.buttonPosition
        duration = uiState.duration
        text = uiState.text
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
