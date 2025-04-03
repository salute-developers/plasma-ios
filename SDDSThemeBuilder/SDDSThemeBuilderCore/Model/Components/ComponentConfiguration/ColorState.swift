import Foundation

struct ColorState: Codable {
    enum State: String, Codable {
        case activated
        case pressed
        case hovered
    }
    
    enum Checked: String, Codable {
        case checked
    }
    
    let state: [State]?
    let checkedState: [Checked]?
    let value: String?
    
    init(
        state: [State]? = nil,
        checkedState: [Checked]? = nil,
        value: String? = nil
    ) {
        self.state = state
        self.checkedState = checkedState
        self.value = value
    }
}
