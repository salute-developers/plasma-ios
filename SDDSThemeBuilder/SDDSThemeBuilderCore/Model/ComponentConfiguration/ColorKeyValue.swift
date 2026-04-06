import Foundation

struct ColorKeyValue: Codable {
    let type: String?
    let `default`: String?
    let alpha: Double?
    let states: [ColorState]?
    
    func value(for statesSet: [ComponentState]) -> ColorState? {
        let requestedStates = Set(statesSet)
        let defaultState = ColorState(state: [], value: `default`)
        return states?.first(where: { Set($0.state ?? []) == requestedStates }) ?? defaultState
    }

    func value(for state: ComponentState) -> ColorState? {
        value(for: [state])
    }

    func value(for statesSet: Set<ComponentState>) -> ColorState? {
        value(for: Array(statesSet))
    }

    func asStatefulValue() -> StatefulValueDTO<String> {
        StatefulValueDTO(
            defaultValue: `default`,
            values: (states ?? []).map {
                StatefulValueDTO<String>.Item(
                    states: Set($0.state ?? []),
                    value: $0.value
                )
            }
        )
    }
}
