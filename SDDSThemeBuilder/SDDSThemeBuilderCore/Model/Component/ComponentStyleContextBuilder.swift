import Foundation

final class ComponentStyleContextBuilder {
    let string: String
    
    init(_ string: String) {
        self.string = string
    }
    
    var context: String {
        let comma = "."
        let items = string.components(separatedBy: comma)
        guard let component = Component(rawValue: items.first ?? "") else {
            return ""
        }
        var variations = Array(items[1..<items.count])
        variations = variations.map { variation in
            if !variation.sizeKey.isEmpty {
                return variation.sizeKey
            } else {
                return variation
            }
        }
        
        var result = [String]()
        result += [component.componentName]
        result += variations
        
        return result.joined(separator: comma)
    }
}
