import Foundation
import SDDSComponents

struct PopoverUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var placement: PopoverPlacement = .top
    var alignment: PopoverAlignment = .center
    var tailEnabled: Bool = true
    var autoHide: Bool = true
    var triggerCentered: Bool = false
    var placementMode: PopoverPlacementMode = .strict
    var buttonPosition: PopoverButtonPosition = .center
    var duration: Int? = nil
}
