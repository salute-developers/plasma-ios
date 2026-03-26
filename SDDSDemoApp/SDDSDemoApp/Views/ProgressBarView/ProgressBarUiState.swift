import Foundation

struct ProgressBarUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var progress: Double = 0.5
    var progressString: String = "50"
    var isEnabled: Bool = true
}
