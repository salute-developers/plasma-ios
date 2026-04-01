import Foundation
import SDDSComponents

struct NotificationUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var text: String = "Notification"
    var position: ToastPosition = .topCenter
    var hasClose: Bool = true
    var layout: NotificationLayout = .compact
}
