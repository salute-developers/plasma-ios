import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSPaginationDots_Simple: View {
    var body: some View {
        SDDSPaginationDots(
            selectedIndex: 2,
            totalCount: 8,
            visibleCount: 5,
            appearance: PaginationDotsHorizontal.m.appearance
        )
    }
}
