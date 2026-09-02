import Foundation

protocol ThemeContext {
    func populateMissingColors(_ dictionary: inout [String: Any])
}

extension ThemeContext {
    func populateMissingColors(_ dictionary: inout [String: Any]) {
        dictionary = dictionary.compactMapValues { value in
            guard var updatedValue = value as? [String: Any] else { return value }
            updatedValue[Mode.dark.rawValue] = updatedValue[Mode.dark.rawValue] ?? updatedValue[Mode.light.rawValue]
            updatedValue[Mode.light.rawValue] = updatedValue[Mode.light.rawValue] ?? updatedValue[Mode.dark.rawValue]
            return updatedValue
        }
    }
}
