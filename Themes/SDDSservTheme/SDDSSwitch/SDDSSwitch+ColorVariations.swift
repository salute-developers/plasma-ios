import Foundation
import SDDSComponents
import SDDSServTheme

public extension AppearanceVariation<SwitchAppearance> {
    var `default`: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSSwitch.default.appearance)
        )
    }
}

public extension SDDSSwitch {
    static var `default`: AppearanceVariation<SwitchAppearance> {
        .init(
            name: "default",
            appearance: SwitchAppearance(
                titleTypography: SwitchTypography.label,
                subtitleTypography: SwitchTypography.description,
                titleColor: .backgroundInversePrimary,
                subtitleColor: .surfaceInverseSolidPrimary.withOpacity(0.56),
                tintColor: .surfaceDefaultAccent,
                disabledAlpha: 0.4
            )
        )
    }
    
    static var all: [AppearanceVariation<SwitchAppearance>] {
        [
            SDDSSwitch.default
        ]
    }
}
