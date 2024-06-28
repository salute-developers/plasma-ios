import Foundation

public struct Scheme: Codable {
    let name: String
    let version: String
    let color: Style
    let gradient: Style
    let shadow: ShadowStyle
    let shape: ShapeStyle
    let typography: TypographyStyle
    let fontFamily: FontFamiliesContainerStyle
    let tokens: [Token]
    
    enum CodingKeys: String, CodingKey {
        case name
        case version
        case color
        case gradient
        case shadow
        case shape
        case typography
        case fontFamily
        case tokens
    }
}
