import SandboxCore
import SwiftUI

enum FormItemStory: Story {
    typealias State = FormItemUiState
    static let defaultState = FormItemUiState()

    static let id = "formItem.story"
    static let title = "FormItem"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }

    @ViewBuilder
    static func content(state: FormItemUiState, theme: Theme) -> some View {
        FormItemView(
            viewModel: FormItemViewModel(theme: theme, uiState: state)
        )
    }
}
