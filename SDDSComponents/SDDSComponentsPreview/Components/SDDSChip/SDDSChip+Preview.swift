import Foundation
import SwiftUI
import SDDSComponents

extension SDDSChip {
    static var defaultExample: SDDSChip {
        SDDSChip(
            title: "Label",
            isEnabled: true,
            iconImage: Image.image("chipIcon"),
            buttonImage: Image.image("chipClose"),
            appearance: .default,
            size: SDDSChipSize.medium(.pilled),
            removeAction: {}
        )
    }
    
    static var defaultBorderExample: SDDSChip {
        SDDSChip(
            title: "Label",
            isEnabled: true,
            iconImage: Image.image("chipIcon"),
            buttonImage: Image.image("chipClose"),
            appearance: ChipAppearance.default,
            size: SDDSChipSize.medium(.pilled),
            removeAction: {}
        )
    }
    
    static var noButtonImageExample: SDDSChip {
        SDDSChip(
            title: "Label",
            isEnabled: true,
            iconImage: Image.image("chipIcon"),
            buttonImage: nil,
            appearance: ChipAppearance.default,
            size: SDDSChipSize.medium(.pilled),
            removeAction: {}
        )
    }
    
    static var noIconImageExample: SDDSChip {
        SDDSChip(
            title: "Label",
            isEnabled: true,
            iconImage: nil,
            buttonImage: Image.image("chipClose"),
            appearance: .default,
            size: SDDSChipSize.medium(.pilled),
            removeAction: {}
        )
    }
    
    static var onlyTitleExample: SDDSChip {
        SDDSChip(
            title: "Label",
            isEnabled: true,
            iconImage: nil,
            buttonImage: nil,
            appearance: .default,
            size: SDDSChipSize.medium(.pilled),
            removeAction: {}
        )
    }
}

// MARK: - Preview
struct SDDSChipPreview: PreviewProvider {
    static var previews: some View {
        Group {
            SDDSChip.defaultExample
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Default")
                .padding()
                .debug()
            
            SDDSChip.defaultBorderExample
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Default Border")
                .padding()
                .debug()
            
            SDDSChip.noButtonImageExample
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("No Button Image")
                .padding()
                .debug()
            
            SDDSChip.noIconImageExample
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("No Icon Image")
                .padding()
                .debug()
            
            SDDSChip.onlyTitleExample
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Only Title")
                .padding()
                .debug()
        }
    }
}
