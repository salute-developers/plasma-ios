import Foundation
import SwiftUI

/**
 `CheckboxData` представляет собой структуру, содержащую данные для чекбокса.
 
 - Properties:
 - state: Состояние чекбокса.
 - title: Текст заголовка для чекбокса.
 - subtitle: Текст подзаголовка для чекбокса.
 - isEnabled: Флаг, указывающий, включен ли чекбокс.
 - images: Изображения для различных состояний чекбокса.
 - size: Конфигурация размеров для чекбокса.
 - appearance: Параметры внешнего вида чекбокса.
 - accessibility: Параметры доступности для чекбокса.
 */
public struct CheckboxData: Hashable {
    let id = UUID()
    let state: Binding<SelectionControlState>
    let title: String
    let subtitle: String?
    let isEnabled: Bool
    let images: SelectionControlStateImages?
    let appearance: CheckboxAppearance
    let accessibility: SelectionControlAccessibility
    
    public init(
        state: Binding<SelectionControlState>,
        title: String,
        subtitle: String? = nil,
        isEnabled: Bool,
        appearance: CheckboxAppearance,
        images: SelectionControlStateImages? = nil,
        accessibility: SelectionControlAccessibility = SelectionControlAccessibility()
    ) {
        self.state = state
        self.title = title
        self.subtitle = subtitle
        self.isEnabled = isEnabled
        self.appearance = appearance
        self.images = images
        self.accessibility = accessibility
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.uuidString)
        hasher.combine(state.wrappedValue.rawValue)
    }
    
    public static func == (lhs: CheckboxData, rhs: CheckboxData) -> Bool {
        lhs.id == rhs.id && lhs.state.wrappedValue == rhs.state.wrappedValue
    }
}
