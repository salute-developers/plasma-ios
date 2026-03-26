import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

final class SegmentItemViewModel: ComponentViewModel<SegmentItemVariationProvider> {
    @Published var title: String = "Title"
    @Published var subtitle: String = "Value"
    @Published var iconAttributes: ButtonIconAttributes? = nil
    @Published var isDisabled: Bool = false
    
    @Published var alignment: SDDSComponents.ButtonAlignment = .leading {
        didSet {
            guard let iconAttributes = iconAttributes else {
                return
            }
            self.iconAttributes = .init(image: iconAttributes.image, alignment: alignment)
        }
    }
    @Published var isCounterVisible: Bool = false
    @Published var isSelected: Bool = false
    @Published var iconVisible: Bool = false {
        didSet {
            if iconVisible {
                iconAttributes = .init(image: Asset.plasma24.image, alignment: alignment)
            } else {
                iconAttributes = nil
            }
        }
    }
    
    @Published var counterViewModel = CounterViewModel()
    
    init(theme: Theme = .sdddsServTheme, uiState: SegmentElementUiState = .init()) {
        super.init(variationProvider: SegmentItemVariationProvider(theme: theme), theme: theme)
        counterViewModel = CounterViewModel(theme: theme, componentViewLayoutMode: .subScreen)
        apply(uiState: uiState)
    }

    private func apply(uiState: SegmentElementUiState) {
        title = uiState.title
        subtitle = uiState.subtitle
        iconAttributes = uiState.iconAttributes
        isDisabled = uiState.isDisabled
        alignment = uiState.alignment
        isCounterVisible = uiState.isCounterVisible
        isSelected = uiState.isSelected
        iconVisible = uiState.iconVisible
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
    
    private func setIconAttributes(alignment: SDDSComponents.ButtonAlignment) {
        iconAttributes = iconAttributes(with: alignment)
    }
    
    private func iconAttributes(with alignment: SDDSComponents.ButtonAlignment) -> ButtonIconAttributes {
        .init(image: Asset.plasma24.image, alignment: alignment)
    }
}

#Preview {
    SegmentItemView()
}
