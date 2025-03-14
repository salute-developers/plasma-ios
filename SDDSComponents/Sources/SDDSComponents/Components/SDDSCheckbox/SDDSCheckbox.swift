import Foundation
import SwiftUI

/**
 `SDDSCheckbox` представляет собой настраиваемый чекбокс, который может быть настроен с помощью различных параметров.
 
 - Parameters:
 - state: Состояние чекбокса.
 - title: Текст заголовка для чекбокса.
 - subtitle: Текст подзаголовка для чекбокса.
 - isEnabled: Флаг, указывающий, включен ли чекбокс.
 - images: Изображения для различных состояний чекбокса.
 - appearance: Параметры внешнего вида чекбокса.
 - accessibility: Параметры доступности для чекбокса.
 */
public struct SDDSCheckbox: View {
    @Binding var state: SelectionControlState
    let title: String
    let subtitle: String?
    let isEnabled: Bool
    let accessibility: SelectionControlAccessibility
    let images: SelectionControlStateImages?
    private var _appearance: CheckboxAppearance?
    @Environment(\.checkboxAppearance) private var environmentAppearance
    
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
        images: SelectionControlStateImages? = nil,
        appearance: CheckboxAppearance? = nil,
        accessibility: SelectionControlAccessibility = SelectionControlAccessibility()
    ) {
        self._state = state
        self.title = title
        self.subtitle = subtitle
        self.isEnabled = isEnabled
        self._appearance = appearance
        self.images = images
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
        self._appearance = data.appearance
        self.images = data.images
        self.accessibility = data.accessibility
    }
    
    public var body: some View {
        SelectionControl(
            state: $state,
            title: title,
            subtitle: subtitle,
            isEnabled: isEnabled,
            selectionControlToggle: selectionControlToggle,
            appearance: appearance,
            accessibility: accessibility
        )
    }
    
    @available(*, deprecated, message: "Don't use it, public method will be removed")
    public var appearance: CheckboxAppearance {
        _appearance ?? environmentAppearance
    }
    
    private var selectionControlToggle: SelectionControlToggle {
        guard let images = images else {
            return .pathDrawer
        }
        return .images(images)
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
