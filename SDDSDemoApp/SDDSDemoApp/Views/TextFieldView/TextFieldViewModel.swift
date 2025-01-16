import SwiftUI
import Combine
import SDDSComponents

import SDDSServTheme

final class TextFieldViewModel: ObservableObject {
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
    @Published var required: Bool = false
    @Published var iconViewEnabled: Bool = true
    @Published var iconActionViewEnabled: Bool = true

    @Published var labelPlacement: TextFieldLabelPlacement = .outer
    @Published var requiredPlacement: TextFieldRequiredPlacement = .left
    @Published var layout: TextFieldLayout = .default {
        didSet {
            resetAppearance()
        }
    }
    @Published var size: TextFieldSizeConfiguration = TextFieldSize.medium
    @Published var sizeName: String = TextFieldSize.medium.rawValue {
        didSet {
            size = size(with: sizeName)
        }
    }
    @Published var variation: AppearanceVariation<TextFieldAppearance>!
    
    init() {
        self.resetAppearance()
    }
    
    var appearance: TextFieldAppearance {
        return variation.appearance.size(size)
    }
    
    var allTextFieldAppearance: [AppearanceVariation<TextFieldAppearance>] {
        switch layout {
        case .default:
            let size = TextFieldSize(rawValue: sizeName) ?? .medium
            return SDDSComponents.TextField.all.map {
                AppearanceVariation(name: $0.name, appearance: $0.size(size).appearance)
            }
        case .clear:
            let size = TextFieldClearSize(rawValue: sizeName) ?? .medium
            return TextFieldClear.all.map {
                AppearanceVariation(name: $0.name, appearance: $0.size(size).appearance)
            }
        }
    }
    
    var allSizeNames: [String] {
        switch layout {
        case .default:
            TextFieldSize.allCases.map { $0.rawValue }
        case .clear:
            TextFieldClearSize.allCases.map { $0.rawValue}
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
            appearance: updatedChip.appearance.size(updatedChip.appearance.size),
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
    
    private func resetAppearance() {
        variation = allTextFieldAppearance.first
        sizeName = TextFieldSize.medium.rawValue
    }
}

extension TextFieldViewModel {
    private func size(with name: String) -> TextFieldSizeConfiguration {
        switch layout {
        case .default:
            TextFieldSize(rawValue: name) ?? .medium
        case .clear:
            TextFieldClearSize(rawValue: name) ?? .medium
        }
    }
}

extension TextFieldViewModel: Equatable {
    static func == (lhs: TextFieldViewModel, rhs: TextFieldViewModel) -> Bool {
        return lhs.value == rhs.value &&
        lhs.textValue == rhs.textValue &&
        lhs.title == rhs.title &&
        lhs.optionalTitle == rhs.optionalTitle &&
        lhs.placeholder == rhs.placeholder &&
        lhs.caption == rhs.caption &&
        lhs.textBefore == rhs.textBefore &&
        lhs.textAfter == rhs.textAfter &&
        lhs.disabled == rhs.disabled &&
        lhs.readOnly == rhs.readOnly &&
        lhs.required == rhs.required &&
        lhs.iconViewEnabled == rhs.iconViewEnabled &&
        lhs.iconActionViewEnabled == rhs.iconActionViewEnabled &&
        lhs.labelPlacement == rhs.labelPlacement &&
        lhs.requiredPlacement == rhs.requiredPlacement &&
        lhs.layout == rhs.layout &&
        (lhs.size as? TextFieldSize) == (rhs.size as? TextFieldSize) &&
        (lhs.size as? TextFieldClearSize) == (rhs.size as? TextFieldClearSize) &&
        lhs.variation == rhs.variation &&
        lhs.chips == rhs.chips
    }
}
