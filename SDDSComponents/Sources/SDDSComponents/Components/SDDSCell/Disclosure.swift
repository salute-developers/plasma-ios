import Foundation
import SwiftUI

/**
 Перечисление `Disclosure` представляет собой тип раскрывающегося представления, который может быть либо стандартным, либо пользовательским.

 - Cases:
    - default: Стандартное раскрывающееся представление с использованием `DefaultDisclosure`.
    - custom: Пользовательское раскрывающееся представление с использованием `ViewProvider`.
 */
public enum Disclosure {
    case `default`(DefaultDisclosure)
    case custom(ViewProvider)
}

/**
 Структура `DefaultDisclosure` представляет собой стандартное раскрывающееся представление с текстом и иконкой.

 - Properties:
    - text: Строка, представляющая текст, отображаемый в представлении.
    - icon: Изображение, представляющее иконку, отображаемую в представлении.

 - Initializer:
    - init(text:icon:): Инициализирует новый экземпляр `DefaultDisclosure` с указанным текстом и иконкой.
 */
public struct DefaultDisclosure {
    let text: String
    let icon: Image

    public init(
        text: String,
        icon: Image
    ) {
        self.text = text
        self.icon = icon
    }
}
