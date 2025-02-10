import Foundation
import SDDSComponents

struct CounterTypography: GeneralTypographyConfiguration {
    typealias S = CounterSizeConfiguration
    
    let large: TypographyToken?
    let medium: TypographyToken?
    let small: TypographyToken?
    let extraSmall: TypographyToken?
    let extraExtraSmall: TypographyToken?
    
    init(
        large: TypographyToken?,
        medium: TypographyToken?,
        small: TypographyToken?,
        extraSmall: TypographyToken?,
        extraExtraSmall: TypographyToken?
    ) {
        self.large = large
        self.medium = medium
        self.small = small
        self.extraSmall = extraSmall
        self.extraExtraSmall = extraExtraSmall
    }
    
    func typography(with size: CounterSizeConfiguration) -> TypographyToken? {
        switch size as? CounterSize {
        case .large: return large
        case .medium: return medium
        case .small: return small
        case .extraSmall: return extraSmall
        case .extraExtraSmall: return extraExtraSmall
        case .none: return nil
        }
    }
}

extension CounterTypography {
    static var textTypography: TypographyConfiguration {
        CounterTypography(
            large: AdaptiveTypographyToken.bodySNormal.typography,
            medium: AdaptiveTypographyToken.bodyXsNormal.typography,
            small: AdaptiveTypographyToken.bodyXxsNormal.typography,
            extraSmall: AdaptiveTypographyToken.bodyXxsNormal.typography,
            extraExtraSmall: AdaptiveTypographyToken.bodyXxsNormal.typography
        )
        .asContainer
    }
}
