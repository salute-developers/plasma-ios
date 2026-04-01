import Foundation
import SDDSComponents

struct NavigationBarUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var textPlacement: NavigationBarTextPlacement = .bottom
    var textAlign: NavigationBarTextAlign = .center
    var contentPlacement: NavigationBarContentPlacement = .bottom
    var showIcon: Bool = false
    var hasActionLeft: Bool = true
    var hasActionRight: Bool = true
    var titleText: String = "Text"
    var contentText: String = "Content"
    var pageType: NavigationBarPageType = .mainPage
}
