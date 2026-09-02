import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSScrollBar_Simple: View {
    var body: some View {
        SDDSScrollbar(
            hasTrack: true,
            hoverExpand: true,
            thumbOffset: 0,
            thumbHeight: 100,
            trackHeight: 200,
            scrollBarPaddingBottom: 0,
            scrollBarPaddingTop: 0,
            direction: .vertical
        )
    }
}
