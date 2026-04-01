import Foundation
import SDDSComponents

struct DropDownMenuUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var placement: PopoverPlacement = .top
    var alignment: PopoverAlignment = .center
    var autoHide: Bool = true
    var buttonPosition: DropdownMenuButtonPosition = .center
    var duration: Int? = nil
    var textInput: String = "10"
    var itemsCount: Int = 10
    var hasDisclosure: Bool = false
    var dividerEnabled: Bool = false
    var itemAppearance: ListItemAppearance = .init()
    var itemStyle: AppearanceVariation<ListItemAppearance>? = nil
    var itemVariation: Variation<ListItemAppearance>? = nil
    var placementMode: PopoverPlacementMode = .loose
    var layout: DropDownMenuLayout = .normal
}
