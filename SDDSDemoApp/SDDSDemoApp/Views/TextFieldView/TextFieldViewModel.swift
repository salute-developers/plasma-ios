import SwiftUI
import Combine
import SDDSComponents
import SDDSComponentsPreview
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

    @Published var style: SDDSComponents.TextFieldStyle = .default
    @Published var labelPlacement: TextFieldLabelPlacement = .outer
    @Published var requiredPlacement: TextFieldRequiredPlacement = .left
    @Published var layout: TextFieldLayout = .default

    @Published var size: SDDSTextFieldSize = .medium
    @Published var appearance: TextFieldAppearance = .defaultAppearance

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
        let chipSize = mapTextFieldSizeToChipSize(size)
        let newChip = ChipData(
            title: "Chip \(chips.count + 1)",
            isEnabled: true,
            iconImage: nil,
            buttonImage: Image.image("textFieldChipIcon"),
            appearance: .textField.size(chipSize),
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

    private func mapTextFieldSizeToChipSize(_ textFieldSize: SDDSTextFieldSize) -> TextFieldChipSize {
        switch textFieldSize {
        case .large:
            return .large
        case .medium:
            return .medium
        case .small:
            return .small
        case .extraSmall:
            return .extraSmall
        }
    }
}

extension SDDSTextFieldSize: CaseIterable {
    public static var allCases: [SDDSTextFieldSize] {
        [.large, .medium, .small, .extraSmall]
    }
}

extension TextFieldAppearance: CaseIterable {
    public static var allCases: [TextFieldAppearance] {
        [.defaultAppearance]
    }

    public var name: String {
        return "Default"
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
        lhs.style == rhs.style &&
        lhs.labelPlacement == rhs.labelPlacement &&
        lhs.requiredPlacement == rhs.requiredPlacement &&
        lhs.layout == rhs.layout &&
        lhs.size == rhs.size &&
        lhs.appearance == rhs.appearance &&
        lhs.chips == rhs.chips
    }
}
