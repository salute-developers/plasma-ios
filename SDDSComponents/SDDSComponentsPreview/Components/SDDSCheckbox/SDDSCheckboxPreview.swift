import Foundation
import SDDSComponents
import SDDSServTheme
import SwiftUI

// MARK: - Preview
struct SDDSCheckboxPreview: PreviewProvider {
    static var previews: some View {
        SDDSCheckbox(
            state: .constant(.indeterminate),
            title: "Valur",
            subtitle: "Description",
            isEnabled: true,
            images: .checkbox,
            appearance: Checkbox.m.default.appearance
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Default")
    }
}
