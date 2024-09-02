import Foundation
import SDDSComponents
import SwiftUI

// MARK: - Preview
struct SDDSCheckboxPreview: PreviewProvider {
    static var previews: some View {
        Group {
            SDDSCheckbox.defaultExample
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Default")
                .debug()
            
            SDDSCheckbox.withoutDescription
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Without Description")
                .debug()
            
            SDDSCheckbox.withoutLabel
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Without Label")
                .debug()
            
            SDDSCheckbox.withoutLabelAndDescription
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Without Label and Description")
                .debug()
        }
    }
}

extension SDDSCheckbox {
    static var defaultExample: SDDSCheckbox {
        .init(
            state: .constant(.selected),
            title: "Label",
            subtitle: "Description",
            isEnabled: true,
            images: .checkbox, 
            size: SDDSCheckboxSize.medium,
            appearance: .default,
            accessibility: SelectionControlAccessibility()
        )
    }
    
    static var withoutDescription: SDDSCheckbox {
        .init(
            state: .constant(.selected),
            title: "Label",
            subtitle: nil,
            isEnabled: true,
            images: .checkbox, 
            size: SDDSCheckboxSize.medium,
            appearance: .default,
            accessibility: SelectionControlAccessibility()
        )
    }
    
    static var withoutLabel: SDDSCheckbox {
        .init(
            state: .constant(.selected),
            title: "",
            subtitle: "Description",
            isEnabled: true,
            images: .checkbox, 
            size: SDDSCheckboxSize.medium,
            appearance: .default,
            accessibility: SelectionControlAccessibility()
        )
    }
    
    static var withoutLabelAndDescription: SDDSCheckbox {
        .init(
            state: .constant(.selected),
            title: "",
            subtitle: nil,
            isEnabled: true,
            images: .checkbox, 
            size: SDDSCheckboxSize.medium,
            appearance: .default,
            accessibility: SelectionControlAccessibility()
        )
    }
}
