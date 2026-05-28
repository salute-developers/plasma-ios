import Foundation
import SwiftUI

public protocol ValueState {
    var stateKey: String { get }
}

public enum InteractiveState: String, CaseIterable, Codable, Hashable, ValueState {
    case activated
    case pressed
    case hovered
    case checked
    case selected
    case focused
    case indeterminate
    case error
    case readonly
    case collapsed

    public var stateKey: String { rawValue }
}

public struct StatefulValue<Value> {
    public struct Item {
        public let states: Set<String>
        public let value: Value

        public init(states: Set<String>, value: Value) {
            self.states = states
            self.value = value
        }

        public init<S: ValueState>(states: [S], value: Value) {
            self.states = Set(states.map(\.stateKey))
            self.value = value
        }
    }

    public let values: [Item]
    public let defaultValue: Value?

    public init(defaultValue: Value? = nil, values: [Item] = []) {
        self.defaultValue = defaultValue
        self.values = values
    }

    public func isStateful() -> Bool {
        values.contains(where: { !$0.states.isEmpty })
    }

    public func resolvedValue<S: ValueState>(for activeStates: Set<S>, default fallback: Value? = nil) -> Value {
        resolvedValue(for: Set(activeStates.map(\.stateKey)), default: fallback)
    }

    public func resolvedValue(for activeStates: Set<String>, default fallback: Value? = nil) -> Value {
        if let matched = values.first(where: { $0.states.isSubset(of: activeStates) }) {
            return matched.value
        }
        return fallback ?? resolvedDefaultValue()
    }

    public func resolvedDefaultValue() -> Value {
        if let defaultValue {
            return defaultValue
        }
        if let emptyStateItem = values.first(where: { $0.states.isEmpty }) {
            return emptyStateItem.value
        }
        guard let first = values.first else {
            fatalError("StatefulValue requires either defaultValue or non-empty values.")
        }
        return first.value
    }
}

extension StatefulValue.Item: Equatable where Value: Equatable {}
extension StatefulValue.Item: Hashable where Value: Hashable {}
extension StatefulValue: Equatable where Value: Equatable {}
extension StatefulValue: Hashable where Value: Hashable {}

public typealias StatefulColor = StatefulValue<ColorToken>

public extension StatefulValue where Value == ColorToken {
    init() {
        self.init(defaultValue: ColorToken())
    }

    func color(
        for activeStates: Set<InteractiveState>,
        colorScheme: ColorScheme,
        subtheme: SubthemeData = SubthemeData()
    ) -> Color {
        _ = subtheme
        return resolvedValue(for: activeStates).color(for: colorScheme)
    }
}

