import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSRadioboxGroup_Simple: View {
    @State private var selectedIndex = 0

    var body: some View {
        let data = [
            RadioboxData(
                title: "Option 1",
                subtitle: "Description 1",
                isSelected: Binding(
                    get: { selectedIndex == 0 },
                    set: { if $0 { selectedIndex = 0 } }
                ),
                isEnabled: true,
                appearance: Radiobox.m.appearance,
                accessibility: SelectionControlAccessibility()
            ),
            RadioboxData(
                title: "Option 2",
                subtitle: "Description 2",
                isSelected: Binding(
                    get: { selectedIndex == 1 },
                    set: { if $0 { selectedIndex = 1 } }
                ),
                isEnabled: true,
                appearance: Radiobox.m.appearance,
                accessibility: SelectionControlAccessibility()
            )
        ]
        return SDDSRadioboxGroup(
            radioboxData: data,
            size: SDDSRadioboxGroupSize.large,
            appearance: RadioboxGroup.m.appearance
        )
    }
}
