import Foundation
import SDDSComponents
import SDDSThemeCore

public extension AppearanceVariation<CounterAppearance> {
    var large: Self {
        .init(
            appearance: appearance
                .size(CounterSize.large)
                .textTypography(SDDSCounter.textTypography)
        )
    }
    var medium: Self {
        .init(
            appearance: appearance
                .size(CounterSize.medium)
                .textTypography(SDDSCounter.textTypography)
        )
    }
    var small: Self {
        .init(
            appearance: appearance
                .size(CounterSize.small)
                .textTypography(SDDSCounter.textTypography)
        )
    }
    var extraSmall: Self {
        .init(
            appearance: appearance
                .size(CounterSize.extraSmall)
                .textTypography(SDDSCounter.textTypography)
        )
    }
    var extraExtraSmall: Self {
        .init(
            appearance: appearance
                .size(CounterSize.extraExtraSmall)
                .textTypography(SDDSCounter.textTypography)
        )
    }
}

public extension SDDSCounter {
    static var large: AppearanceVariation<CounterAppearance> {
        return AppearanceVariation(appearance: CounterAppearance()).large
    }
    static var medium: AppearanceVariation<CounterAppearance> {
        return AppearanceVariation(appearance: CounterAppearance()).medium
    }
    static var small: AppearanceVariation<CounterAppearance> {
        return AppearanceVariation(appearance: CounterAppearance()).small
    }
    static var extraSmall: AppearanceVariation<CounterAppearance> {
        return AppearanceVariation(appearance: CounterAppearance()).extraSmall
    }
    static var extraExtraSmall: AppearanceVariation<CounterAppearance> {
        return AppearanceVariation(appearance: CounterAppearance()).extraExtraSmall
    }
}

