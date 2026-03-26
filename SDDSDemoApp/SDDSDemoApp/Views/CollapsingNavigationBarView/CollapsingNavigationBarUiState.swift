import Foundation
import SDDSComponents
#if canImport(PlasmaHomeDSTheme)
import PlasmaHomeDSTheme
#endif

struct CollapsingNavigationBarUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var collapsedTitle: String = "Title"
    var expandedTitle: String = "Title"
    var collapsedDescription: String = "Description"
    var expandedDescription: String = "Description"
    var contentText: String = "Content"
    var hasActionStart: Bool = true
    var hasActionEnd: Bool = true
    var collapsedTextAlign: NavigationBarTextAlign = .center
    var expandedTextAlign: NavigationBarTextAlign = .left
    var centerAlignmentStrategy: CollapsingNavigationBarCenterAlignmentStrategy = .relative
    var pageType: CollapsingNavigationBarPageType = .mainPage
}
