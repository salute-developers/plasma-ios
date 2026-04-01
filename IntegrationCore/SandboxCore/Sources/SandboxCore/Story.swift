import Foundation

public protocol Story {
    associatedtype State: UiState

    static var id: String { get }
    static var title: String { get }
    static var componentKey: ComponentKey { get }
    static var defaultState: State { get }
}

public struct StoryDescriptor: Identifiable, Hashable {
    public let id: String
    public let title: String
    public let componentKey: ComponentKey
    public let uiStateType: String
    public let makeDefaultState: () -> any UiState

    public init(
        id: String,
        title: String,
        componentKey: ComponentKey,
        uiStateType: String,
        makeDefaultState: @escaping () -> any UiState
    ) {
        self.id = id
        self.title = title
        self.componentKey = componentKey
        self.uiStateType = uiStateType
        self.makeDefaultState = makeDefaultState
    }

    public init<S: Story>(_ story: S.Type) {
        self.id = story.id
        self.title = story.title
        self.componentKey = story.componentKey
        self.uiStateType = String(describing: S.State.self)
        self.makeDefaultState = { S.defaultState }
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func == (lhs: StoryDescriptor, rhs: StoryDescriptor) -> Bool {
        lhs.id == rhs.id
    }
}
