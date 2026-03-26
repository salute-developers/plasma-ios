import SandboxCore
import SwiftUI

enum DropDownMenuStory: Story {
    typealias State = DropDownMenuUiState
    static let defaultState = DropDownMenuUiState()

    static let id = "dropDownMenu.story"
    static let title = "DropDownMenu"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: DropDownMenuUiState, theme: Theme) -> some View {
        DropdownMenuView(viewModel: DropdownMenuViewModel(theme: theme, uiState: state))
    }
}
