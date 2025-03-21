import Foundation
import SDDSComponents

struct SegmentItemTypography: GeneralTypographyConfiguration {
    typealias S = SegmentItemSizeConfiguration
    
    let extraLarge: TypographyToken?
    let large: TypographyToken?
    let medium: TypographyToken?
    let small: TypographyToken?
    let extraSmall: TypographyToken?
    
    init(
        extraLarge: TypographyToken?,
        large: TypographyToken?,
        medium: TypographyToken?,
        small: TypographyToken?,
        extraSmall: TypographyToken?
    ) {
        self.extraLarge = extraLarge
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
    func typography(with size: SegmentItemSizeConfiguration) -> TypographyToken? {
        switch size as? SegmentItemSize {
        case .extraLarge:
            return extraLarge
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

extension SegmentItemTypography {
    static var titleTypography: TypographyConfiguration {
        SegmentItemTypography(
            extraLarge: AdaptiveTypographyToken.bodyLBold.typography,
            large: AdaptiveTypographyToken.bodyLBold.typography,
            medium: AdaptiveTypographyToken.bodyMBold.typography,
            small: AdaptiveTypographyToken.bodySBold.typography,
            extraSmall: AdaptiveTypographyToken.bodyXsBold.typography
        )
        .asContainer
    }
    static var subtitleTypography: TypographyConfiguration {
        SegmentItemTypography(
            extraLarge: AdaptiveTypographyToken.bodyLBold.typography,
            large: AdaptiveTypographyToken.bodyLBold.typography,
            medium: AdaptiveTypographyToken.bodyMBold.typography,
            small: AdaptiveTypographyToken.bodySBold.typography,
            extraSmall: AdaptiveTypographyToken.bodyXsBold.typography
        )
        .asContainer
    }
}
