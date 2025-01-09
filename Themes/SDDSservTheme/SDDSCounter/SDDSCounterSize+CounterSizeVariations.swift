import Foundation
import SDDSComponents
import SDDSThemeCore

public extension CounterAppearanceVariation {
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

