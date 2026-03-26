import Foundation
import SDDSComponents

struct BadgeUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var iconVisible: Bool = true
    var alignment: SDDSComponents.BadgeAlignment = .leading
    var label: String = "Label"
    var badgeType: BadgeType = .badge
}
