import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabBarClear {
    public static var l: GeneralAppearanceVariation<TabBarClear, TabBarAppearance, TabBarClearVariation.L> {
        var appearance = TabBarAppearance.base
        appearance.size = TabBarClearSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TabBarClear, TabBarAppearance, TabBarClearVariation.M> {
        var appearance = TabBarAppearance.base
        appearance.size = TabBarClearSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<TabBarAppearance>] = [
        TabBarClear.l.variation,
        TabBarClear.l.divider.variation,
        TabBarClear.l.divider.rounded.variation,
        TabBarClear.l.rounded.variation,
        TabBarClear.l.shadow.variation,
        TabBarClear.l.shadow.rounded.variation,
        TabBarClear.m.variation,
        TabBarClear.m.divider.variation,
        TabBarClear.m.divider.rounded.variation,
        TabBarClear.m.rounded.variation,
        TabBarClear.m.shadow.variation,
        TabBarClear.m.shadow.rounded.variation,
    ]
}

public struct TabBarClearVariation {
    public struct L {}
    public struct LDivider {}
    public struct LDividerRounded {}
    public struct LRounded {}
    public struct LShadow {}
    public struct LShadowRounded {}
    public struct M {}
    public struct MDivider {}
    public struct MDividerRounded {}
    public struct MRounded {}
    public struct MShadow {}
    public struct MShadowRounded {}
}

private extension TabBarAppearance {
    static var base: TabBarAppearance {
        var appearance = TabBarAppearance()
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard
        return appearance
    }
}
