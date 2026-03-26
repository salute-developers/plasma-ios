import Foundation
import SwiftUI
import SDDSComponents

struct AvatarUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var text: String = "AB"
    var image: AvatarImageSource? = nil
    var placeholderImage: AvatarImageSource? = nil
    var status: AvatarStatus = .online
    var extraPlacement: AvatarExtraPlacement = .none
    var accessibility: AvatarAccessibility = AvatarAccessibility()
    var isPlaceholder: Bool = false
    var isBadgeEnabled: Bool = false
    var isCounterEnabled: Bool = false
    var badgeViewModel: BadgeViewModel = BadgeViewModel(componentViewLayoutMode: .subScreen)
    var counterViewModel: CounterViewModel = CounterViewModel(componentViewLayoutMode: .subScreen)
}
