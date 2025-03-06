import Foundation
import SDDSComponents
import SDDSServTheme
import SwiftUI

// MARK: - Preview
struct SDDSChipPreview: PreviewProvider {
    static var previews: some View {
        SDDSChip(
            title: "Label",
            isEnabled: true,
            iconImage: Image.image("chipIcon"),
            buttonImage: Image.image("chipClose"),
            appearance: Chip.m.pilled.accent.appearance,
            removeAction: {}
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Default")
    }
}
