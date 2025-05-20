import Foundation
import SwiftUI

/**
 `SDDSCheckbox` представляет собой настраиваемый чекбокс, который может быть настроен с помощью различных параметров.
 
 - Parameters:
    - state: Состояние чекбокса. ``SelectionControlState``
    - title: Текст заголовка для чекбокса.
    - subtitle: Текст подзаголовка для чекбокса.
    - isEnabled: Флаг, указывающий, включен ли чекбокс.
    - images: Изображения для различных состояний чекбокса.
    - appearance: Параметры внешнего вида чекбокса.
    - accessibility: Параметры доступности для чекбокса.
 
 ```swift
 @State var selectionControl: SelectionControlState = .selected
 SDDSCheckbox(
     state: $selectionControl,
     title: "Value",
     subtitle: "Description",
     isEnabled: true,
     appearance: Checkbox.l.default.appearance
 )
 ```
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
     - data: Структура ``CheckboxData``, содержащая все параметры для создания чекбокса.
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
            selectionControlType: .checkbox,
            title: title,
            subtitle: subtitle,
            isEnabled: isEnabled,
            selectionControlToggle: selectionControlToggle,
            appearance: appearance,
            accessibility: accessibility
        )
    }
    
    var appearance: CheckboxAppearance {
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
