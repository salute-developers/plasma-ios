import Foundation

struct FontFamily: Codable {
    enum Key: String, Codable, CodingKey, CaseIterable {
        case display
        case header
        case text
        case body
    }
    
    let name: String
    let fonts: [Font]
}
