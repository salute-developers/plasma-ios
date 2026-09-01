import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSChipGroup_Simple: View {
    var body: some View {
        let chipData = [
            ChipData(
                title: "Label",
                isEnabled: true,
                iconImage: nil,
                buttonImage: nil,
                accessibility: ChipAccessibility(),
                removeAction: {}
            ),
            ChipData(
                title: "Label 2",
                isEnabled: true,
                iconImage: nil,
                buttonImage: nil,
                accessibility: ChipAccessibility(),
                removeAction: {}
            )
        ]
        return SDDSChipGroup(
            data: chipData,
            flat: false,
            height: .constant(0),
            gap: .dense
        )
    }
}
