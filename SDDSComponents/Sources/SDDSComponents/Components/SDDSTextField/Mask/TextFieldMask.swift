import Foundation

/// Типы масок для текстовых полей
///
/// Маски используют библиотеку InputMask для форматирования ввода текста.
/// Все маски по умолчанию поддерживают только цифры, но могут быть расширены
/// с помощью custom форматов для добавления символьных значений.
///
/// ## Примеры использования:
///
/// ```swift
/// // Маска телефона
/// let phoneMask = TextFieldMask.phone(.russia)
///
/// // Маска даты
/// let dateMask = TextFieldMask.date(.short)
///
/// // Маска времени
/// let timeMask = TextFieldMask.time(.withSeconds)
///
/// // Использование с SDDSTextField
/// SDDSTextField(
///     value: $value,
///     title: "Телефон",
///     placeholder: "Введите номер",
///     mask: .phone(.russia)
/// )
/// ```
public enum TextFieldMask: Equatable, Hashable {
    /// Маска для номера телефона
    /// - Parameter mask: Тип маски телефона (по умолчанию `.russia`)
    ///
    /// **Особенности:**
    /// - Поддерживает только цифры
    /// - Количество символов ограничивается форматом номера телефона
    /// - Код страны выводится в международном формате
    case phone(PhoneMask)
    
    /// Маска для даты
    /// - Parameter mask: Тип маски даты (по умолчанию `.short` - ДД.ММ.ГГ)
    ///
    /// **Особенности:**
    /// - Поддерживает только цифры по умолчанию
    /// - При необходимости можно добавить символьные значения через `.custom`
    case date(DateMask)
    
    /// Маска для времени
    /// - Parameter mask: Тип маски времени (по умолчанию `.short` - 00:00)
    ///
    /// **Особенности:**
    /// - Поддерживает только цифры по умолчанию
    /// - При необходимости можно добавить символьные значения через `.custom`
    case time(TimeMask)
    
    /// Маска для чисел
    /// - Parameter mask: Тип маски числа (integer или decimal)
    ///
    /// **Особенности:**
    /// - Поддерживает только цифры
    /// - Формат маски динамически генерируется на основе введенного текста
    /// - Использует NumberFormatter для форматирования с разделителями тысяч
    case number(NumberMask)
    
    /// Возвращает строку формата маски для InputMask
    /// - Parameter input: Входной текст для динамических масок (например, NumberMask)
    /// - Returns: Формат маски. Для статических масок возвращает формат, для динамических - формат на основе input
    public func format(input: String = "") -> String {
        switch self {
        case .phone(let phoneMask):
            return phoneMask.format
        case .date(let dateMask):
            return dateMask.format
        case .time(let timeMask):
            return timeMask.format
        case .number(let numberMask):
            return numberMask.format(input: input)
        }
    }
    
    /// Возвращает пример отображения маски
    public var placeholder: String {
        switch self {
        case .phone(let phoneMask):
            return phoneMask.placeholder
        case .date(let dateMask):
            return dateMask.placeholder
        case .time(let timeMask):
            return timeMask.placeholder
        case .number(let numberMask):
            return numberMask.placeholder
        }
    }
    
    /// Проверяет, является ли маска динамической (требует обновления формата при изменении текста)
    public var isDynamic: Bool {
        switch self {
        case .number:
            return true
        default:
            return false
        }
    }
    
    /// Проверяет, является ли маска полной (все обязательные символы введены)
    /// - Parameters:
    ///   - text: Текст для проверки
    ///   - complete: Флаг полноты из InputMask
    /// - Returns: True, если маска полностью заполнена
    public func isComplete(text: String, complete: Bool) -> Bool {
        return complete
    }
}

// MARK: - Convenience Initializers

public extension TextFieldMask {
    /// Российский номер телефона: +7 000 000-00-00
    static var russianPhone: TextFieldMask {
        .phone(.russia)
    }
    
    /// Дата в формате ДД.ММ.ГГ
    static var shortDate: TextFieldMask {
        .date(.short)
    }
    
    /// Дата в формате ДД.ММ.ГГГГ
    static var fullDate: TextFieldMask {
        .date(.full)
    }
    
    /// Время в формате 00:00
    static var shortTime: TextFieldMask {
        .time(.short)
    }
    
    /// Время в формате 00:00:00
    static var fullTime: TextFieldMask {
        .time(.withSeconds)
    }
}

