import Foundation

struct KeyValue<T: Codable>: Codable {
    let type: String?
    let value: T?
}
