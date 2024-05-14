import Foundation

struct Font: Codable {
    public enum Weight: Int, Codable {
        case thin = 100
        case light = 300
        case regular = 400
        case medium = 500
        case semibold = 600
        case bold = 700
    }
    
    public enum Style: String, Codable {
        case normal
        case italic
    }
    
    let link: URL
    let fontWeight: Weight
    let fontStyle: Style
}
