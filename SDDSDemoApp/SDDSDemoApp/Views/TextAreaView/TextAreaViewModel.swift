import SwiftUI
import Combine
import SDDSComponents

import SDDSServTheme

final class TextAreaViewModel: ObservableObject {
    @Published var value: TextAreaValue = .single("")
    @Published var textValue: String = ""
    @Published var title: String = "Title"
    @Published var optionalTitle: String = "Optional"
    @Published var placeholder: String = "Placeholder"
    @Published var caption: String = "Caption"
    @Published var counter: String = "Counter"
    @Published var disabled: Bool = false
    @Published var readOnly: Bool = false
    @Published var required: Bool = false
    @Published var iconActionViewEnabled: Bool = true
    @Published var dynamicHeight: Bool = true
    @Published var labelPlacement: TextAreaLabelPlacement = .outer
    @Published var requiredPlacement: TextAreaRequiredPlacement = .left
    @Published var layout: TextAreaLayout = .default
    @Published var size: TextAreaSizeConfiguration = TextAreaSize.medium
    @Published var sizeName: String = TextAreaSize.medium.rawValue {
        didSet {
            size = size(with: sizeName)
        }
    }
    @Published var appearance: TextAreaAppearance = TextArea.default.medium.appearance
    
    var allTextFieldAppearance: [AppearanceVariation<TextAreaAppearance>] {
        switch layout {
        case .default:
            TextArea.all.map { AppearanceVariation(name: $0.name, appearance: $0.appearance) }
        case .clear:
            TextAreaClear.all.map { AppearanceVariation(name: $0.name, appearance: $0.appearance) }
        }
    }
    
    var allSizeNames: [String] {
        switch layout {
        case .default:
            TextAreaSize.allCases.map { $0.rawValue }
        case .clear:
            TextAreaClearSize.allCases.map { $0.rawValue}
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
}

extension TextAreaViewModel {
    private func size(with name: String) -> TextAreaSizeConfiguration {
        switch layout {
        case .default:
            TextAreaSize(rawValue: name) ?? .medium
        case .clear:
            TextAreaClearSize(rawValue: name) ?? .medium
        }
    }
}

extension TextAreaViewModel: Equatable {
    static func == (lhs: TextAreaViewModel, rhs: TextAreaViewModel) -> Bool {
        return lhs.value == rhs.value &&
        lhs.textValue == rhs.textValue &&
        lhs.title == rhs.title &&
        lhs.optionalTitle == rhs.optionalTitle &&
        lhs.placeholder == rhs.placeholder &&
        lhs.caption == rhs.caption &&
        lhs.counter == rhs.counter &&
        lhs.disabled == rhs.disabled &&
        lhs.readOnly == rhs.readOnly &&
        lhs.required == rhs.required &&
        lhs.iconActionViewEnabled == rhs.iconActionViewEnabled &&
        lhs.labelPlacement == rhs.labelPlacement &&
        lhs.requiredPlacement == rhs.requiredPlacement &&
        lhs.layout == rhs.layout &&
        (lhs.size as? TextAreaSize) == (rhs.size as? TextAreaSize) &&
        (lhs.size as? TextAreaClearSize) == (rhs.size as? TextAreaClearSize) &&
        lhs.appearance == rhs.appearance &&
        lhs.chips == rhs.chips
    }
}
