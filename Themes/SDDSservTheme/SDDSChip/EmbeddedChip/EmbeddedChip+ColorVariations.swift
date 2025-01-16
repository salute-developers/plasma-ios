import Foundation
import SDDSComponents
import SDDSServTheme

public extension ComponentAppearanceVariation<EmbeddedChip, ChipAppearance> {
    var secondary: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: EmbeddedChip.secondary.appearance)
        )
    }
}

public extension EmbeddedChip {
    static var secondary: ComponentAppearanceVariation<EmbeddedChip, ChipAppearance> {
        .init(
            name: "secondary",
            appearance: ChipAppearance(
                titleColor: .textDefaultPrimary,
                titleTypography: EmbeddedChipTypography.title,
                imageTintColor: .textDefaultPrimary,
                buttonTintColor: .textDefaultPrimary,
                backgroundColor: .surfaceDefaultTransparentSecondary,
                disabledAlpha: 0.5
            )
        )
    }
}
