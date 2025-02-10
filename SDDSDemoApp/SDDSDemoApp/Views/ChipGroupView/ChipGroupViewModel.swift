import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme

final class ChipGroupViewModel: ComponentViewModel<ChipGroupVariationProvider> {
    @Published var chips: [ChipData] = []
    @Published var iconImageEnabled: Bool = true
    @Published var buttomImageEnabled: Bool = true
    
    var chipViewModel = ChipViewModel()
    
    init() {
        super.init(variationProvider: ChipGroupVariationProvider())
    }
    
    func addChip() {
        let newChip = ChipData(
            title: chipViewModel.value,
            isEnabled: true,
            iconImage: iconImageEnabled ? Image.image("chipIcon") : nil,
            buttonImage: buttomImageEnabled ? Image.image("chipClose") : nil,
            appearance: chipViewModel.appearance,
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
