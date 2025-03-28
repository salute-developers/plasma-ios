import Foundation
import SwiftUI

/**
 `ButtonIconAttributes` содержит атрибуты иконки для кнопки.

 - Properties:
    - image: Изображение иконки, которое будет отображаться на кнопке.
    - alignment: Выравнивание иконки (левое или правое), определяемое `ButtonAlignment`.
 */
public struct ButtonIconAttributes {
    /**
     Изображение иконки, которое будет отображаться на кнопке.
     */
    public let image: Image
    
    /**
     Выравнивание иконки (левое или правое), определяемое `ButtonAlignment`.
     */
    public let alignment: ButtonAlignment
    
    /**
     Инициализатор для создания атрибутов иконки кнопки.
     
     - Parameters:
        - image: Изображение иконки.
        - alignment: Выравнивание иконки.
     */
    public init(image: Image, alignment: ButtonAlignment) {
        self.image = image
        self.alignment = alignment
    }
}

extension ButtonIconAttributes: Equatable {
    public static func == (lhs: ButtonIconAttributes, rhs: ButtonIconAttributes) -> Bool {
        return lhs.image == rhs.image &&
        lhs.alignment == rhs.alignment
    }
}
