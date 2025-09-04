import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct IconButton {
    public static var l: GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.L> {
        var appearance = ButtonAppearance.base
        appearance.size = IconButtonSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.M> {
        var appearance = ButtonAppearance.base
        appearance.size = IconButtonSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.S> {
        var appearance = ButtonAppearance.base
        appearance.size = IconButtonSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<IconButton, ButtonAppearance, IconButtonVariation.Xs> {
        var appearance = ButtonAppearance.base
        appearance.size = IconButtonSize.xs

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ButtonAppearance>] = [
        IconButton.l.variation,
        IconButton.l.pilled.variation,
        IconButton.m.variation,
        IconButton.m.pilled.variation,
        IconButton.s.variation,
        IconButton.s.pilled.variation,
        IconButton.xs.variation,
        IconButton.xs.pilled.variation,
    ]
}

public struct IconButtonVariation {
    public struct L {}
    public struct LPilled {}
    public struct M {}
    public struct MPilled {}
    public struct S {}
    public struct SPilled {}
    public struct Xs {}
    public struct XsPilled {}
}

private extension ButtonAppearance {
    static var base: ButtonAppearance {
        var appearance = ButtonAppearance()
        appearance.disabledAlpha = CGFloat(0.4)
        appearance.loadingAlpha = CGFloat(0.0)
        return appearance
    }
}
