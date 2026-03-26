import Foundation
import SwiftUI
import SDDSComponents

struct AutocompleteUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var value: TextFieldValue = .single("")
    var withEmptyState: Bool = false
    var showLoading: Bool = false
    var fieldAlignment: AutocompleteFieldAlignment = .center
    var listItems: [SDDSListItem<EmptyView>] = []
    var shouldShowEmptyState: Bool = false
    var isDropdownPresented: Bool = false
    var layout: AutocompleteLayout = .normal
}
