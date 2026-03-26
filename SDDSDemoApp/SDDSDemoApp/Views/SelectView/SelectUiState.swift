import Foundation
import SDDSComponents

struct SelectUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var triggerKind: SelectTriggerKind = .textField
    var triggerPosition: SelectTriggerPosition = .center
    var placement: PopoverPlacement = .bottom
    var alignment: PopoverAlignment = .start
    var placementMode: PopoverPlacementMode = .strict
    var layout: SelectDemoLayout = .normal
    var mode: SelectDemoMode = .single
    var disabled: Bool = false
    var readOnly: Bool = false
    var isDropdownPresented: Bool = false
    var isLoading: Bool = false
    var showEmptyState: Bool = false
    var showHeader: Bool = true
    var showFooter: Bool = false
    var options: [SelectOption] = []
    var selectedIDs: Set<UUID> = []
}
