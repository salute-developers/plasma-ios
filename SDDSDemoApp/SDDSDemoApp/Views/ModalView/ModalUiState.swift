import Foundation

struct ModalUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var hasClose: Bool = true
    var useNativeBlackout: Bool = false
}
