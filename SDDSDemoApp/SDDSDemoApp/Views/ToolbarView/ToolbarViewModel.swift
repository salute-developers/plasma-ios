import Foundation
import SwiftUI
import SDDSComponents
import SDDSIcons
import SDDSThemeCore

final class ToolbarViewModel: ComponentViewModel<ToolbarVariationProvider> {
    @Published var toolbarType: ToolbarType = .horizontal {
        didSet {
            variationProvider.toolbarType = toolbarType
            selectVariation(variations.first)
        }
    }
    
    @Published var hasDivider: Bool = true
    @Published var slotsAmount: Int = 3 {
        didSet {
            if slotsAmount < 0 {
                slotsAmount = 0
            }
            if slotsAmount > 10 {
                slotsAmount = 10
            }
        }
    }
    
    var slots: [ToolbarSlotData] {
        (0..<slotsAmount).map { index in
            let isFirst = index == 0
            let isLast = index == slotsAmount - 1
            if isFirst || isLast {
                return ToolbarSlotData(
                    views: [
                        AnyView(
                            IconButton(
                                iconAttributes: ButtonIconAttributes(image: Asset.plasma24.image, alignment: .leading),
                                appearance: theme.iconButtonVariations.first?.styles.first?.appearance ?? theme.iconButtonVariations.first?.appearance,
                                action: {}
                            )
                        ),
                        AnyView(
                            IconButton(
                                iconAttributes: ButtonIconAttributes(image: Asset.plasma24.image, alignment: .leading),
                                appearance: theme.iconButtonVariations.first?.styles.first?.appearance ?? theme.iconButtonVariations.first?.appearance,
                                action: {}
                            )
                        )
                    ]
                )
            } else {
                return ToolbarSlotData(
                    views: [
                        AnyView(
                            BasicButton(
                                title: "Label",
                                subtitle: "",
                                action: {}
                            )
                        )
                    ]
                )
            }
        }
    }
    
    init(theme: Theme = .sdddsServTheme, uiState: ToolbarUiState = .init()) {
        super.init(
            variationProvider: ToolbarVariationProvider(theme: theme, toolbarType: uiState.toolbarType),
            theme: theme
        )

        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
        apply(uiState: uiState)
    }

    private func apply(uiState: ToolbarUiState) {
        toolbarType = uiState.toolbarType
        hasDivider = uiState.hasDivider
        slotsAmount = uiState.slotsAmount
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
