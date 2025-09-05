import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabBar {
    public static var l: GeneralAppearanceVariation<TabBar, TabBarAppearance, TabBarVariation.L> {
        var appearance = TabBarAppearance.base
        appearance.size = TabBarSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TabBar, TabBarAppearance, TabBarVariation.M> {
        var appearance = TabBarAppearance.base
        appearance.size = TabBarSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<TabBarAppearance>] = [
        TabBar.l.variation,
        TabBar.l.divider.variation,
        TabBar.l.divider.rounded.variation,
        TabBar.l.rounded.variation,
        TabBar.l.shadow.variation,
        TabBar.l.shadow.rounded.variation,
        TabBar.m.variation,
        TabBar.m.divider.variation,
        TabBar.m.divider.rounded.variation,
        TabBar.m.rounded.variation,
        TabBar.m.shadow.variation,
        TabBar.m.shadow.rounded.variation,
    ]
}

public struct TabBarVariation {
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
