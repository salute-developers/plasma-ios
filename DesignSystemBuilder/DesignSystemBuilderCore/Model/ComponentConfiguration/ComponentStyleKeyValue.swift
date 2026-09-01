import Foundation

struct ComponentStyleKeyValue<Props: Codable>: Codable {
    let type: String?
    let value: String?
    let props: Props?
}
