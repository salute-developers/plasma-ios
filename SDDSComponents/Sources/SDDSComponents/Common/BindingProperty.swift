import Foundation

/// Описание одной настраиваемой «ручки» binding-конфигуратора компонента —
/// размерности вариации (например, `size` со значениями `[xs, s, m, l]`).
///
/// Аналог Android `Property` (`SingleChoiceProperty` / `BooleanProperty`):
/// сгенерированный `<Component>Styles` отдаёт `bindingProperties: [BindingProperty]`,
/// а generic-конфигуратор в демо рисует по ним контролы и собирает
/// `[String: String]`, который резолвится обратно в стиль через `resolveStyle(bindings:)`.
public struct BindingProperty: Hashable, Identifiable, Sendable {
    /// Тип контрола для «ручки».
    public enum Kind: Hashable, Sendable {
        /// Одиночный выбор из списка значений (рисуется как меню/пикер).
        case singleChoice([String])
        /// Булев переключатель (рисуется как тоггл).
        case toggle
    }

    /// Имя размерности (совпадает с ключом в map значений), например `required-placement`.
    public let name: String
    /// Тип контрола и его допустимые значения.
    public let kind: Kind
    /// Значение по умолчанию (raw-строка).
    public let defaultValue: String

    public var id: String { name }

    public init(name: String, kind: Kind, defaultValue: String) {
        self.name = name
        self.kind = kind
        self.defaultValue = defaultValue
    }
}
