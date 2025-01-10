import Foundation

/**
 `ComponentShapeStyle` определяет стиль границы для чипа.
 
 - `cornered`: Стиль по умолчанию с заданным радиусом скругления.
 - `pilled`: Закругленный стиль с максимальным радиусом скругления.
 */
public enum ComponentShapeStyle: Hashable {
    case cornered
    case pilled
    
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .cornered:
            hasher.combine("cornered")
        case .pilled:
            hasher.combine("pilled")
        }
    }
}
