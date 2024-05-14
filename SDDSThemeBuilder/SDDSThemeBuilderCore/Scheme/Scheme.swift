import Foundation

enum Mode: String, Codable {
    case dark
    case light
}

enum Category: String, Codable {
    case text
    case surface
    case background
    case outline
}

enum Subcategory: String, Codable {
    case onDark = "on-dark"
    case onLight = "on-light"
    case `default`
    case inverse
}

enum Direction: String, Codable {
    case up
    case down
}

enum ShadowKind: String, Codable {
    case hard
    case soft
}

enum ShapeKind: String, Codable {
    case round
}

enum TypographyKind: String, Codable {
    case display
    case body
    case text
    case h1
    case h2
    case h3
    case h4
    case h5
}

enum FontFamilyKind: String, Codable {
    case text
    case body
    case header
    case display
}

enum Size: String, Codable {
    case large = "l"
    case medium = "m"
    case small = "s"
    case xs
    case xxs
    case xxl
    case xl
}

enum Weight: String, Codable {
    case normal
    case bold
}

enum Screen: String, Codable {
    case screenL = "screen-l"
    case screenM = "screen-m"
    case screenS = "screen-s"
}

enum TokenKind: String, Codable {
    case color
    case gradient
    case shadow
    case shape
    case typography
    case fontFamily = "font-family"
}

public struct Scheme: Codable {
    let name: String
    let version: String
    let color: Style
    let gradient: Style
    let shadow: ShadowStyle
    let shape: ShapeStyle
    let typography: TypographyStyle
    let fontFamily: FontFamilyStyle
    let tokens: [Token]
    
    enum CodingKeys: String, CodingKey {
        case name
        case version
        case color
        case gradient
        case shadow
        case shape
        case typography
        case fontFamily = "font-family"
        case tokens
    }
}

struct Style: Codable {
    let mode: [Mode]
    let category: [Category]
    let subcategory: [Subcategory]
}

struct ShadowStyle: Codable {
    let direction: [Direction]
    let kind: [ShadowKind]
    let size: [Size]
}

struct ShapeStyle: Codable {
    let kind: [ShapeKind]
    let size: [Size]
}

struct TypographyStyle: Codable {
    let screen: [Screen]
    let kind: [TypographyKind]
    let size: [Size]
    let weight: [Weight]
}

struct FontFamilyStyle: Codable {
    let kind: [FontFamilyKind]
}

struct Token: Codable {
    let type: TokenKind
    let name: String
    let tags: [String]
    let displayName: String
    let description: String
    let enabled: Bool
}
