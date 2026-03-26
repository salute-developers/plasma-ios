import Foundation

public struct StoryProperty: Hashable, Sendable {
    public enum Kind: Hashable, Sendable {
        case text
        case boolean
        case number
        case options([String])
    }

    public let name: String
    public let valueDescription: String
    public let kind: Kind

    public init(name: String, valueDescription: String, kind: Kind) {
        self.name = name
        self.valueDescription = valueDescription
        self.kind = kind
    }
}

public protocol PropertyProducer<State> {
    associatedtype State: UiState

    func produce(from state: State) -> [StoryProperty]
}

public protocol StateValueTransformer<Input, Output> {
    associatedtype Input
    associatedtype Output

    func transform(_ input: Input) -> Output
}
