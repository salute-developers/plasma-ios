import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSCheckbox_Simple: View {
    @State private var state: SelectionControlState = .selected

    var body: some View {
        SDDSCheckbox(
            state: $state,
            title: "Value",
            subtitle: "Description",
            isEnabled: true,
            appearance: Checkbox.m.default.appearance
        )
    }
}
