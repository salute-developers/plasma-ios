import Foundation

struct ShapeKeyValue: Codable {
    let type: String?
    let value: String?
    let adjustment: Double?
    
    init(type: String? = nil, value: String? = nil, adjustment: Double? = nil) {
        self.type = type
        self.value = value
        self.adjustment = adjustment
    }
}
