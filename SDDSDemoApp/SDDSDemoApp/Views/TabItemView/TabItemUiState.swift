import Foundation
import SDDSComponents

struct TabItemUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var label: String = "Label"
    var value: String? = nil
    var hasValue: Bool = false
    var counterValue: Int? = nil
    var hasCounter: Bool = false
    var isSelected: Bool = false
    var isDisabled: Bool = false
    var orientation: TabsOrientation = .horizontal
    var hasStartContent: Bool = false
    var hasEndContent: Bool = false
    var tabItemType: SDDSTabItemType = .tabItemDefault
}
