import Foundation

struct ScrollbarUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var hasTrack: Bool = true
    var hoverExpand: Bool = true
}
