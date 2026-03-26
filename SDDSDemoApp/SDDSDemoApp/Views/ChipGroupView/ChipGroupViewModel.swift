import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

enum ChipGroupGapStyle: String, CaseIterable {
    case dense
    case wide
}

enum ChipGroupStyle: String, CaseIterable {
    case `default`
    case embedded
}

final class ChipGroupViewModel: ComponentViewModel<ChipGroupVariationProvider> {
    @Published var chips: [ChipData] = [] {
        didSet {
            guard chips.isEmpty else {
                return
            }
            self.selectVariation(variations.first)
        }
    }
    @Published var iconImageEnabled: Bool = true
    @Published var buttomImageEnabled: Bool = true
    @Published var gapStyle: ChipGroupGapStyle = .wide {
        didSet {
            variationProvider.gapStyle = gapStyle
            guard chips.isEmpty else {
                return
            }
            self.selectVariation(variations.first)
        }
    }
    @Published var chipGroupStyle: ChipGroupStyle = .default {
        didSet {
            variationProvider.chipGroupStyle = chipGroupStyle
            guard chips.isEmpty else {
                return
            }
            self.selectVariation(variations.first)
        }
    }
    @Published var value: String = "Value"
    
    init(theme: Theme = .sdddsServTheme, uiState: ChipGroupUiState = .init()) {
        super.init(
            variationProvider: ChipGroupVariationProvider(
                theme: theme,
                gapStyle: uiState.gapStyle,
                chipGroupStyle: uiState.chipGroupStyle
            ),
            theme: theme
        )
        apply(uiState: uiState)
    }

    private func apply(uiState: ChipGroupUiState) {
        if !uiState.chips.isEmpty {
            chips = uiState.chips
        }
        iconImageEnabled = uiState.iconImageEnabled
        buttomImageEnabled = uiState.buttomImageEnabled
        gapStyle = uiState.gapStyle
        chipGroupStyle = uiState.chipGroupStyle
        value = uiState.value
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
    
    func addChip() {
        let newChip = ChipData(
            title: value,
            isEnabled: true,
            iconImage: iconImageEnabled ? Asset.plasma24.image : nil,
            buttonImage: buttomImageEnabled ? Asset.close24.image : nil,
            appearance: appearance.chipAppearance,
            accessibility: ChipAccessibility(),
            removeAction: {}
        )
        chips.append(newChip)
    }
    
    func updateChipTitle(at index: Int, with newTitle: String) {
        guard chips.indices.contains(index) else { return }
        var updatedChip = chips[index]
        
        updatedChip = ChipData(
            title: newTitle,
            isEnabled: updatedChip.isEnabled,
            iconImage: updatedChip.iconImage,
            buttonImage: updatedChip.buttonImage,
            appearance: updatedChip.appearance,
            accessibility: updatedChip.accessibility,
            removeAction: updatedChip.removeAction
        )
        chips[index] = updatedChip
    }
    
    func removeChip(at index: Int) {
        guard chips.indices.contains(index) else { return }
        chips.remove(at: index)
    }
}
