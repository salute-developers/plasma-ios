import Foundation

enum TokenKind: String, Codable {
    case color
    case gradient
    case shadow
    case shape
    case typography
    case fontFamily = "font-family"
}
