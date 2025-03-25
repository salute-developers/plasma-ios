import Foundation
import SDDSComponents
import SDDSServTheme
import SwiftUI

// MARK: - Preview
struct SDDSRadioboxPreview: PreviewProvider {
    static var previews: some View {
        SDDSRadiobox(
            isSelected: .constant(true),
            title: "Value",
            subtitle: "Description",
            isEnabled: true,
            appearance: Radiobox.m.default.appearance
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Default")
    }
}
