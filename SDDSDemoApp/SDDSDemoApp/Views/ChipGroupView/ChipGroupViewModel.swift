import SwiftUI
import SDDSComponents
import SDDSservTheme

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
    
    init() {
        super.init(variationProvider: ChipGroupVariationProvider(gapStyle: .dense, chipGroupStyle: .default))
    }
    
    func addChip() {
        let newChip = ChipData(
            title: value,
            isEnabled: true,
            iconImage: iconImageEnabled ? Image.image("chipIcon") : nil,
            buttonImage: buttomImageEnabled ? Image.image("chipClose") : nil,
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
