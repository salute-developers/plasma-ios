import Foundation
import SDDSComponents
import SwiftUI

// MARK: - Preview
struct SDDSSwitchPreview: PreviewProvider {
    static var previews: some View {
        SDDSSwitch.defaultExample
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default")
            .debug()
        
        SDDSSwitch.emptyDescription
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Empty Description")
            .debug()
        
        SDDSSwitch.emptyTitle
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Empty Title")
            .debug()
        
        SDDSSwitch.onlyToggle
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Only Toggle")
            .debug()
    }
}

extension SDDSSwitch {
    static var defaultExample: SDDSSwitch {
        SDDSSwitch(
            title: "Title",
            subtitle: "Description",
            isOn: .constant(true),
            isEnabled: true,
            size: SDDSSwitchSize.medium,
            appearance: SwitchAppearance.defaultAppearance,
            switchAccessibility: SwitchAccessibility()
        )
    }
    
    static var emptyDescription: SDDSSwitch {
        SDDSSwitch(
            title: "Title",
            subtitle: "",
            isOn: .constant(true),
            isEnabled: true,
            size: SDDSSwitchSize.medium,
            appearance: SwitchAppearance.defaultAppearance,
            switchAccessibility: SwitchAccessibility()
        )
    }
    
    static var emptyTitle: SDDSSwitch {
        SDDSSwitch(
            title: "",
            subtitle: "Description",
            isOn: .constant(true),
            isEnabled: true,
            size: SDDSSwitchSize.medium,
            appearance: SwitchAppearance.defaultAppearance,
            switchAccessibility: SwitchAccessibility()
        )
    }
    
    static var onlyToggle: SDDSSwitch {
        SDDSSwitch(
            title: "",
            subtitle: "",
            isOn: .constant(true),
            isEnabled: true,
            size: SDDSSwitchSize.medium,
            appearance: SwitchAppearance.defaultAppearance,
            switchAccessibility: SwitchAccessibility()
        )
    }
}
