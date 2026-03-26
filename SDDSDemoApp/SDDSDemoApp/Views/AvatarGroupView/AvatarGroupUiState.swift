import Foundation
import SDDSComponents

struct AvatarGroupUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var avatarData: [SDDSAvatarData] = []
    var lastAvatar: SDDSAvatarData = SDDSAvatarData()
    var maxDisplayingAvatarCount: Int = 3
    var borderWidth: CGFloat = 4
    var spacing: CGFloat = 15
}
