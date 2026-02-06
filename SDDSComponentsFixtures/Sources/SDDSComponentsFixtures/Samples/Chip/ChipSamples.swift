import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSChip_Simple: View {
    var body: some View {
        SDDSChip(
            title: "Label",
            isEnabled: true,
            iconImage: nil,
            buttonImage: nil,
            appearance: Chip.m.default.appearance,
            removeAction: {}
        )
    }
}
