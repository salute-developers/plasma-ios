import Foundation

struct ShadowStyle: Codable {
    let direction: [Direction]
    let kind: [ShadowKind]
    let size: [Size]
}
