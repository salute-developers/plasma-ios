import Foundation

/// Маски для времени
public enum TimeMask: Equatable, Hashable {
    /// Формат времени: 00:00 (часы:минуты)
    case short
    
    /// Формат времени с секундами: 00:00:00 (часы:минуты:секунды)
    case withSeconds
    
    /// Произвольный формат времени
    /// - Parameter format: Формат маски (например, "[00]:[00]:[00]")
    case custom(format: String)
    
    /// Возвращает строку формата маски для InputMask
    public var format: String {
        switch self {
        case .short:
            return "[00]:[00]"
        case .withSeconds:
            return "[00]:[00]:[00]"
        case .custom(let format):
            return format
        }
    }
    
    /// Пример отображения маски
    public var placeholder: String {
        switch self {
        case .short:
            return "00:00"
        case .withSeconds:
            return "00:00:00"
        case .custom(let format):
            return format.replacingOccurrences(of: "[", with: "")
                .replacingOccurrences(of: "]", with: "")
        }
    }
    
    /// Разделитель для времени
    public var separator: String {
        ":"
    }
}

