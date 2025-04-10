import Foundation

struct ColorState: Codable {
    enum State: String, Codable {
        case activated
        case pressed
        case hovered
        case checked
        case selected
    }
    
    let state: [State]?
    let value: String?
}
