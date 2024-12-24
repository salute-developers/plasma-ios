import Foundation
import SDDSComponents

public extension AppearanceVariation<RadioboxAppearance> {
    var `default`: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSRadiobox.default.appearance)
        )
    }
}

public extension SDDSRadiobox {
    static var `default`: AppearanceVariation<RadioboxAppearance> {
        .init(
            name: "default",
            appearance:
                .init(
                    titleTypography: RadioboxTypography.label,
                    subtitleTypography: RadioboxTypography.description,
                    titleColor: .backgroundInversePrimary,
                    subtitleColor: .surfaceInverseSolidPrimary.withOpacity(0.56),
                    disabledAlpha: 0.4
                )
        )
    }
    
    static var all: [AppearanceVariation<RadioboxAppearance>] {
        [
            SDDSRadiobox.default
        ]
    }
}
