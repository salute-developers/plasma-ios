import Foundation
import SDDSComponents

public struct SegmentElementTypography: GeneralTypographyConfiguration {
    typealias S = SegmentElementSizeConfiguration
    
    let large: TypographyToken?
    let medium: TypographyToken?
    let small: TypographyToken?
    let extraSmall: TypographyToken?
    
    init(large: TypographyToken?, medium: TypographyToken?, small: TypographyToken?, extraSmall: TypographyToken?) {
        self.large = large
        self.medium = medium
        self.small = small
        self.extraSmall = extraSmall
    }
    
    /**
     Возвращает типографику для заданного размера кнопки.
     
     - Parameter size: Размер кнопки.
     - Returns: Типографика для заданного размера кнопки или nil, если не задана.
     */
    public func typography(with size: SegmentElementSizeConfiguration) -> TypographyToken? {
        switch size as? SegmentElementSize {
        case .large:
            return large
        case .medium:
            return medium
        case .small:
            return small
        case .extraSmall:
            return extraSmall
        case .none:
            return medium
        }
    }
}