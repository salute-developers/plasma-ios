import SwiftUI
import SDDSComponents
import SDDSThemeCore

final class OverlayViewModel: ComponentViewModel<OverlayVariationProvider> {
    @Published var isPresent: Bool = false
    @Published var selectedItemId: UUID?
    @Published var hasBlur: Bool = true {
        didSet {
            if !hasBlur {
                appearance.blurRadius = 0
            } else {
                appearance.blurRadius = 16
            }
        }
    }
    @Published var hasBackgroundColor: Bool = true {
        didSet {
            switch hasBackgroundColor {
            case true:
                appearance.backgroundColor = .color(theme.overlayDefaultSoftColorToken)
            case false:
                appearance.backgroundColor = .color(.clearColor)
            }
        }
    }
    
    let ids =  [UUID(), UUID(), UUID(), UUID()]
    
    init(theme: Theme = .sdddsServTheme, uiState: OverlayUiState = .init()) {
        super.init(variationProvider: OverlayVariationProvider(theme: theme), theme: theme)
        apply(uiState: uiState)
    }

    private func apply(uiState: OverlayUiState) {
        isPresent = uiState.isPresent
        if let selectedItemId = uiState.selectedItemId {
            self.selectedItemId = selectedItemId
        } else {
            selectedItemId = ids[0]
        }
        hasBlur = uiState.hasBlur
        hasBackgroundColor = uiState.hasBackgroundColor
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
