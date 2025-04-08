import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme

final class TextAreaViewModel: ComponentViewModel<TextAreaVariationProvider> {
    @Published var value: TextAreaValue = .single("")
    @Published var textValue: String = ""
    @Published var title: String = "Title"
    @Published var optionalTitle: String = "Optional"
    @Published var placeholder: String = "Placeholder"
    @Published var caption: String = "Caption"
    @Published var counter: String = "Counter"
    @Published var disabled: Bool = false
    @Published var readOnly: Bool = false
    @Published var iconActionViewEnabled: Bool = true
    @Published var heightMode: TextAreaHeightMode = .dynamic
    @Published var layout: TextAreaLayout = .default {
        didSet {
            variationProvider.layout = layout
            self.selectVariation(variations.first)
        }
    }
    
    init() {
        super.init(variationProvider: TextAreaVariationProvider(layout: .default))
        
        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
    }
    
    var isDynamicHeight: Bool {
        switch heightMode {
        case .fixed(let cGFloat):
            return false
        case .dynamic:
            return true
        }
    }

    var chips: [ChipData] {
        get {
            if case let .multiple(_, chips) = value {
                return chips
            }
            return []
        }
        set {
            value = .multiple(textValue, newValue)
        }
    }

    func updateValueText(_ newText: String) {
        if chips.isEmpty {
            value = .single(newText)
        } else {
            value = .multiple(newText, chips)
        }
    }

    func addChip() {
        let id = UUID()
        let newChip = ChipData(
            id: id,
            title: "Chip \( chips.count + 1)",
            isEnabled: true,
            iconImage: nil,
            buttonImage: Image.image("textFieldChipIcon"),
            accessibility: ChipAccessibility(),
            removeAction: { [weak self] in
                self?.removeChip(with: id)
            }
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
            accessibility: updatedChip.accessibility,
            removeAction: updatedChip.removeAction
        )
        chips[index] = updatedChip
    }

    func removeChip(at index: Int) {
        guard chips.indices.contains(index) else { return }
        chips.remove(at: index)
        if chips.isEmpty {
            value = .single(textValue)
        }
    }
    
    func removeChip(with id: UUID) {
        chips = chips.filter { $0.id != id }
        if chips.isEmpty {
            value = .single(textValue)
        }
    }
    
    override func onUpdateAppearance() {
        chips = []
        value = .single(textValue)
    }
    
}
