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
    let images: SelectionControlStateImages
    let size: SelectionControlSizeConfiguration
    let appearance: CheckboxAppearance
    let accessibility: SelectionControlAccessibility
    
    public init(
        state: Binding<SelectionControlState>,
        title: String,
        subtitle: String? = nil,
        isEnabled: Bool,
        images: SelectionControlStateImages,
        size: SelectionControlSizeConfiguration,
        appearance: CheckboxAppearance,
        accessibility: SelectionControlAccessibility = SelectionControlAccessibility()
    ) {
        self.state = state
        self.title = title
        self.subtitle = subtitle
        self.isEnabled = isEnabled
        self.images = images
        self.size = size
        self.appearance = appearance
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

/**
 `SDDSCheckbox` представляет собой настраиваемый чекбокс, который может быть настроен с помощью различных параметров.
 
 - Parameters:
 - state: Состояние чекбокса.
 - title: Текст заголовка для чекбокса.
 - subtitle: Текст подзаголовка для чекбокса.
 - isEnabled: Флаг, указывающий, включен ли чекбокс.
 - images: Изображения для различных состояний чекбокса.
 - size: Конфигурация размеров для чекбокса.
 - appearance: Параметры внешнего вида чекбокса.
 - accessibility: Параметры доступности для чекбокса.
 */
public struct SDDSCheckbox: View {
    @Binding var state: SelectionControlState
    let title: String
    let subtitle: String?
    let isEnabled: Bool
    let images: SelectionControlStateImages
    let size: SelectionControlSizeConfiguration
    let appearance: CheckboxAppearance
    let accessibility: SelectionControlAccessibility
    
    /**
     Инициализатор для создания чекбокса с заданными параметрами.
     
     - Parameters:
     - state: Состояние чекбокса.
     - title: Текст заголовка для чекбокса.
     - subtitle: Текст подзаголовка для чекбокса (по умолчанию nil).
     - isEnabled: Флаг, указывающий, включен ли чекбокс.
     - images: Изображения для различных состояний чекбокса.
     - size: Конфигурация размеров для чекбокса.
     - appearance: Параметры внешнего вида чекбокса.
     - accessibility: Параметры доступности для чекбокса (по умолчанию `SelectionControlAccessibility`).
     */
    public init(
        state: Binding<SelectionControlState>,
        title: String,
        subtitle: String? = nil,
        isEnabled: Bool,
        images: SelectionControlStateImages,
        size: SelectionControlSizeConfiguration,
        appearance: CheckboxAppearance,
        accessibility: SelectionControlAccessibility = SelectionControlAccessibility()
    ) {
        self._state = state
        self.title = title
        self.subtitle = subtitle
        self.isEnabled = isEnabled
        self.images = images
        self.size = size
        self.appearance = appearance
        self.accessibility = accessibility
    }
    
    /**
     Инициализатор для создания чекбокса на основе данных структуры `CheckboxData`.
     
     - Parameters:
     - data: Структура `CheckboxData`, содержащая все параметры для создания чекбокса.
     */
    public init(data: CheckboxData) {
        self._state = data.state
        self.title = data.title
        self.subtitle = data.subtitle
        self.isEnabled = data.isEnabled
        self.images = data.images
        self.size = data.size
        self.appearance = data.appearance
        self.accessibility = data.accessibility
    }
    
    public var body: some View {
        SelectionControl(
            state: $state,
            type: .checkbox,
            title: title,
            subtitle: subtitle,
            isEnabled: isEnabled,
            size: size,
            appearance: appearance,
            images: images,
            accessibility: accessibility
        )
    }
}

public extension SelectionControlStateImages {
    static var checkbox: SelectionControlStateImages {
        .init(
            selectedImage: Image.image("checkboxOn"),
            deselectedImage: Image.image("checkboxOff"),
            indeterminateImage: Image.image("checkboxMulti")
        )
    }
}
