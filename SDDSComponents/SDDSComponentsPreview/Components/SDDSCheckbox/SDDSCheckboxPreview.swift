import Foundation
import SDDSComponents
import SDDSServTheme
import SwiftUI

// MARK: - Preview
struct SDDSCheckboxPreview: PreviewProvider {    
    static var previews: some View {
        SDDSCheckbox(
            state: .constant(.deselected),
            title: "Value",
            subtitle: "Description",
            isEnabled: true,
            appearance: Checkbox.l.default.appearance
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Default")
    }
}
