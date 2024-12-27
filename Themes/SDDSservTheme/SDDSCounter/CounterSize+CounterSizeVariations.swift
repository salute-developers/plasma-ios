import Foundation
import SDDSComponents
import SDDSThemeCore

public extension CounterAppearanceVariation {
    var large: Self {
        .init(
            appearance: appearance
                .size(CounterSize.large)
                .dataTypography(SDDSCounter.dataTypography)
        )
    }
    var medium: Self {
        .init(
            appearance: appearance
                .size(CounterSize.medium)
                .dataTypography(SDDSCounter.dataTypography)
        )
    }
    var small: Self {
        .init(
            appearance: appearance
                .size(CounterSize.small)
                .dataTypography(SDDSCounter.dataTypography)
        )
    }
    var extraSmall: Self {
        .init(
            appearance: appearance
                .size(CounterSize.extraSmall)
                .dataTypography(SDDSCounter.dataTypography)
        )
    }
    var extraExtraSmall: Self {
        .init(
            appearance: appearance
                .size(CounterSize.extraExtraSmall)
                .dataTypography(SDDSCounter.dataTypography)
        )
    }
}

public extension SDDSCounter {
    static var large: CounterAppearanceVariation {
        return CounterAppearanceVariation().large
    }
    static var medium: CounterAppearanceVariation {
        return CounterAppearanceVariation().medium
    }
    static var small: CounterAppearanceVariation {
        return CounterAppearanceVariation().small
    }
    static var extraSmall: CounterAppearanceVariation {
        return CounterAppearanceVariation().extraSmall
    }
    static var extraExtraSmall: CounterAppearanceVariation {
        return CounterAppearanceVariation().extraExtraSmall
    }
}

