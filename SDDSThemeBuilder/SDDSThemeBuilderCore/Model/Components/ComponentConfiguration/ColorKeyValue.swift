import Foundation

struct ColorKeyValue: Codable {
    let type: String?
    let `default`: String?
    let alpha: Double?
    let states: [ColorState]?
    
    func value(for statesSet: [ColorState.State]) -> ColorState? {
        return states?.first(where: { $0.state == statesSet })
    }
}
