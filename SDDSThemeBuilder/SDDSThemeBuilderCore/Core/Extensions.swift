import Foundation

extension Sequence where Element: Equatable {
    func contains(_ value: Element) -> Bool {
        return self.contains { $0 == value }
    }
}

extension String {
    ///  Перевод строка вида "dark.text.primary" в camelCase "darkTextPrimary"
    var camelCase: String {
        return tokenComponents.camelCase
    }
    
    var tokenComponents: [String] {
        let result = self.replacingOccurrences(of: "-", with: ".")
        let components = result.keyComponents
        return components
    }
    
    var keyComponents: [String] {
        self.components(separatedBy: ".")
    }
    
    var fileExtension: FileExtension? {
        FileExtension(rawValue: keyComponents.last ?? "")
    }
}

extension Array where Element == String {
    var camelCase: String {
        let camelCaseString = self.enumerated().map { index, component -> String in
            if index == 0 {
                return String(component)
            } else {
                return component.prefix(1).uppercased() + component.dropFirst()
            }
        }.joined()

        return camelCaseString
    }
}

extension Dictionary {
    mutating func replaceKeys(transform: (Key) -> (Key)) {
        for key in self.keys {
            let value = self[key]
            self.removeValue(forKey: key)
            self[transform(key)] = value
        }
    }
}
