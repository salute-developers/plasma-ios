import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

struct SDDSSegmentPreview: PreviewProvider {
    static var previews: some View {
        let ids = [UUID(), UUID(), UUID()]
        var selectedId = ids[0]
        
        func selectItem(_ id: UUID) {
            selectedId = id
        }
        
        let items = [
            SDDSSegmentItemData(
                id: ids[0],
                title: "T 1",
                subtitle: "S 1",
                iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
                appearance: SDDSSegmentItem.accent.medium.appearance,
                action: {
                    selectItem(ids[0])
                }
            ),
            SDDSSegmentItemData(
                id: ids[1],
                title: "T 2",
                subtitle: "S 2",
                iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
                appearance: SDDSSegmentItem.accent.medium.appearance,
                action: {
                    selectItem(ids[1])
                }
            )
            ,
            SDDSSegmentItemData(
                id: ids[2],
                title: "T 2",
                subtitle: "S 2",
                iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
                appearance: SDDSSegmentItem.accent.medium.appearance,
                action: {
                    selectItem(ids[2])
                }
            )
        ]

        return Group {
            SDDSSegment(
                items: items,
                appearance: Segment.m.default
                    .appearance,
                layoutOrientation: .vertical,
                selectedItemId: .constant(selectedId),
                isDisabled: false
            )
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Segment Item")
        }
    }
}
