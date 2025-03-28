import Foundation

struct ColorState: Codable {
    enum State: String, Codable {
        case activated
        case pressed
        case hovered
        case selected
    }
    
    let state: [State]?
    let value: String?
}
