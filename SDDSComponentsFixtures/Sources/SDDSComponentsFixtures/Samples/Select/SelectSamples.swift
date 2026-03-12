import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSSelect_SingleTextField: View {
    @State private var isDropdownPresented = false
    @State private var options: [SelectOption] = [
        SelectOption(title: "Moscow"),
        SelectOption(title: "Saint Petersburg"),
        SelectOption(title: "Kazan"),
        SelectOption(title: "Sochi")
    ]

    private var selectedTitle: String {
        options.first(where: \.isSelected)?.title ?? ""
    }

    var body: some View {
        SDDSSelect(
            triggerStyle: .textField,
            text: selectedTitle,
            title: "City",
            placeholder: "Select city",
            appearance: SelectSingleNormal.l.appearance,
            isDropdownPresented: $isDropdownPresented,
            options: options,
            selectionMode: .single,
            onOptionTap: { index in
                handleSingleSelection(at: index)
            }
        )
    }

    private func handleSingleSelection(at index: Int) {
        guard options.indices.contains(index) else { return }

        let tappedID = options[index].id
        let tappedWasSelected = options[index].isSelected

        options = options.map { option in
            let isSelected = tappedWasSelected ? false : (option.id == tappedID)
            return SelectOption(
                id: option.id,
                label: option.label,
                title: option.title,
                subtitle: option.subtitle,
                isSelected: isSelected,
                isEnabled: option.isEnabled
            )
        }
    }
}

// @DocSample
struct SDDSSelect_MultipleButton: View {
    @State private var isDropdownPresented = false
    @State private var options: [SelectOption] = [
        SelectOption(title: "Moscow"),
        SelectOption(title: "Saint Petersburg"),
        SelectOption(title: "Kazan"),
        SelectOption(title: "Sochi"),
        SelectOption(title: "Yekaterinburg"),
        SelectOption(title: "Kaliningrad")
    ]

    private var chips: [ChipData] {
        options
            .filter(\.isSelected)
            .map { option in
                ChipData(
                    title: option.title,
                    isEnabled: true,
                    iconImage: nil,
                    buttonImage: nil,
                    appearance: ChipAppearance(),
                    accessibility: ChipAccessibility(),
                    removeAction: {}
                )
            }
    }

    var body: some View {
        SDDSSelect(
            triggerStyle: .button,
            chips: chips,
            placeholder: "Select cities",
            appearance: SelectMultipleNormal.l.appearance,
            isDropdownPresented: $isDropdownPresented,
            options: options,
            selectionMode: .multiple,
            onOptionTap: { index in
                handleMultipleSelection(at: index)
            }
        )
        .frame(width: 280, alignment: .leading)
    }

    private func handleMultipleSelection(at index: Int) {
        guard options.indices.contains(index) else { return }

        let tappedID = options[index].id
        options = options.map { option in
            let shouldToggle = option.id == tappedID
            let isSelected = shouldToggle ? !option.isSelected : option.isSelected
            return SelectOption(
                id: option.id,
                label: option.label,
                title: option.title,
                subtitle: option.subtitle,
                isSelected: isSelected,
                isEnabled: option.isEnabled
            )
        }
    }
}
