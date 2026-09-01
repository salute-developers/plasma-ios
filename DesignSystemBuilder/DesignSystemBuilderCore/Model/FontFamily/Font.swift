import Foundation

struct Font: Codable {
    public enum Weight: String, Codable {
        case black
        case bold
        case heavy
        case light
        case medium
        case regular
        case semibold
        case thin
        case ultralight
        case normal
    }
    
    public enum Style: String, Codable {
        case normal
        case italic
    }
    
    let link: URL
    let weight: Weight
    let style: Style
}
