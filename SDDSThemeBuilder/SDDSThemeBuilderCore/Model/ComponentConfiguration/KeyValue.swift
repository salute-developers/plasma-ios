import Foundation

struct KeyValue<T: Codable>: Codable {
    let type: String?
    let `default`: Double?
    let value: T?
    let states: [ValueState<T>]?
    
    func value(for statesSet: [ValueState<T>.State]) -> ValueState<T>? {
        let defaultState = ValueState<T>(state: [], value: value)
        return states?.first(where: { $0.state == statesSet }) ?? defaultState
    }
}

struct ValueState<T: Codable>: Codable {
    enum State: String, Codable {
        case checked
        case indeterminate
        case focused
        case collapsed
    }
    
    let state: [State]?
    let value: T?
}
