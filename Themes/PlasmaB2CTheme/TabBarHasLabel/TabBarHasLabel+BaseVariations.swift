import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabBarHasLabel {
    public static var l: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.L> {
        var appearance = TabBarAppearance.base
        appearance.size = TabBarHasLabelSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TabBarHasLabel, TabBarAppearance, TabBarHasLabelVariation.M> {
        var appearance = TabBarAppearance.base
        appearance.size = TabBarHasLabelSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<TabBarAppearance>] = [
        TabBarHasLabel.l.variation,
        TabBarHasLabel.l.divider.variation,
        TabBarHasLabel.l.divider.rounded.variation,
        TabBarHasLabel.l.rounded.variation,
        TabBarHasLabel.l.shadow.variation,
        TabBarHasLabel.l.shadow.rounded.variation,
        TabBarHasLabel.m.variation,
        TabBarHasLabel.m.divider.variation,
        TabBarHasLabel.m.divider.rounded.variation,
        TabBarHasLabel.m.rounded.variation,
        TabBarHasLabel.m.shadow.variation,
        TabBarHasLabel.m.shadow.rounded.variation,
    ]
}

public struct TabBarHasLabelVariation {
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
