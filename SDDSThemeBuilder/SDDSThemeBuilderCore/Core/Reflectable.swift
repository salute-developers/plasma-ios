import Foundation

protocol Reflectable {
    associatedtype Appearance: Reflectable
    
    var properties: [(WritableKeyPath<Appearance, String?>, String?)] { get }
    var context: String { get }
    func update(with appearance: Appearance) -> Appearance
    func update(keyPath: WritableKeyPath<Appearance, String?>, value: String?) -> Self
}

extension Reflectable {
    func update(with appearance: Appearance) -> Self {
        var result = self
        
        for (keyPath, value) in properties {
            if let newValue = value {
                result = result.update(keyPath: keyPath, value: newValue)
            }
        }
        
        return result
    }
    
    var context: String {
        var result = ""
        let mirror = Mirror(reflecting: self)

        for child in mirror.children {
            guard let propertyName = child.label else { continue }

            if let value = child.value as? String {
                result += "var \(propertyName) = \(value)"
                result += "\n"
            }
        }
        return result
    }
}
