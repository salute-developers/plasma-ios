import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSCheckboxGroup_Simple: View {
    @State private var parentState: SelectionControlState = .deselected
    @State private var child1State: SelectionControlState = .deselected
    @State private var child2State: SelectionControlState = .deselected

    var body: some View {
        let parentData = CheckboxData(
            state: $parentState,
            title: "Parent Label",
            subtitle: "Parent Description",
            isEnabled: true,
            appearance: Checkbox.m.default.appearance,
            accessibility: SelectionControlAccessibility()
        )
        let childData = [
            CheckboxData(
                state: $child1State,
                title: "Label 1",
                subtitle: "Description 1",
                isEnabled: true,
                appearance: Checkbox.m.default.appearance,
                accessibility: SelectionControlAccessibility()
            ),
            CheckboxData(
                state: $child2State,
                title: "Label 2",
                subtitle: "Description 2",
                isEnabled: true,
                appearance: Checkbox.m.default.appearance,
                accessibility: SelectionControlAccessibility()
            )
        ]
        return SDDSCheckboxGroup(
            behaviour: .hierarchical(parent: parentData, child: childData),
            size: SDDSCheckboxGroupSize.large,
            appearance: CheckboxGroup.m.appearance
        )
    }
}
