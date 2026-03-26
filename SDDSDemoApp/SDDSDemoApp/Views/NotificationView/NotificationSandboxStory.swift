import SandboxCore
import SwiftUI

enum NotificationStory: Story {
    typealias State = NotificationUiState
    static let defaultState = NotificationUiState()

    static let id = "notification.story"
    static let title = "Notification"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: NotificationUiState, theme: Theme) -> some View {
        NotificationView(viewModel: NotificationViewModel(theme: theme, uiState: state))
    }
}
