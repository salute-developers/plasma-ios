import Foundation
import Combine
import SwiftUI
import SDDSComponents
import SDDSIcons

final class ButtonViewModel: ComponentViewModel<ButtonVariationProvider> {
    @Published var iconVisible: Bool = false {
        didSet {
            if iconVisible {
                iconAttributes = .init(image: Asset.plasma24.image, alignment: alignment)
            } else {
                iconAttributes = nil
            }
        }
    }
    @Published var alignment: SDDSComponents.ButtonAlignment = .leading {
        didSet {
            guard let iconAttributes = iconAttributes else {
                return
            }
            self.iconAttributes = .init(image: iconAttributes.image, alignment: alignment)
        }
    }
    @Published var label: String = "Label"
    @Published var value: String = "Value"
    @Published var iconAttributes: ButtonIconAttributes? = nil
    @Published var isDisabled: Bool = false
    @Published var isLoading: Bool = false
    @Published var spinnerImage: Image = Image("spinner")
    @Published var buttonStyle: SDDSComponents.ButtonStyle = .basic
    @Published var layoutMode: ButtonLayoutMode = .wrapContent
    @Published var buttonType: SDDSButtonType = .basic {
        didSet {
            self.variationProvider.buttonType = buttonType
            self.selectVariation(variations.first)
        }
    }
    
    private func setIconAttributes(alignment: SDDSComponents.ButtonAlignment) {
        iconAttributes = iconAttributes(with: alignment)
    }
    
    private func iconAttributes(with alignment: SDDSComponents.ButtonAlignment) -> ButtonIconAttributes {
        .init(image: Asset.plasma24.image, alignment: alignment)
    }
    
    init(theme: Theme = .sdddsServTheme, uiState: ButtonUiState = .init()) {
        super.init(
            variationProvider: ButtonVariationProvider(buttonType: uiState.buttonType, theme: theme),
            theme: theme
        )

        apply(uiState: uiState)
    }

    private func apply(uiState: ButtonUiState) {
        buttonType = uiState.buttonType
        label = uiState.label
        value = uiState.value
        alignment = uiState.alignment
        layoutMode = uiState.layoutMode
        isDisabled = uiState.isDisabled
        isLoading = uiState.isLoading
        iconVisible = uiState.iconVisible

        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
