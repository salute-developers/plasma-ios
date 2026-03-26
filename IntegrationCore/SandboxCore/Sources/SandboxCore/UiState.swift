import Foundation

public protocol UiState {}

public protocol DefaultUiState: UiState {
    init()
}

public protocol StoryUiState: UiState {
    var variant: String { get }
    var appearance: String { get }
}

public struct EmptyUiState: DefaultUiState {
    public init() {}
}
