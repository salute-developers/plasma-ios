import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct IconButton {
    public static var l: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = IconButtonSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = IconButtonSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = IconButtonSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ButtonAppearance>] = [
        IconButton.l.variation,
        IconButton.m.variation,
        IconButton.s.variation,
    ]
}

public struct IconButtonVariation {
    public struct L {}
    public struct M {}
    public struct S {}
}

private extension ButtonAppearance {
    static var base: ButtonAppearance {
        var appearance = ButtonAppearance()
        appearance.disabledAlpha = CGFloat(0.4)
        appearance.loadingAlpha = CGFloat(0.0)
        return appearance
    }
}
