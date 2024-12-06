import Foundation

/**
 `ChipAccessibility` определяет параметры доступности для чипа.
 
 - Properties:
    - titleLabel: Метка доступности для заголовка.
    - removeButtonLabel: Метка доступности для кнопки удаления.
    - removeButtonHint: Подсказка для кнопки удаления.
 */
public struct ChipAccessibility {
    public var titleLabel: String
    public var removeButtonLabel: String
    public var removeButtonHint: String
    
    public init(
        titleLabel: String = "Chip Label",
        removeButtonLabel: String = "Remove",
        removeButtonHint: String = "Double-tap to remove the chip."
    ) {
        self.titleLabel = titleLabel
        self.removeButtonLabel = removeButtonLabel
        self.removeButtonHint = removeButtonHint
    }
}
