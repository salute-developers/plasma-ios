import Foundation

enum ComponentState: String, Codable, CaseIterable {
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
}

struct StatefulValueDTO<T> {
    struct Item {
        let states: Set<ComponentState>
        let value: T?
    }

    let defaultValue: T?
    let values: [Item]

    func value(for activeStates: [ComponentState]) -> T? {
        let stateSet = Set(activeStates)
        if let match = values.first(where: { $0.states.isSubset(of: stateSet) }) {
            return match.value
        }
        return defaultValue ?? values.first(where: { $0.states.isEmpty })?.value ?? values.first?.value
    }
}

struct KeyValue<T: Codable>: Codable {
    let type: String?
    let `default`: Double?
    let value: T?
    let states: [ValueState<T>]?
    
    func value(for statesSet: [ComponentState]) -> ValueState<T>? {
        let requestedStates = Set(statesSet)
        let defaultState = ValueState<T>(state: [], value: value)
        return states?.first(where: { Set($0.state ?? []) == requestedStates }) ?? defaultState
    }

    func value(for state: ComponentState) -> ValueState<T>? {
        value(for: [state])
    }

    func value(for statesSet: Set<ComponentState>) -> ValueState<T>? {
        value(for: Array(statesSet))
    }

    func asStatefulValue() -> StatefulValueDTO<T> {
        StatefulValueDTO(
            defaultValue: value,
            values: (states ?? []).map {
                StatefulValueDTO<T>.Item(
                    states: Set($0.state ?? []),
                    value: $0.value
                )
            }
        )
    }
}

struct ValueState<T: Codable>: Codable {
    let state: [ComponentState]?
    let value: T?
}
