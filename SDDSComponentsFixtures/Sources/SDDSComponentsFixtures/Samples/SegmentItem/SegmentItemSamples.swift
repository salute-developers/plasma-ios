import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSSegmentItem_Simple: View {
    var body: some View {
        SDDSSegmentItem(
            title: "Title",
            subtitle: "Subtitle",
            iconAttributes: nil,
            isSelected: true,
            appearance: SegmentItem.l.secondary.appearance,
            accessibility: SegmentItemAccessibility(),
            action: {}
        )
    }
}
