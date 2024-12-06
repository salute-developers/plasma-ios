import Foundation

/**
 `ChipBorderStyle` определяет стиль границы для чипа.
 
 - `default`: Стиль по умолчанию с заданным радиусом скругления.
 - `pilled`: Закругленный стиль с максимальным радиусом скругления.
 */
public enum ChipBorderStyle: Hashable {
    case `default`(_ cornerRadius: CGFloat)
    case pilled
    
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .default(let cornerRadius):
            hasher.combine("default")
            hasher.combine(cornerRadius)
        case .pilled:
            hasher.combine("pilled")
        }
    }
}
