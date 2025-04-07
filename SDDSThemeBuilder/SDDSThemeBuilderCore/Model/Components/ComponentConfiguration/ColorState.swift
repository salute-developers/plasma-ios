import Foundation

struct ColorState: Codable {
    enum State: String, Codable {
        case activated
        case pressed
        case hovered
        case checked
        case focused
    }
    
    let state: [State]?
    let value: String?
    
    init(
        state: [State]? = nil,
        value: String? = nil
    ) {
        self.state = state
        self.value = value
    }
}
