import Foundation

public struct SegmentItemAccessibility {
    public var label: String
    public var hint: String
    public var value: String
    
    /**
     Инициализатор для создания параметров доступности кнопки.
     
     - Parameters:
        - label: Метка доступности для кнопки.
        - hint: Подсказка доступности для кнопки.
        - value: Значение доступности для кнопки.
     */
    public init(label: String, hint: String, value: String) {
        self.label = label
        self.hint = hint
        self.value = value
    }
    
    /**
     Инициализатор для создания параметров доступности кнопки с пустыми значениями.
     */
    public init() {
        self.label = ""
        self.hint = ""
        self.value = ""
    }
}

extension SegmentItemAccessibility {
    var buttonAccessibility: ButtonAccessibility {
        ButtonAccessibility(
            label: label,
            hint: hint,
            value: value
        )
    }
}
