import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Spinner {
    public static var m: ComponentAppearanceVariation<Spinner, SpinnerAppearance> {
        var appearance = SpinnerAppearance.base
        appearance.size = SpinnerSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<Spinner, SpinnerAppearance> {
        var appearance = SpinnerAppearance.base
        appearance.size = SpinnerSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var scalable: ComponentAppearanceVariation<Spinner, SpinnerAppearance> {
        var appearance = SpinnerAppearance.base
        appearance.size = SpinnerSize.scalable

        return .init(
            name: "scalable",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<Spinner, SpinnerAppearance> {
        var appearance = SpinnerAppearance.base
        appearance.size = SpinnerSize.xs

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    public static var xxs: ComponentAppearanceVariation<Spinner, SpinnerAppearance> {
        var appearance = SpinnerAppearance.base
        appearance.size = SpinnerSize.xxs

        return .init(
            name: "xxs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<SpinnerAppearance>] = [
        Spinner.m.variation,
        Spinner.s.variation,
        Spinner.scalable.variation,
        Spinner.xs.variation,
        Spinner.xxs.variation,
    ]
}

public struct SpinnerVariation {
    public struct M {}
    public struct S {}
    public struct Scalable {}
    public struct Xs {}
    public struct Xxs {}
}

private extension SpinnerAppearance {
    static var base: SpinnerAppearance {
        var appearance = SpinnerAppearance()
        appearance.backgroundColor = ColorToken.surfaceDefaultClear
        appearance.strokeCap = StrokeCap.round
        return appearance
    }
}
