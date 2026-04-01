import SwiftUI
import Combine
import SDDSComponents
import SDDSThemeCore

final class TextFieldViewModel: ComponentViewModel<TextFieldVariationProvider> {
    @Published var value: TextFieldValue = .single("")
    @Published var textValue: String = ""
    @Published var title: String = "Title"
    @Published var optionalTitle: String = "Optional"
    @Published var placeholder: String = "Placeholder"
    @Published var caption: String = "Caption"
    @Published var textBefore: String = ""
    @Published var textAfter: String = ""
    @Published var disabled: Bool = false
    @Published var readOnly: Bool = false
    @Published var secureEntry: Bool = false
    @Published var keyboardType: UIKeyboardType = .default
    @Published var iconViewEnabled: Bool = true
    @Published var iconActionViewEnabled: Bool = true
    @Published var layout: TextFieldLayout = .default {
        didSet {
            variationProvider.layout = layout
            self.selectVariation(variations.first)
        }
    }
    
    init(theme: Theme = .sdddsServTheme, uiState: TextFieldUiState = .init()) {
        super.init(variationProvider: TextFieldVariationProvider(layout: uiState.layout, theme: theme), theme: theme)

        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
        apply(uiState: uiState)
    }

    private func apply(uiState: TextFieldUiState) {
        value = uiState.value
        textValue = uiState.textValue
        title = uiState.title
        optionalTitle = uiState.optionalTitle
        placeholder = uiState.placeholder
        caption = uiState.caption
        textBefore = uiState.textBefore
        textAfter = uiState.textAfter
        disabled = uiState.disabled
        readOnly = uiState.readOnly
        secureEntry = uiState.secureEntry
        keyboardType = uiState.keyboardType
        iconViewEnabled = uiState.iconViewEnabled
        iconActionViewEnabled = uiState.iconActionViewEnabled
        layout = uiState.layout
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
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
        let newChip = ChipData(
            title: "Chip \(chips.count + 1)",
            isEnabled: true,
            iconImage: nil,
            buttonImage: Image.image("textFieldChipIcon"),
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
        if chips.isEmpty {
            value = .single(textValue)
        }
    }
    
    override func onUpdateAppearance() {
        chips = []
        value = .single(textValue)
    }

}
