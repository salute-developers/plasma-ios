import Foundation

struct PaginationDotsUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var totalCount: Int = 10
    var visibleCount: Int = 5
    var selectedIndex: Int = 0
    var step: Int = 1
}
