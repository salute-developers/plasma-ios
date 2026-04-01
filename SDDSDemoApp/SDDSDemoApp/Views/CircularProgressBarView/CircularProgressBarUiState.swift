import Foundation

struct CircularProgressBarUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var progress: Double = 0.5
    var valueEnabled: Bool = true
    var hasTrack: Bool = true
    var customContent: Bool = false
}
