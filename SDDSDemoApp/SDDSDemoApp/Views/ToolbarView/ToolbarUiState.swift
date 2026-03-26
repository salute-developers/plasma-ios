import Foundation
import SDDSComponents

struct ToolbarUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var toolbarType: ToolbarType = .horizontal
    var hasDivider: Bool = true
    var slotsAmount: Int = 3
}
