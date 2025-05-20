import Foundation

/**
 `SelectionControlState` описывает состояние элемента управления выбором (например, чекбокса или радио-кнопки).
 - selected: выбран.
 - deselected: не выбран.
 - indeterminate: промежуточное состояние
 */
public enum SelectionControlState: String, CaseIterable {
    case selected
    case deselected
    case indeterminate
}
