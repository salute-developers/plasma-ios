import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme

final class ChipGroupViewModel: ObservableObject {
    @Published var chipTitle: String = ""
    @Published var chipSize: SDDSChipSize = .medium
    @Published var chips: [ChipData] = []
    @Published var appearance: ChipAppearance = SDDSChip.default.appearance {
        didSet {
            updateChips(appearance: appearance, size: chipSize)
        }
    }
    @Published var chipGroupAppearance: ChipGroupAppearance = SDDSChipGroup.dense.appearance
    @Published var chipGroupVariationName: String = SDDSChipGroup.dense.name
    @Published var chipVariationName: String = SDDSChip.default.name
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        observeSizeChange()
    }
    
    private func observeSizeChange() {
        $chipSize
            .sink { [weak self] value in
                self?.updateChips(size: value)
            }
            .store(in: &cancellables)
    }
    
    private func updateChips(size: SDDSChipSize) {
        chips = chips.map { chip in
            ChipData(
                title: chip.title,
                isEnabled: chip.isEnabled,
                iconImage: chip.iconImage,
                buttonImage: chip.buttonImage,
                appearance: chip.appearance.size(size),
                accessibility: chip.accessibility,
                removeAction: chip.removeAction
            )
        }
    }
    
    private func updateChips(appearance: ChipAppearance, size: SDDSChipSize) {
        chips = chips.map { chip in
            ChipData(
                title: chip.title,
                isEnabled: chip.isEnabled,
                iconImage: chip.iconImage,
                buttonImage: chip.buttonImage,
                appearance: appearance.size(size),
                accessibility: chip.accessibility,
                removeAction: chip.removeAction
            )
        }
    }
    
    func addChip() {
        let newChip = ChipData(
            title: chipTitle,
            isEnabled: true,
            iconImage: Image.image("chipIcon"),
            buttonImage: Image.image("chipClose"),
            appearance: appearance.size(chipSize),
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
            appearance: updatedChip.appearance.size(updatedChip.appearance.size),
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
