import Foundation
import SDDSComponents

struct ListItemUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var label: String = "Label"
    var title: String = "Title"
    var subtitle: String = "Subtitle"
    var counterText: String = "1"
    var rightContentEnabled: Bool = true
    var disabled: Bool = false
    var layout: ListItemLayout = .listItemNormal
}
