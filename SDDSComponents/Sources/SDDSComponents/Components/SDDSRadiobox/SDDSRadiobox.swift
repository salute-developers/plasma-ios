import Foundation
import SwiftUI
import UIKit

/**
 `SDDSRadiobox` представляет собой компонент радиокнопки, который позволяет пользователю выбрать один вариант из группы опций.

 - Parameters:
    - isSelected: Состояние выбранности
    - title: Текст заголовка радиокнопки
    - subtitle: Текст подзаголовка радиокнопки (опционально)
    - isEnabled: Флаг доступности радиокнопки
    - images: Изображения для состояний выбранности и невыбранности
    - appearance: Параметры внешнего вида радиокнопки
    - accessibility: Параметры доступности

 ## Примеры использования

 ```swift
 // Базовая радиокнопка
 @State isSelected: Bool = true
 SDDSRadiobox(
     isSelected: $isSelected,
     title: "Value",
     subtitle: "Description",
     isEnabled: true,
     appearance: Radiobox.m.appearance
 )
 ```
 */
public struct RadioboxImages {
    public let selectedImage: Image
    public let deselectedImage: Image
    public init(selectedImage: Image, deselectedImage: Image) {
        self.selectedImage = selectedImage
        self.deselectedImage = deselectedImage
    }
}

public struct SDDSRadiobox: View {
    @Binding var isSelected: Bool
    let title: String
    let subtitle: String?
    let isEnabled: Bool
    let images: RadioboxImages?
    let accessibility: SelectionControlAccessibility
    private var _appearance: RadioboxAppearance?
    @Environment(\.radioboxAppearance) private var environmentAppearance
    
    public init(
        isSelected: Binding<Bool>,
        title: String,
        subtitle: String? = nil,
        isEnabled: Bool,
        images: RadioboxImages? = nil,
        appearance: RadioboxAppearance? = nil,
        accessibility: SelectionControlAccessibility = SelectionControlAccessibility()
    ) {
        self._isSelected = isSelected
        self.title = title
        self.subtitle = subtitle
        self.isEnabled = isEnabled
        self.images = images
        self._appearance = appearance
        self.accessibility = accessibility
    }

    public var body: some View {
        SelectionControl(
            state: Binding(
                get: {
                    return isSelected ? .selected : .deselected
                },
                set: { value in
                    self.isSelected = value.isSelected
                }
            ),
            selectionControlType: .radiobox,
            title: title,
            subtitle: subtitle,
            isEnabled: isEnabled,
            selectionControlToggle: selectionControlToggle,
            appearance: appearance,
            accessibility: accessibility
        )
    }
    
    var appearance: RadioboxAppearance {
        _appearance ?? environmentAppearance
    }
    
    private var selectionControlToggle: SelectionControlToggle {
        guard let images = images else {
            return .pathDrawer
        }
        return .images(
            .init(selectedImage: images.selectedImage, deselectedImage: images.deselectedImage, indeterminateImage: nil)
        )
    }
}

public enum SDDSRadioboxGroupSize: String, RadioboxGroupSizeConfiguration, CaseIterable {
    case large
    case medium
    case small

    public var verticalSpacing: CGFloat {
        switch self {
        case .large:
            8
        case .medium:
            8
        case .small:
            4
        }
    }

    public var debugDescription: String {
        return rawValue
    }
}
