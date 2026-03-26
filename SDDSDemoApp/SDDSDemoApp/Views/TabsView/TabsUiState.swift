import Foundation
import SDDSComponents

struct TabsUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var tabsType: SDDSTabsType = .tabsDefault
    var tabItemType: TabsViewModel.TabItemType = .default
    var selectedId: String = "tab1"
    var numberOfTabs: Int = 3
    var showAllText: String = "Show All"
    var dropdownMaxHeight: CGFloat = 186
    var clipModeType: TabsViewModel.ClipModeType = .none
    var stretch: Bool = true
    var hasDivider: Bool = true
    var label: String = "Label"
    var value: String? = nil
    var hasValue: Bool = false
    var counterValue: Int? = nil
    var hasCounter: Bool = false
    var hasStartContentIcon: Bool = false
    var hasEndContentIcon: Bool = false
    var hasAction: Bool = false
    var isDisabled: Bool = false
}
