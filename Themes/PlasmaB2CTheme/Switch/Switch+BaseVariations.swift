import Foundation
import SDDSComponents
import SDDSThemeCore

public struct Switch {
    public static var l: ComponentAppearanceVariation<Switch, SwitchAppearance> {
        var appearance = SwitchAppearance.base
        appearance.size = SDDSSwitchSize.large
        appearance.titleTypography = SwitchTypography.label
        appearance.subtitleTypography = SwitchTypography.description
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    public static var m: ComponentAppearanceVariation<Switch, SwitchAppearance> {
        var appearance = SwitchAppearance.base
        appearance.size = SDDSSwitchSize.medium
        appearance.titleTypography = SwitchTypography.label
        appearance.subtitleTypography = SwitchTypography.description
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static var s: ComponentAppearanceVariation<Switch, SwitchAppearance> {
        var appearance = SwitchAppearance.base
        appearance.size = SDDSSwitchSize.small
        appearance.titleTypography = SwitchTypography.label
        appearance.subtitleTypography = SwitchTypography.description
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<SwitchAppearance>] = [l, m, s].map { $0.variation }
}

extension SwitchAppearance {
    static var base: SwitchAppearance {
        SwitchAppearance(
            titleTypography: SwitchTypography.label,
            subtitleTypography: SwitchTypography.description,
            titleColor: .backgroundInversePrimary,
            subtitleColor: .surfaceInverseSolidPrimary.withOpacity(0.56),
            tintColor: .surfaceDefaultAccent,
            disabledAlpha: 0.4
        )
    }
}
