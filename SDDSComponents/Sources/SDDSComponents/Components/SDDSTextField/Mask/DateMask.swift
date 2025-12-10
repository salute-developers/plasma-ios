import Foundation

/// Маски для дат
public enum DateMask: Equatable, Hashable {
    /// Формат даты: ДД.ММ.ГГ (12.07.24)
    case short
    
    /// Формат даты: ДД.ММ.ГГГГ (12.07.2024)
    case full
    
    /// Произвольный формат даты
    /// - Parameters:
    ///   - format: Формат маски (например, "[00].[00].[0000]")
    ///   - placeholder: Кастомный плейсхолдер (если nil, будет вычислен из format)
    case custom(format: String, placeholder: String? = nil)
    
    /// Возвращает строку формата маски для InputMask
    public var format: String {
        switch self {
        case .short:
            return "[00].[00].[00]"
        case .full:
            return "[00].[00].[0000]"
        case .custom(let format, _):
            return format
        }
    }
    
    /// Пример отображения маски
    public var placeholder: String {
        switch self {
        case .short:
            return "ДД.ММ.ГГ"
        case .full:
            return "ДД.ММ.ГГГГ"
        case .custom(let format, let customPlaceholder):
            // Если задан кастомный плейсхолдер, используем его
            if let customPlaceholder = customPlaceholder {
                return customPlaceholder
            }
            
            // Если пользователь задал буквы в формате (например, "ГГ.ДД.ММ"), возвращаем как есть.
            let sanitized = format
                .replacingOccurrences(of: "[", with: "")
                .replacingOccurrences(of: "]", with: "")
            if sanitized.range(of: "[A-Za-zА-Яа-я]", options: .regularExpression) != nil {
                return sanitized
            }
            
            // Иначе строим плейсхолдер по порядку сегментов: 1-й -> Д, 2-й -> М, 3-й и далее -> Г.
            var result = ""
            var segmentIndex = 1
            for char in sanitized {
                if char.isNumber {
                    let placeholderChar: Character
                    switch segmentIndex {
                    case 1: placeholderChar = "Д"
                    case 2: placeholderChar = "М"
                    default: placeholderChar = "Г"
                    }
                    result.append(placeholderChar)
                } else {
                    result.append(char)
                    if char == "." || char == "-" || char == "/" || char == " " {
                        segmentIndex += 1
                    }
                }
            }
            return result
        }
    }
    
    /// Разделитель для даты
    public var separator: String {
        "."
    }
}

