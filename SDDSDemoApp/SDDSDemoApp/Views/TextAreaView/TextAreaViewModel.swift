import SwiftUI
import Combine
import SDDSComponents
import SDDSComponentsPreview
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
    @Published var dynamicHeight: Bool = false

    @Published var style: SDDSComponents.TextAreaStyle = .default
    @Published var labelPlacement: TextAreaLabelPlacement = .outer
    @Published var requiredPlacement: TextAreaRequiredPlacement = .left
    @Published var layout: TextAreaLayout = .default

    @Published var size: SDDSTextAreaSize = .medium
    @Published var appearance: TextAreaAppearance = .defaultAppearance

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
        let chipSize = mapTextAreaSizeToChipSize(size)
        let id = UUID()
        let newChip = ChipData(
            id: id,
            title: "Chip \( chips.count + 1)",
            isEnabled: true,
            iconImage: nil,
            buttonImage: Image.image("textFieldChipIcon"),
            appearance: .textField,
            size: chipSize,
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
            appearance: updatedChip.appearance,
            size: updatedChip.size,
            accessibility: updatedChip.accessibility,
            removeAction: updatedChip.removeAction
        )
        chips[index] = updatedChip
    }
    
    func updateChipSize(with size: SDDSTextAreaSize) {
        guard !chips.isEmpty else {
            return
        }
        let chipSize = mapTextAreaSizeToChipSize(size)
        chips = chips.map { chip in
            ChipData(
                id: chip.id,
                title: chip.title,
                isEnabled: chip.isEnabled,
                iconImage: chip.iconImage,
                buttonImage: chip.buttonImage,
                appearance: chip.appearance,
                size: chipSize,
                accessibility: chip.accessibility,
                removeAction: chip.removeAction
            )
        }
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

    private func mapTextAreaSizeToChipSize(_ textFieldSize: SDDSTextAreaSize) -> TextAreaChipSize {
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

extension SDDSTextAreaSize: CaseIterable {
    public static var allCases: [SDDSTextAreaSize] {
        [.large, .medium, .small, .extraSmall]
    }
}

extension TextAreaAppearance: CaseIterable {
    public static var allCases: [TextAreaAppearance] {
        [.defaultAppearance]
    }

    public var name: String {
        return "Default"
    }
}
