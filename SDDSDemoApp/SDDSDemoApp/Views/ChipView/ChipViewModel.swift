import SwiftUI
import Combine
import SDDSComponents
import SDDSIcons

final class ChipViewModel: ComponentViewModel<ChipVariationProvider> {
    @Published var value: String = "Value"
    @Published var isEnabled: Bool = true
    @Published var iconImageEnabled: Bool = true
    @Published var buttomImageEnabled: Bool = true
    @Published var iconImage: Image? = nil
    @Published var buttonImage: Image? = nil
    
    init(theme: Theme = .sdddsServTheme, uiState: ChipUiState = .init()) {
        super.init(variationProvider: ChipVariationProvider(theme: theme), theme: theme)
        apply(uiState: uiState)
    }

    private func apply(uiState: ChipUiState) {
        value = uiState.value
        isEnabled = uiState.isEnabled
        iconImageEnabled = uiState.iconImageEnabled
        buttomImageEnabled = uiState.buttomImageEnabled
        if iconImageEnabled {
            setIconImage()
        } else {
            iconImage = nil
        }
        if buttomImageEnabled {
            setButtonImage()
        } else {
            buttonImage = nil
        }
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }

    var removeAction: () -> Void {
        { print("Chip removed") }
    }
    
    func setIconImage() {
        iconImage = Asset.plasma24.image
    }
    
    func setButtonImage() {
        buttonImage = Asset.close24.image
    }
}
