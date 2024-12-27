import Foundation
import SwiftUI

/**
 Структура, представляющая данные для чипа.

 - Properties:
    - id: Уникальный идентификатор чипа.
    - title: Текст заголовка чипа.
    - isEnabled: Флаг, указывающий, включен ли чип.
    - iconImage: Изображение иконки для чипа.
    - buttonImage: Изображение кнопки для чипа.
    - appearance: Параметры внешнего вида чипа.
    - accessibility: Параметры доступности для чипа.
    - removeAction: Действие при нажатии на кнопку удаления.
 */
public struct ChipData: Hashable {
    public let id: UUID
    public let title: String
    public let isEnabled: Bool
    public let iconImage: Image?
    public let buttonImage: Image?
    public let appearance: ChipAppearance
    public let accessibility: ChipAccessibility
    public let removeAction: () -> Void
    
    public init(id: UUID = UUID(), title: String, isEnabled: Bool, iconImage: Image?, buttonImage: Image?, appearance: ChipAppearance, accessibility: ChipAccessibility, removeAction: @escaping () -> Void) {
        self.id = id
        self.title = title
        self.isEnabled = isEnabled
        self.iconImage = iconImage
        self.buttonImage = buttonImage
        self.appearance = appearance
        self.accessibility = accessibility
        self.removeAction = removeAction
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.uuidString)
    }
    
    public static func == (lhs: ChipData, rhs: ChipData) -> Bool {
        lhs.id == rhs.id
    }
}
