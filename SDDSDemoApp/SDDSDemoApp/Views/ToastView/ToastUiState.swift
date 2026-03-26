import Foundation
import SDDSComponents

struct ToastUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var text: String = "Toast message"
    var contentStartEnabled: Bool = true
    var contentEndEnabled: Bool = true
    var position: ToastPosition = .topCenter
    var duration: TimeInterval = 3000
}
