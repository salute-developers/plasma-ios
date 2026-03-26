import SandboxCore
import SwiftUI

enum AvatarGroupStory: Story {
    typealias State = AvatarGroupUiState
    static let defaultState = AvatarGroupUiState()

    static let id = "avatarGroup.story"
    static let title = "AvatarGroup"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: AvatarGroupUiState, theme: Theme) -> some View {
        AvatarGroupView(viewModel: AvatarGroupViewModel(theme: theme, uiState: state))
    }
}
