import Foundation

struct TypographyStyle: Codable {
    let screen: [Screen]
    let kind: [TypographyKind]
    let size: [Size]
    let weight: [Weight]
}
