import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

// MARK: - Preview
struct SDDSSegmentItemsPreview: PreviewProvider {
    static var counterAppearance: CounterAppearance {
        SDDSCounter.accent.small.appearance
    }
    
    static var counterViewProvider: ViewProvider {
        ViewProvider(
            SDDSCounter(
                text: "1",
                appearance: counterAppearance,
                isAnimating: false,
                isHighlighted: false,
                isHovered: false
            )
        )
    }
    
    static var previews: some View {
        SDDSSegmentItem(
            title: "Value",
            subtitle: "Subtitle",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isSelected: true, 
            appearance: SDDSSegmentItem.large.primary.appearance,
            counterAppearance: nil,
            action: {}
        )
        .previewLayout(.sizeThatFits)
        .previewDisplayName("Segment Item")
    }
}
