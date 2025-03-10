import Foundation

/**
 Перечисление `CellContentAlignment` определяет возможные варианты выравнивания контента в ячейке.

 - Cases:
    - top: Контент выравнивается по верхней границе cell.
    - center: Контент выравнивается по центру cell.
    - bottom: Контент выравнивается по нижней границе cell.
 */
public enum CellContentAlignment: String, CaseIterable {
    case top
    case center
    case bottom
}
