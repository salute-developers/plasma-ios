import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSSegment_Simple: View {
    @State private var itemId = UUID()
    @State private var selectedId: UUID?

    var body: some View {
        let item = SDDSSegmentItemData<AnyView>(
            id: itemId,
            title: "Title",
            subtitle: "Subtitle",
            iconAttributes: nil,
            isSelected: true,
            appearance: SegmentItem.l.accent.appearance,
            counter: { AnyView(EmptyView()) },
            action: {}
        )
        let items: [SDDSSegmentItemData<AnyView>] = [item]
        return SDDSSegment(
            items: items,
            appearance: Segment.m.appearance,
            layoutMode: .flexible,
            layoutOrientation: .horizontal,
            selectedItemId: $selectedId,
            hasBackground: true
        )
        .onAppear { if selectedId == nil { selectedId = itemId } }
    }
}
