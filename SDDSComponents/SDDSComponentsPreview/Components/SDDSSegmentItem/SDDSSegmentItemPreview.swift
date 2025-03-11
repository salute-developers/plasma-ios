import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

// MARK: - Preview
struct SDDSSegmentItemsPreview: PreviewProvider {
    static var counterViewProvider: ViewProvider {
        ViewProvider(
            SDDSCounter(
                text: "1",
                appearance: Counter.s.accent.appearance,
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
            appearance: SegmentItem.l.primary.appearance,
            action: {}
        )
        .previewLayout(.sizeThatFits)
        .previewDisplayName("Segment Item")
    }
}
