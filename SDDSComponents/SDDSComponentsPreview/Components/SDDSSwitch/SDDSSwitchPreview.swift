import Foundation
import SDDSComponents
import SDDSServTheme
import SwiftUI

// MARK: - Preview
struct SDDSSwitchPreview: PreviewProvider {
    static var previews: some View {
        SDDSSwitch(
            title: "Label",
            subtitle: "Description",
            isOn: .constant(true),
            isEnabled: true,
            appearance: Switch.l.default.appearance, 
            switchAccessibility: SwitchAccessibility()
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Default")
    }
}
