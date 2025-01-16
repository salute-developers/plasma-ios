import Foundation

/// Определяет возможные значения текстового поля.
public enum TextAreaValue: Equatable {
    /// Одиночное текстовое значение.
    case single(String)
    /// Множественное значение с чипсами.
    case multiple(String, [ChipData])
    
    public static func == (lhs: TextAreaValue, rhs: TextAreaValue) -> Bool {
        switch (lhs, rhs) {
        case (.single(let lhs), .single(let rhs)):
            return lhs == rhs
        case (.multiple(let lhsText, let lhsChips), .multiple(let rhsText, let rhsChips)):
            return lhsText == rhsText && lhsChips == rhsChips
        default:
            return false
        }
    }
    
    public var text: String {
        switch self {
        case .single(let text):
            return text
        case .multiple(let text, _):
            return text
        }
    }
    
    public func updated(with text: String) -> TextAreaValue {
        switch self {
        case .single:
            return .single(text)
        case .multiple(_, let chips):
            return .multiple(text, chips)
        }
    }
}
