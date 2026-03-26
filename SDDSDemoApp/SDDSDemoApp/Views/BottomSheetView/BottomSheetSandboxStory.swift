import SandboxCore
import SwiftUI

enum BottomSheetStory: Story {
    typealias State = BottomSheetUiState
    static let defaultState = BottomSheetUiState()

    static let id = "bottomSheet.story"
    static let title = "BottomSheet"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: BottomSheetUiState, theme: Theme) -> some View {
        BottomSheetView(viewModel: BottomSheetViewModel(theme: theme, uiState: state))
    }
}
