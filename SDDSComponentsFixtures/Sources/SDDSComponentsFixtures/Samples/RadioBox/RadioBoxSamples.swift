import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSRadiobox_Simple: View {
    @State private var isSelected = true

    var body: some View {
        SDDSRadiobox(
            isSelected: $isSelected,
            title: "Value",
            subtitle: "Description",
            isEnabled: true,
            appearance: Radiobox.m.appearance
        )
    }
}
