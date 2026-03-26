import Foundation
import SDDSComponents

struct BottomSheetUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var isBottomSheetPresented: Bool = false
    var isFooterEnabled: Bool = true
    var isHeaderEnabled: Bool = true
    var isHeaderFixed: Bool = true
    var isFooterFixed: Bool = true
    var contentHeight: CGFloat = 0
    var detent: BottomSheetDetent?
}
