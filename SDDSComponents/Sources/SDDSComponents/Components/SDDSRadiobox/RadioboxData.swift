import Foundation
import SwiftUI

/**
 `RadioboxData` представляет собой данные для одного радиобокса.

 - Properties:
    - id: Уникальный идентификатор радиобокса.
    - title: Название радиобокса, отображаемое пользователю.
    - subtitle: Подзаголовок радиобокса, отображаемый под названием (опционально).
    - isSelected: Состояние выбранности радиобокса, привязанное к Binding.
    - isEnabled: Указывает, включен ли радиобокс.
    - images: Изображения для состояния выбранности и невыбранности радиобокса.
    - appearance: Внешний вид радиобокса, определяемый `RadioboxAppearance`.
    - accessibility: Параметры доступности для радиобокса.
 */
public struct RadioboxData: Identifiable {
    public let id: UUID
    public let title: String
    public let subtitle: String?
    public let isSelected: Binding<Bool>
    public let isEnabled: Bool
    public let images: RadioboxImages
    public let appearance: RadioboxAppearance
    public let accessibility: SelectionControlAccessibility

    public init(
        id: UUID = UUID(),
        title: String,
        subtitle: String? = nil,
        isSelected: Binding<Bool>,
        isEnabled: Bool = true,
        images: RadioboxImages,
        appearance: RadioboxAppearance,
        accessibility: SelectionControlAccessibility
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.isSelected = isSelected
        self.isEnabled = isEnabled
        self.images = images
        self.appearance = appearance
        self.accessibility = accessibility
    }
}
