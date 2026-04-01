import SandboxCore
import SwiftUI

enum AvatarStory: Story {
    typealias State = AvatarUiState
    static let defaultState = AvatarUiState()

    static let id = "avatar.story"
    static let title = "Avatar"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: AvatarUiState, theme: Theme) -> some View {
        AvatarView(viewModel: AvatarViewModel(theme: theme, uiState: state))
    }
}
