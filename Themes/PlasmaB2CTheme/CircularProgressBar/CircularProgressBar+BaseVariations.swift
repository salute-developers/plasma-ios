import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct CircularProgressBar {
    public static var l: ComponentAppearanceVariation<CircularProgressBar, CircularProgressBarAppearance> {
        var appearance = CircularProgressBarAppearance.base
        appearance.size = CircularProgressBarSize.l
        appearance.valueEnabled = Bool(false)

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<CircularProgressBar, CircularProgressBarAppearance> {
        var appearance = CircularProgressBarAppearance.base
        appearance.size = CircularProgressBarSize.m
        appearance.valueEnabled = Bool(false)

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<CircularProgressBar, CircularProgressBarAppearance> {
        var appearance = CircularProgressBarAppearance.base
        appearance.size = CircularProgressBarSize.s
        appearance.valueEnabled = Bool(false)

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: ComponentAppearanceVariation<CircularProgressBar, CircularProgressBarAppearance> {
        var appearance = CircularProgressBarAppearance.base
        appearance.size = CircularProgressBarSize.xl
        appearance.valueTypography = CircularProgressBarTypography(oneSize: Typographies.headerH5Bold.typography).asContainer

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<CircularProgressBar, CircularProgressBarAppearance> {
        var appearance = CircularProgressBarAppearance.base
        appearance.size = CircularProgressBarSize.xs
        appearance.valueEnabled = Bool(false)

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    public static var xxl: ComponentAppearanceVariation<CircularProgressBar, CircularProgressBarAppearance> {
        var appearance = CircularProgressBarAppearance.base
        appearance.size = CircularProgressBarSize.xxl
        appearance.valueTypography = CircularProgressBarTypography(oneSize: Typographies.headerH2Bold.typography).asContainer

        return .init(
            name: "xxl",
            appearance: appearance
        )
    }
    public static var xxs: ComponentAppearanceVariation<CircularProgressBar, CircularProgressBarAppearance> {
        var appearance = CircularProgressBarAppearance.base
        appearance.size = CircularProgressBarSize.xxs
        appearance.valueEnabled = Bool(false)

        return .init(
            name: "xxs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<CircularProgressBarAppearance>] = [
        CircularProgressBar.l.variation,
        CircularProgressBar.m.variation,
        CircularProgressBar.s.variation,
        CircularProgressBar.xl.variation,
        CircularProgressBar.xs.variation,
        CircularProgressBar.xxl.variation,
        CircularProgressBar.xxs.variation,
    ]
}

public struct CircularProgressBarVariation {
    public struct L {}
    public struct M {}
    public struct S {}
    public struct Xl {}
    public struct Xs {}
    public struct Xxl {}
    public struct Xxs {}
}

private extension CircularProgressBarAppearance {
    static var base: CircularProgressBarAppearance {
        var appearance = CircularProgressBarAppearance()
        appearance.trackColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.valueColor = ColorToken.textDefaultPrimary
        appearance.valueEnabled = Bool(true)
        return appearance
    }
}
