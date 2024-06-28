import Foundation

struct Token: Codable {
    let type: TokenKind
    let name: String
    let tags: [String]
    let displayName: String
    let description: String
    let enabled: Bool
}
