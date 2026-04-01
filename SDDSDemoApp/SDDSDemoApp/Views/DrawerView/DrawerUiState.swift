import Foundation
import SDDSComponents

struct DrawerUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var alignment: DrawerAlignment = .bottom
    var showHeader: Bool = false
    var showFooter: Bool = false
    var showOverlay: Bool = false
    var closePlacement: DrawerClosePlacement = .right
    var moveContentEnabled: Bool = false
    var peekOffsetEnabled: Bool = false
    var variationType: DrawerVariationType = .inner
}
