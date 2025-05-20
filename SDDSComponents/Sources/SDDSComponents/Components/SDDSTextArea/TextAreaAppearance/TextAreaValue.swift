import Foundation

/**
 `TextAreaValue` Определяет возможные значения текстового поля.
 
 - Parameters:
    - single: Одиночное текстовое значение.
    - multiple: Текстовое значение с коллекцией чипов
 */
public enum TextAreaValue: Equatable {
    case single(String)
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
