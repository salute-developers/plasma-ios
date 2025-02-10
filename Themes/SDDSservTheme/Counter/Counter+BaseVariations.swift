import Foundation
import SDDSComponents
import SDDSThemeCore

public struct Counter {
    public static var l: ComponentAppearanceVariation<Counter, CounterAppearance> {
        var appearance = CounterAppearance()
        appearance.size = CounterSize.large
        appearance.textTypography = CounterTypography.textTypography
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<Counter, CounterAppearance> {
        var appearance = CounterAppearance()
        appearance.size = CounterSize.medium
        appearance.textTypography = CounterTypography.textTypography
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<Counter, CounterAppearance> {
        var appearance = CounterAppearance()
        appearance.size = CounterSize.small
        appearance.textTypography = CounterTypography.textTypography
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<Counter, CounterAppearance> {
        var appearance = CounterAppearance()
        appearance.size = CounterSize.extraSmall
        appearance.textTypography = CounterTypography.textTypography
        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    public static var xxs: ComponentAppearanceVariation<Counter, CounterAppearance> {
        var appearance = CounterAppearance()
        appearance.size = CounterSize.extraExtraSmall
        appearance.textTypography = CounterTypography.textTypography
        return .init(
            name: "xxs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<CounterAppearance>] = [
        l,
        m,
        s,
        xs,
        xxs
    ].map { $0.variation }
}
