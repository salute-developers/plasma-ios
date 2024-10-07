import Foundation

/// Определяет параметры доступности для текстового поля.
public struct TextFieldAccessibility {
    public let label: String
    public let hint: String
    
    public init(label: String = "", hint: String = "") {
        self.label = label
        self.hint = hint
    }
}
