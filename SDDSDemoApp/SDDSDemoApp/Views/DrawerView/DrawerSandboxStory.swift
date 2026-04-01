import SandboxCore
import SwiftUI

enum DrawerStory: Story {
    typealias State = DrawerUiState
    static let defaultState = DrawerUiState()

    static let id = "drawer.story"
    static let title = "Drawer"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: DrawerUiState, theme: Theme) -> some View {
        DrawerView(viewModel: DrawerViewModel(theme: theme, uiState: state))
    }
}
