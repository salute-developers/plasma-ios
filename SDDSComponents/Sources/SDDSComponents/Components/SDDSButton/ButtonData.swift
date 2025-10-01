import Foundation
import SwiftUI

/**
 Структура, представляющая данные для кнопки.

 - Properties:
    - id: Уникальный идентификатор кнопки.
    - title: Текст заголовка кнопки.
    - subtitle: Текст подзаголовка кнопки.
    - iconAttributes: Атрибуты иконки кнопки.
    - isDisabled: Флаг, указывающий, отключена ли кнопка.
    - isLoading: Флаг, указывающий, загружается ли кнопка.
    - appearance: Параметры внешнего вида кнопки.
    - accessibility: Параметры доступности для кнопки.
    - action: Действие при нажатии на кнопку.
 */
public struct ButtonData: Hashable {
    public let id: UUID
    public let title: String
    public let subtitle: String
    public let iconAttributes: ButtonIconAttributes?
    public let isDisabled: Bool
    public let isLoading: Bool
    public let spinnerImage: Image
    public let buttonStyle: SDDSComponents.ButtonStyle
    public var appearance: ButtonAppearance
    public let layoutMode: ButtonLayoutMode
    public let accessibility: ButtonAccessibility
    public let isSelected: Bool
    public let action: () -> Void
    
    public init(
        id: UUID = UUID(),
        title: String,
        subtitle: String = "",
        iconAttributes: ButtonIconAttributes? = nil,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        spinnerImage: Image = Image("spinner", bundle: Bundle(for: Components.self)),
        buttonStyle: SDDSComponents.ButtonStyle = .basic,
        appearance: ButtonAppearance = ButtonAppearance(),
        layoutMode: ButtonLayoutMode = .wrapContent,
        accessibility: ButtonAccessibility = ButtonAccessibility(),
        isSelected: Bool = false,
        action: @escaping () -> Void
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.iconAttributes = iconAttributes
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.spinnerImage = spinnerImage
        self.buttonStyle = buttonStyle
        self.appearance = appearance
        self.layoutMode = layoutMode
        self.accessibility = accessibility
        self.isSelected = isSelected
        self.action = action
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.uuidString)
    }
    
    public static func == (lhs: ButtonData, rhs: ButtonData) -> Bool {
        lhs.id == rhs.id
    }
}
