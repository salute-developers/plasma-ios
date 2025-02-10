import Foundation

struct ColorKeyValue: Codable {
    let type: String?
    let `default`: String?
    let alpha: Double?
    let states: [ColorState]?
    
    func value(for statesSet: [ColorState.State]) -> ColorState? {
        let defaultState = ColorState(state: [], value: `default`)
        return states?.first(where: { $0.state == statesSet }) ?? defaultState
    }
}
