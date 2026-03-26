import Foundation
import SDDSComponents

struct TabBarUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var selectedIndex: Int = 0
    var tabBarType: TabBarType = .solid
    var extra: TabBarExtra = .counter
    var countText: String = String(TabBarViewModel.defaultCount)
    var itemCount: Int = TabBarViewModel.defaultCount
    var customWidthEnabled: Bool = false
}
