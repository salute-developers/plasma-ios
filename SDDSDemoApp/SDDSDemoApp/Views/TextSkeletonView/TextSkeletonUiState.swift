import Foundation
import SDDSComponents

struct TextSkeletonUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var selectedKind: TextSkeletonKind = .default
    var lineCountText: String = "1"
    var lineCount: Int = 1
    var lineWidthProviderType: TextSkeletonLineProviderType = .varied
    var text: String = ""
    var textHidden: Bool = true
}
