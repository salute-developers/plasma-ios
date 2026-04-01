import SandboxCore
import SwiftUI

enum AccordionItemStory: Story {
    typealias State = AccordionItemUiState
    static let defaultState = AccordionItemUiState()

    static let id = "accordionItem.story"
    static let title = "AccordionItem"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: AccordionItemUiState, theme: Theme) -> some View {
        AccordionItemView(viewModel: AccordionItemViewModel(theme: theme, uiState: state))
    }
}
