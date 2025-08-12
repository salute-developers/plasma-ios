import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabBarHasLabelClear {
    public static var l: GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.L> {
        var appearance = TabBarAppearance.base
        appearance.size = TabBarHasLabelClearSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TabBarHasLabelClear, TabBarAppearance, TabBarHasLabelClearVariation.M> {
        var appearance = TabBarAppearance.base
        appearance.size = TabBarHasLabelClearSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<TabBarAppearance>] = [
        TabBarHasLabelClear.l.variation,
        TabBarHasLabelClear.l.divider.variation,
        TabBarHasLabelClear.l.divider.rounded.variation,
        TabBarHasLabelClear.l.rounded.variation,
        TabBarHasLabelClear.l.shadow.variation,
        TabBarHasLabelClear.l.shadow.rounded.variation,
        TabBarHasLabelClear.m.variation,
        TabBarHasLabelClear.m.divider.variation,
        TabBarHasLabelClear.m.divider.rounded.variation,
        TabBarHasLabelClear.m.rounded.variation,
        TabBarHasLabelClear.m.shadow.variation,
        TabBarHasLabelClear.m.shadow.rounded.variation,
    ]
}

public struct TabBarHasLabelClearVariation {
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
