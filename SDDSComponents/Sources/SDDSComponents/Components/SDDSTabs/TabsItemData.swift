import SwiftUI

/// Элемент вкладки для SDDSTabs
public struct TabsItemData: Identifiable {
    public let id: String
    public let label: String
    public let value: String?
    public let counterValue: Int?
    public let icon: Image?
    public let isDisabled: Bool
    
    /// Создает элемент вкладки
    /// - Parameters:
    ///   - id: Уникальный идентификатор
    ///   - label: Текст метки
    ///   - value: Дополнительное значение
    ///   - counterValue: Значение счетчика
    ///   - icon: Иконка
    ///   - isDisabled: Состояние disabled
    public init(
        id: String,
        label: String,
        value: String? = nil,
        counterValue: Int? = nil,
        icon: Image? = nil,
        isDisabled: Bool = false
    ) {
        self.id = id
        self.label = label
        self.value = value
        self.counterValue = counterValue
        self.icon = icon
        self.isDisabled = isDisabled
    }
}

