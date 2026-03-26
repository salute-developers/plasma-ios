import SandboxCore
import SwiftUI

enum AccordionStory: Story {
    typealias State = AccordionUiState
    static let defaultState = AccordionUiState()

    static let id = "accordion.story"
    static let title = "Accordion"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: AccordionUiState, theme: Theme) -> some View {
        AccordionView(viewModel: AccordionViewModel(theme: theme, uiState: state))
    }
}
