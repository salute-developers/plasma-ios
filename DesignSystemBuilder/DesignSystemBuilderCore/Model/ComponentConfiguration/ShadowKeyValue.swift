import Foundation

struct ShadowKeyValue: Codable {
    let type: String?
    let value: String?
    
    init(type: String? = nil, value: String? = nil) {
        self.type = type
        self.value = value
    }
}
