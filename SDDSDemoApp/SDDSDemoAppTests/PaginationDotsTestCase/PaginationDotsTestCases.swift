import SDDSComponents
import SwiftUI

struct PaginationDotsSnapshotCase: View {
    let appearance: PaginationDotsAppearance
    let selectedIndex: Int
    let totalCount: Int
    let visibleCount: Int
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
            SDDSPaginationDots(
                selectedIndex: selectedIndex,
                totalCount: totalCount,
                visibleCount: visibleCount,
                appearance: appearance
            )
        }
        .frame(width: 220, height: 220)
    }
}
