import Foundation
import SDDSComponents

struct ListUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var items: [ListItemData] = []
    var nextItemId: Int = 1
    var hasDivider: Bool = false
    var layout: ListItemLayout = .listItemNormal
}
