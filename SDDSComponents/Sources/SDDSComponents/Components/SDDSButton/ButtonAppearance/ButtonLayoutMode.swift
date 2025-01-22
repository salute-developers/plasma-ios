import Foundation
import SwiftUI

/**
 `ButtonLayoutMode` определяет различные режимы макета для кнопки.

 - Cases:
    - wrapContent: Кнопка автоматически подстраивает свой размер в зависимости от содержимого.
    - fixedWidth: Кнопка имеет фиксированную ширину с выравниванием содержимого (центрированное или бок о бок).
    - square: Кнопка имеет квадратную форму, где высота равна ширине.
    - circle: Кнопка имеет круглую форму, где высота равна ширине.

 - Properties:
    - isCentered: Возвращает true, если содержимое кнопки должно быть центрировано (для режима fixedWidth с центровкой).
    - isSideBySide: Возвращает true, если содержимое кнопки должно быть расположено бок о бок (для режима fixedWidth с выравниванием бок о бок).
    - title: Возвращает строку, представляющую название режима макета.
 */
public enum ButtonLayoutMode: CaseIterable, Hashable {

    /**
     Кнопка автоматически подстраивает свой размер в зависимости от содержимого.
     */
    case wrapContent
    
    /**
     Кнопка имеет фиксированную ширину с выравниванием содержимого (центрированное или бок о бок).
     
     - Parameters:
        - alignment: Выравнивание содержимого внутри фиксированной ширины (центрированное или бок о бок).
     */
    case fixedWidth(ButtonContentAlignment)
    
    /**
     Возвращает true, если содержимое кнопки должно быть центрировано (для режима fixedWidth с центровкой).
     */
    var isCentered: Bool {
        switch self {
        case .wrapContent:
            return false
        case .fixedWidth(let alignment):
            return alignment == .packed
        }
    }
    
    /**
     Возвращает true, если содержимое кнопки должно быть расположено бок о бок (для режима fixedWidth с выравниванием бок о бок).
     */
    var isSideBySide: Bool {
        switch self {
        case .wrapContent:
            return false
        case .fixedWidth(let alignment):
            return alignment == .spaceBetween
        }
    }
    
    /**
     Возвращает строку, представляющую название режима макета.
     */
    public var title: String {
        switch self {
        case .wrapContent:
            return "Wrap Content"
        case .fixedWidth(let alignment):
            switch alignment {
            case .packed:
                return "Packed"
            case .spaceBetween:
                return "Space Between"
            }
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    /**
     Все возможные случаи `ButtonLayoutMode`.
     */
    public static var allCases: [ButtonLayoutMode] {
        return [.wrapContent, .fixedWidth(.packed), .fixedWidth(.spaceBetween)]
    }
}
