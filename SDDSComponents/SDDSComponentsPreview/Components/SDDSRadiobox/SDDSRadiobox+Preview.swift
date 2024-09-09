import Foundation
import SwiftUI
import SDDSComponents

// MARK: - Preview
struct SDDSRadioboxPreview: PreviewProvider {
    static var previews: some View {
        Group {
            SDDSRadiobox.defaultExample
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Default")
                .debug()
            
            SDDSRadiobox.withoutDescription
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Without Description")
                .debug()
            
            SDDSRadiobox.withoutLabel
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Without Label")
                .debug()
            
            SDDSRadiobox.withoutLabelAndDescription
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Without Label and Description")
                .debug()
        }
    }
}

public extension SDDSRadiobox {
    static var defaultExample: SDDSRadiobox {
        .init(
            isSelected: .constant(true),
            title: "Label",
            subtitle: "Description",
            isEnabled: true,
            images: .defaultImages, 
            size: SDDSRadioboxSize.medium,
            appearance: .default,
            accessibility: SelectionControlAccessibility()
        )
    }
    
    static var withoutDescription: SDDSRadiobox {
        .init(
            isSelected: .constant(true),
            title: "Label",
            subtitle: nil,
            isEnabled: true,
            images: .defaultImages,
            size: SDDSRadioboxSize.medium,
            appearance: .default,
            accessibility: SelectionControlAccessibility()
        )
    }
    
    static var withoutLabel: SDDSRadiobox {
        .init(
            isSelected: .constant(true),
            title: "",
            subtitle: "Description",
            isEnabled: true,
            images: .defaultImages, 
            size: SDDSRadioboxSize.medium,
            appearance: .default,
            accessibility: SelectionControlAccessibility()
        )
    }
    
    static var withoutLabelAndDescription: SDDSRadiobox {
        .init(
            isSelected: .constant(true),
            title: "",
            subtitle: nil,
            isEnabled: true,
            images: .defaultImages, 
            size: SDDSRadioboxSize.medium,
            appearance: .default,
            accessibility: SelectionControlAccessibility()
        )
    }
}
