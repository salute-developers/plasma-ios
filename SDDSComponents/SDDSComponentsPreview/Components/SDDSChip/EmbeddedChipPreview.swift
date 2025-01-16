import Foundation
import SDDSComponents
import SDDSServTheme
import SwiftUI

struct EmbeddedChipPreview: PreviewProvider {
    static var previews: some View {
        EmbeddedChip(
            title: "Label",
            isEnabled: true,
            iconImage: Image.image("chipIcon"),
            buttonImage: Image.image("chipClose"),
            appearance: EmbeddedChip.medium.secondary.appearance,
            removeAction: {}
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Default")
    }
}
