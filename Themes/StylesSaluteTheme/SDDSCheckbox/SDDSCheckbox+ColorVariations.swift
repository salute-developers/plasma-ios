import Foundation
import SDDSComponents

public extension AppearanceVariation<CheckboxAppearance> {
    var `default`: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSCheckbox.default.appearance)
        )
    }
}

public extension SDDSCheckbox {
    static var `default`: AppearanceVariation<CheckboxAppearance> {
        .init(
            name: "default",
            appearance:
                .init(
                    titleTypography: CheckboxTypography.label,
                    subtitleTypography: CheckboxTypography.description,
                    titleColor: .backgroundInversePrimary,
                    subtitleColor: .surfaceInverseSolidPrimary.withOpacity(0.56),
                    disabledAlpha: 0.4
                )
        )
    }
    
    static var all: [AppearanceVariation<CheckboxAppearance>] {
        [
            SDDSCheckbox.default
        ]
    }
}
