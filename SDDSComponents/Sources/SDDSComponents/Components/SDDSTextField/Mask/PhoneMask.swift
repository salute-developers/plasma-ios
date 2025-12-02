import Foundation

/// Маски для номеров телефонов
public enum PhoneMask: Equatable, Hashable {
    /// Российский номер телефона: +7 000 000-00-00
    case russia
    
    /// Произвольный формат телефона с указанием маски
    /// - Parameter format: Формат маски (например, "+7 ([000]) [000]-[00]-[00]")
    case custom(format: String)
    
    /// Возвращает строку формата маски для InputMask
    public var format: String {
        switch self {
        case .russia:
            return "+7 ([000]) [000]-[00]-[00]"
        case .custom(let format):
            return format
        }
    }
    
    /// Префикс номера (код страны)
    public var prefix: String {
        switch self {
        case .russia:
            return "+7"
        case .custom(let format):
            // Извлекаем префикс из формата (символы до первого [)
            if let range = format.range(of: "[") {
                return String(format[..<range.lowerBound]).trimmingCharacters(in: .whitespaces)
            }
            return ""
        }
    }
    
    /// Пример отображения маски
    public var placeholder: String {
        switch self {
        case .russia:
            return "+7 000 000-00-00"
        case .custom(let format):
            return format.replacingOccurrences(of: "[", with: "")
                .replacingOccurrences(of: "]", with: "")
        }
    }
}

