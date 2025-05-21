import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Popover {
    public static var m: ComponentAppearanceVariation<Popover, PopoverAppearance> {
        var appearance = PopoverAppearance.base
        appearance.size = PopoverSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<Popover, PopoverAppearance> {
        var appearance = PopoverAppearance.base
        appearance.size = PopoverSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<PopoverAppearance>] = [
        Popover.m.variation,
        Popover.s.variation,
    ]
}

public struct PopoverVariation {
    public struct M {}
    public struct S {}
}

private extension PopoverAppearance {
    static var base: PopoverAppearance {
        var appearance = PopoverAppearance()
        appearance.shadow = ShadowToken.downHardM
        return appearance
    }
}
