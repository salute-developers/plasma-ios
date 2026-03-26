import Foundation
import SDDSComponents

struct LoaderUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var spinnerViewModel: SpinnerViewModel = .init(componentViewLayoutMode: .subScreen)
    var circularProgressViewModel: CircularProgressBarViewModel = .init(componentViewLayoutMode: .subScreen)
    var loaderType: LoaderType = .spinner
}
