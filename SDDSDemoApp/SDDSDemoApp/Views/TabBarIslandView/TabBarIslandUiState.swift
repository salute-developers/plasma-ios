import Foundation
import SDDSComponents

struct TabBarIslandUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var selectedIndex: Int = 0
    var tabBarIslandType: TabBarIslandType = .solid
    var extra: TabBarExtra = .none
    var countText: String = String(TabBarViewModel.defaultCount)
    var itemCount: Int = TabBarViewModel.defaultCount
    var customWidthEnabled: Bool = false
}
