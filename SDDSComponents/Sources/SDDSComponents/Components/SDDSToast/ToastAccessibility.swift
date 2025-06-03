import Foundation

/**
 `ToastAccessibility` определяет параметры доступности для тоста.
 
 - Properties:
    - textLabel: Метка доступности для текста.
 */
public struct ToastAccessibility {
    public var textLabel: String
    
    public init(
        textLabel: String = "Toast message"
    ) {
        self.textLabel = textLabel
    }
} 