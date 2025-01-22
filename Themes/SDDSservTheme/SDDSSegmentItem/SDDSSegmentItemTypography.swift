import Foundation
import SDDSComponents

public struct SegmentItemTypography: GeneralTypographyConfiguration {
    typealias S = SegmentItemSizeConfiguration
    
    let large: TypographyToken?
    let medium: TypographyToken?
    let small: TypographyToken?
    let extraSmall: TypographyToken?
    
    init(
        large: TypographyToken?,
        medium: TypographyToken?,
        small: TypographyToken?,
        extraSmall: TypographyToken?
    ) {
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
    public func typography(with size: SegmentItemSizeConfiguration) -> TypographyToken? {
        switch size as? SegmentItemSize {
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
